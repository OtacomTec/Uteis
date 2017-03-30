// newObjects ScriptManager2 - samples
// simple script shell

#include "stdafx.h"


// Errors
#define     SHERR_OK                    0
#define     SHERR_LOADENGINEFAILED      1
#define     SHERR_LOADSCRIPTFAILED      2
#define     SHERR_INVALIDHOST           3
#define     SHERR_SCRIPTERROR           4
#define     SHERR_SCRIPTRUNTIME         5

int ReturnError(int nError,char* szDescription = NULL) {
    switch (nError) {
    case SHERR_OK: return 0;
    case SHERR_LOADENGINEFAILED:
        printf("Error: Load script engine failed!\n");
    break;
    case SHERR_LOADSCRIPTFAILED:
        printf("Error: Load script failed!\n");  
    break;
    case SHERR_INVALIDHOST:
        printf("Error: ScriptManager2 failure - check is the control registered!\n");
    break;
    case SHERR_SCRIPTERROR:
        printf("Error: Script initialization error!\n");
    break;
    case SHERR_SCRIPTRUNTIME:
        printf("Error: Script run-time error!\n");
    break;
    default:
        printf("Error: Unknown\n");
    }
    if (szDescription) {
        printf("\t%s\n",szDescription);
    }
    return nError;
}

SCPHOSTCLNT* pScript;

int LoadScript(char* szScriptFile,char* szLanguage) {
    if (!pScript) return ReturnError(SHERR_INVALIDHOST);
    if (!pScript->Success()) return ReturnError(SHERR_INVALIDHOST);
    if (!pScript->LoadEngine(szLanguage)) return ReturnError(SHERR_LOADENGINEFAILED);
    char*   lpsz = NULL;
    int     f;
    f = _open(szScriptFile,_O_RDONLY);
    if (f == -1) return ReturnError(SHERR_LOADSCRIPTFAILED,"File open error");
    long    fsize = _filelength(f);
    if (fsize == -1) {
        _close(f);
        return ReturnError(SHERR_LOADSCRIPTFAILED,"get file size failed");
    }
    printf("Script file size: %d\n",fsize);
    lpsz = new char[fsize + 1];
    if (!lpsz) {
        _close(f);
        return ReturnError(SHERR_LOADSCRIPTFAILED,"memory allocation error");
    }
    int nRead = _read(f,lpsz,(unsigned long)fsize);
    if (nRead <= 0) {
        delete [] lpsz;
        _close(f);
        return ReturnError(SHERR_LOADSCRIPTFAILED,"can not read file");
    }
    lpsz[nRead] = '\0';
    char    _l[1024];
    if (!pScript->AddCode(lpsz)) {
        delete [] lpsz;
        _close(f);
        pScript->GetLastError(_l,1023);
        return ReturnError(SHERR_LOADSCRIPTFAILED,_l);
    }
    delete [] lpsz;
    _close(f);
    if (!pScript->Run()) {
        pScript->GetLastError(_l,1023);
        return ReturnError(SHERR_SCRIPTERROR,_l);
    }
    return 0;
}
char* FindNextToken(char* lpsz,char** lpszCurrent) {
    int     j,i,l = strlen(lpsz);
    int     b = 0;
    int     ending = 0;
    *lpszCurrent = NULL;
    if (!l) return NULL;
    for (j = 0; j < l; j++) {
        if (lpsz[j] == ' ' || lpsz[j] == '\t') continue;
        *lpszCurrent = &(lpsz[j]);
        break;
    }
    if (lpsz[j] == '"') {
        b = 1;
        j ++;
    }
    for (i = j; i < l; i++) {
        if (b) {
            if (lpsz[i] == '"') b = 0;
            else continue;
        }
        if (lpsz[i] == ' ' || lpsz[i] == '\t') ending = i;
        if (ending && (lpsz[i] != ' ' || lpsz[i] != '\t')) {
            lpsz[ending] = '\0';
            return &(lpsz[i+1]);
        }
    }
    return &(lpsz[i]);
}

char* ClearQuotes(char* lpsz) {
    char*   sz = lpsz;
    int     l = strlen(lpsz);
    if (lpsz[0] == '"') sz = &(lpsz[1]);
    if (lpsz[l - 1] == '"') lpsz[l - 1] = '\0';
    return sz;    
}
int DispatchCommand(DISPCALLER& script,char* lpsz) {
    // Tokenization - manual
    char*   lpszCurrent = NULL;
    char*   lpszNext = lpsz;
    char*   lpszCommand = NULL;
    int     r = 0;
    printf ("\n");
    lpszNext = FindNextToken(lpszNext,&lpszCurrent);
    lpszCommand = lpszCurrent;
    if (lpszCommand) {
        if (strlen(lpszCommand)) {
            if (stricmp(lpszCommand,"reload") == 0) {
                printf ("Reloading ...\n");
                return 1;
            }
            if (stricmp(lpszCommand,"exit") == 0) {
                printf ("Exiting ...\n");
                return 2;
            }
            printf (lpszCommand);
            while (lpszNext) {
                lpszNext = FindNextToken(lpszNext,&lpszCurrent);
                if (lpszCurrent) {
                    printf (" %s",lpszCurrent);
                    script << ClearQuotes(lpszCurrent);
                }
            }
            printf ("\n",lpszCurrent);
            VARIANT var = script.VariantCall(lpszCommand);
            if (var.vt == VT_ERROR) {
                char _l[1024];
                // <winerror.h>
                switch (var.scode) {
                case DISP_E_UNKNOWNNAME:
                    strcpy(_l,"Command not found!");
                break;
                default:
                    pScript->GetLastError(_l,1023);
                }
                
                
                ReturnError(SHERR_SCRIPTRUNTIME,_l);
                VariantClear(&var);
            }
            VARIANT v;
            VariantInit(&v);
            HRESULT hr = VariantChangeType(&v,&var,0,VT_BSTR);
            if (!FAILED(hr)) {
                wprintf(L"%s\n",v.bstrVal);
                VariantClear(&v);
            }
            VariantClear(&var);
        }
    }
    printf ("\n");
    return r;
}

int main(int argc, char* argv[]) {
    CoInitialize(NULL);
	printf("newObjects ScriptManager2 samples\n");
    printf(" console - simple extendable shell\n");
    printf("==================================\n");
    pScript = new SCPHOSTCLNT;
    int nErr = 0;
    char*   language = "JScript";
    char*   file     = "script.js";
    if (argc > 2) {
        language = argv[1];
        file =  argv[2];
    }
    nErr = LoadScript(file,language);
    if (!nErr) {
        DISPCALLER  script;
        script <= pScript->GetScriptDispatch();
        char    _l[2048];
        do {
            _l[0] = '\0';
            printf("$");
            gets(_l);
            nErr = DispatchCommand(script,_l);
            switch (nErr) {
            case 1: // reload
                script <= NULL;
                pScript->Close();
                pScript->Clear();
                nErr = LoadScript(file,language);
                if (nErr) {
                    script <= NULL;
                    delete pScript;
                    CoUninitialize();
	                return nErr;
                }
                script <= pScript->GetScriptDispatch();
            break;
            case 2: // exit
                script <= NULL;
                delete pScript;
                CoUninitialize();
	            return 0;
            break;
            }
        } while (1);
    }
    delete pScript;
    CoUninitialize();
	return nErr;
}

