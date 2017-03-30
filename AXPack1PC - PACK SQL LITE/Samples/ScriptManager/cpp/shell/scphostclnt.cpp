// HEADER FILES INCLUDED
// These includes are given here only as an example
// Before compiling your project please review them and include here
// only the required ones.
// Different libraries (like MFC or Jaked-Objects) may have common
// project include file - it is a good idea to replace these headers with it.
#include "stdafx.h"
// END OF HEADER FILES

SCPHOSTCLNT::SCPHOSTCLNT() {
    m_pScpMan = NULL;
    CoCreateInstance(CLSID_ScpMan,NULL,CLSCTX_INPROC_SERVER,IID_IScpMan,(void**)&m_pScpMan);
}
SCPHOSTCLNT::~SCPHOSTCLNT() {
    Close();
    if (m_pScpMan) m_pScpMan->Release();
}
BOOL            SCPHOSTCLNT::Success() {
    return (m_pScpMan)?TRUE:FALSE;
}
int             SCPHOSTCLNT::Add(LPCTSTR szName,IDispatch* pDisp) {
        if (!szName || !pDisp) return 0;
        BSTR    bstrName = _PackInBSTR(szName);
        if (!bstrName) return 0;

        HRESULT hr;
        VARIANT varKey,varItem,varPlace;

        VariantInit(&varKey);
        VariantInit(&varItem);
        VariantInit(&varPlace);
        varKey.vt = VT_BSTR;
        varKey.bstrVal = bstrName;
        varItem.vt = VT_DISPATCH;
        varItem.pdispVal = pDisp;
        pDisp->AddRef();

        hr = m_pScpMan->Add(varKey,varItem,&varPlace);

        VariantClear(&varKey);
        VariantClear(&varItem);
        int nPlace = (int)varPlace.lVal;
        VariantClear(&varPlace);

        if (hr != S_OK) return 0;
        return nPlace;
}
int             SCPHOSTCLNT::Count() {
    long    l;
    HRESULT hr = m_pScpMan->get_Count(&l);
    if (!FAILED(hr)) return l;
    return -1;
}
IDispatch*      SCPHOSTCLNT::Item(LPCTSTR szName) {
    VARIANT     varIndex,varItem;

    if (!szName) return NULL;
    VariantInit(&varIndex); 
    VariantInit(&varItem);

    varIndex.vt = VT_BSTR;
    varIndex.bstrVal = _PackInBSTR(szName);

    if (!varIndex.bstrVal) return NULL;
    HRESULT hr = m_pScpMan->get_Item(varIndex,&varItem);
    VariantClear(&varIndex);
    if (FAILED(hr)) {
        return NULL;
    } else {
        return varItem.pdispVal; // must be released
    }
}
IDispatch*      SCPHOSTCLNT::Item(int nIndex) {
    VARIANT     varIndex,varItem;

    if (nIndex < 1) return NULL;
    VariantInit(&varIndex); 
    VariantInit(&varItem);

    varIndex.vt = VT_I4;
    varIndex.lVal = (long)nIndex;

    HRESULT hr = m_pScpMan->get_Item(varIndex,&varItem);
    VariantClear(&varIndex);
    if (FAILED(hr)) {
        return NULL;
    } else {
        return varItem.pdispVal; // must be released
    }
}
BOOL            SCPHOSTCLNT::Clear() {
    return (!FAILED(m_pScpMan->Clear()));
}
BOOL            SCPHOSTCLNT::Remove(LPCTSTR szName) {
    VARIANT     varIndex,varResult;
    if (!szName) return NULL;
    VariantInit(&varIndex); 
    VariantInit(&varResult);

    varIndex.vt = VT_BSTR;
    varIndex.bstrVal = _PackInBSTR(szName);

    if (!varIndex.bstrVal) return NULL;
    HRESULT hr = m_pScpMan->Remove(varIndex,&varResult);
    VariantClear(&varIndex);
    VariantClear(&varResult);
    if (hr == S_OK) return TRUE;
    return FALSE;
}
BOOL            SCPHOSTCLNT::Remove(int nIndex) {
    VARIANT     varIndex,varResult;
    if (nIndex < 1) return NULL;
    VariantInit(&varIndex); 
    VariantInit(&varResult);

    varIndex.vt = VT_I4;
    varIndex.lVal = (long)nIndex;

    HRESULT hr = m_pScpMan->Remove(varIndex,&varResult);
    VariantClear(&varIndex);
    VariantClear(&varResult);
    if (hr == S_OK) return TRUE;
    return FALSE;
}
BOOL            SCPHOSTCLNT::IsLocked() {
    BOOL    b;
    m_pScpMan->get_locked(&b);
    return b;
}
BOOL            SCPHOSTCLNT::LoadEngine(LPCTSTR szName) {
    BSTR    bstrName;
    if (!szName) return FALSE;
    bstrName = _PackInBSTR(szName);
    if (!bstrName) return FALSE;
    VARIANT varResult;
    VariantInit(&varResult);

    HRESULT hr = m_pScpMan->LoadEngine(bstrName,&varResult);
    VariantClear(&varResult);
    SysFreeString(bstrName);
    return (hr == S_OK);
}
BOOL            SCPHOSTCLNT::AddCode(LPCTSTR szCode) {
    BSTR    bstrCode;
    if (!szCode) return FALSE;
    bstrCode = _PackInBSTR(szCode);
    if (!bstrCode) return FALSE;
    VARIANT varResult;
    VariantInit(&varResult);

    HRESULT hr = m_pScpMan->AddText(bstrCode,&varResult);
    VariantClear(&varResult);
    SysFreeString(bstrCode);
    return (hr == S_OK);    
}
BOOL            SCPHOSTCLNT::Run() {
    VARIANT varResult;
    VariantInit(&varResult);
    HRESULT hr = m_pScpMan->Run(&varResult);
    VariantClear(&varResult);
    return (hr == S_OK);
}
BOOL            SCPHOSTCLNT::AddEventHandler(LPCTSTR szItem,LPCTSTR szSubItem,LPCTSTR szEvent,LPCTSTR szCode) {
    BSTR    bstrCode;
    BSTR    bstrItem;
    BSTR    bstrEvent;
    BSTR    bstrSubItem;
    if (!szCode || ! szItem || !szEvent) return FALSE;
    bstrCode = _PackInBSTR(szCode);
    bstrItem = _PackInBSTR(szItem);
    bstrEvent = _PackInBSTR(szEvent);
    bstrSubItem = _PackInBSTR(szSubItem);
    
    VARIANT varResult;
    VariantInit(&varResult);

    HRESULT hr = m_pScpMan->AddEventHandler(bstrItem,bstrSubItem,bstrEvent,bstrCode,&varResult);
    VariantClear(&varResult);
    SysFreeString(bstrCode);
    SysFreeString(bstrItem);
    SysFreeString(bstrEvent);
    SysFreeString(bstrSubItem);
    return (hr == S_OK);    
}
BOOL            SCPHOSTCLNT::Connect() {
    VARIANT varResult;
    VariantInit(&varResult);
    HRESULT hr = m_pScpMan->Connect(&varResult);
    VariantClear(&varResult);
    return (hr == S_OK);
}
BOOL            SCPHOSTCLNT::Stop() {
    return (m_pScpMan->Stop() == S_OK);
}
BOOL            SCPHOSTCLNT::Close() {
    return (!FAILED(m_pScpMan->Close()));
}
IDispatch*      SCPHOSTCLNT::GetScriptDispatch() {
    LPDISPATCH  pDisp;
    HRESULT hr = m_pScpMan->get_script(&pDisp);
    if (!FAILED(hr)) return pDisp; // must be released
    return NULL;
}
int             SCPHOSTCLNT::GetLastError(LPTSTR szBuff,int cChars) {
    BSTR    bstrError;
    HRESULT hr = m_pScpMan->get_lastError(&bstrError);
    int     n;
    if (!szBuff) {
        if (FAILED(hr)) return 0;
        n = lstrlenW(bstrError);
        SysFreeString(bstrError);
        return n;
    } else {
        if (FAILED(hr)) {
            szBuff[0] = '\0';
            return 0;        
        }
        n = lstrlenW(bstrError);
        if (cChars <= n) {
            SysFreeString(bstrError);            
            szBuff[0] = '\0';
            return 0;
        }
        #ifdef UNICODE
            lstrcpy(szBuff,bstrError);
            SysFreeString(bstrError);
            return n + 1;
        #else
            WideCharToMultiByte(CP_ACP,0,bstrError,-1,szBuff,cChars,NULL,NULL);
            SysFreeString(bstrError);
            return n + 1;
        #endif
    }
}
IDispatch*      SCPHOSTCLNT::GetSelfDispatch() {
    LPDISPATCH  pDisp = NULL;
    m_pScpMan->QueryInterface(IID_IDispatch,(void**)&pDisp);
    return pDisp;
}

// Functions
BSTR    _PackInBSTR(LPCTSTR sz) {
    if (!sz) return NULL;
    #ifdef UNICODE
        return SysAllocString(sz);
    #else
        register i = lstrlen(sz) + 1;
        LPWSTR   _pwsz = new WCHAR[i];
        BSTR     bstr;
        if (!_pwsz) return NULL;
        if (MultiByteToWideChar(CP_ACP,0,sz,-1,_pwsz,i)) {
            bstr = SysAllocString((LPCOLESTR)_pwsz);
            delete [] _pwsz;
            return bstr;
        }
        return NULL;
    #endif
}

// DISPCALLER


DISPCALLER& DISPCALLER::operator = (IDispatch* pDisp) {
    if (m_pDisp) m_pDisp->Release();
    DestroyArray();
    m_pDisp = pDisp;
    if (m_pDisp) m_pDisp->AddRef();
    return (*this);
}
DISPCALLER& DISPCALLER::operator <= (IDispatch* pDisp) {
    if (m_pDisp) m_pDisp->Release();
    DestroyArray();
    m_pDisp = pDisp;
    return (*this);
}
DISPCALLER& DISPCALLER::operator = (IUnknown* pUnk) {
    if (m_pDisp) m_pDisp->Release();
    DestroyArray();
    HRESULT hr = pUnk->QueryInterface(&m_pDisp);
    if (FAILED(hr)) m_pDisp = NULL;
    return (*this);
}
int     DISPCALLER::GetParamCount() {
    long    lBound;
    HRESULT hr;

    if (m_psaParameters) {
        hr = SafeArrayGetUBound(m_psaParameters,1, &lBound);
        if (FAILED(hr)) return 0;
        return lBound + 1;
    } else return 0;
}
bool	DISPCALLER::CreateArray() {
	if (m_psaParameters) return TRUE;

	SAFEARRAYBOUND	rgsabound[1];
	rgsabound[0].lLbound = 0;
	rgsabound[0].cElements = 0;

	m_psaParameters = SafeArrayCreate(VT_VARIANT,1,rgsabound);

    if (m_psaParameters) return true;
	return false;
}
bool	DISPCALLER::DestroyArray() {
    if (m_psaParameters) {
        SafeArrayDestroy(m_psaParameters);
        m_psaParameters = NULL;
    }
	return true;
}
bool	DISPCALLER::AddToArray(VARIANT* v) {
	SAFEARRAYBOUND	rgsabound[1];
	HRESULT			hr;
	long			lIndex;

    if (!m_psaParameters) {
        if (!CreateArray()) return false;
    }
	rgsabound[0].lLbound = 0;
	SafeArrayGetUBound(m_psaParameters,1, (long*)&(rgsabound[0].cElements) );
    
    if ((int)rgsabound[0].cElements < 0) rgsabound[0].cElements = 1;
	else rgsabound[0].cElements += 2;
	hr = SafeArrayRedim(m_psaParameters,rgsabound);
    
	if (FAILED(hr)) return false;

	lIndex = rgsabound[0].cElements - 1;
	hr = SafeArrayPutElement(m_psaParameters,&lIndex,v);
	if (FAILED(hr)) return false;
	return true;
}

// Operators

DISPCALLER& DISPCALLER::operator << (int v) {
    VARIANT     var;

    VariantInit(&var);
    var.vt      = VT_I4;
    var.lVal    = (long)v;

    if (!AddToArray(&var)) {
        // Error code
    }
    VariantClear(&var); // realy not needed here ;))
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (LPCTSTR v) {
    VARIANT     var;
    BSTR        bstrValue;

    VariantInit(&var);
    #ifdef UNICODE
        // no conversion
        bstrValue = SysAllocString(v);
    #else  // NO UNICODE
        // Conversion
        OLECHAR*    pwszValue;
        pwszValue = new OLECHAR[lstrlen(v) +1];
        // 
        if (MultiByteToWideChar(CP_ACP,0,v,-1,pwszValue,(lstrlen(v) +1))) {
            // conversion successful
            bstrValue = SysAllocString(pwszValue);
        } else {
            // Error
        }
        delete [] pwszValue;
    #endif // UNICODE 
    
    var.vt      = VT_BSTR;
    var.bstrVal = bstrValue;
    
    if (!AddToArray(&var)) {
        // Error code
    }
    
    VariantClear(&var); // Release this string
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (IUnknown* v) {
    VARIANT     var;

    VariantInit(&var);
    
    var.vt = VT_UNKNOWN;
    var.punkVal = v;
    v->AddRef();
     
    if (!AddToArray(&var)) {
        // Error code
    }
    VariantClear(&var); // Releases IUnknow
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (IDispatch* v) {
    VARIANT     var;

    VariantInit(&var);
    var.vt      = VT_DISPATCH;
    var.punkVal = v;
    v->AddRef();
    
    if (!AddToArray(&var)) {
        // Error code
    }

    VariantClear(&var); // Releases IDispatch
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (VARIANT v) {
    if (!AddToArray(&v)) {
        // Error code
    }
    return (*this);
}

// Helpers
VARIANT  DISPCALLER::VariantBool(bool b) {
    VARIANT     v;

    VariantInit(&v);
    v.vt        = VT_BOOL;
    v.boolVal   = (b)?TRUE:FALSE;
    return v;
}
VARIANT     DISPCALLER::VariantError(HRESULT hr) {
    VARIANT     v;

    VariantInit(&v);
    v.vt        = VT_ERROR;
    v.scode    = hr;
    return v;
}

// Callers

VARIANT     DISPCALLER::VariantCall(LPCTSTR szMethod) {
    HRESULT             hr;
    VARIANT             varResult;
    BSTR                bstrMethod;

    // Parameters are packed in the variant - this is not required 
    // but we have other plans

    if (!m_pDisp) {
        DestroyArray();
        return VariantError(E_NOINTERFACE);
    }
    
    VariantInit(&varResult);

    #ifdef UNICODE
        bstrMethod = SysAllocString(szMethod);
    #else   // NO UNICODE
        OLECHAR*    pwszMethod;
        pwszMethod = new OLECHAR[lstrlen(szMethod) +1];
        // 
        if (MultiByteToWideChar(CP_ACP,0,szMethod,-1,pwszMethod,(lstrlen(szMethod) +1))) {
            // conversion successful
            bstrMethod = SysAllocString(pwszMethod);
        } else {
            // Error
        }
        delete pwszMethod;
    #endif // UNICODE

    DISPID		dispid;

    hr = m_pDisp->GetIDsOfNames(IID_NULL,&bstrMethod,1,LOCALE_SYSTEM_DEFAULT,&dispid);
    SysFreeString(bstrMethod);
    if (FAILED(hr)) {         // <winerror.h>
        DestroyArray();
        return VariantError(hr);
    }

    long		lLBound,lUBound;
	long		lElements;
    DISPPARAMS	dispparams;

    if (m_psaParameters) {
		// In the parameters are more than 0 - they are packed in the array

		SafeArrayGetLBound(m_psaParameters,1,&lLBound);
		SafeArrayGetUBound(m_psaParameters,1,&lUBound);
		lElements = lUBound - lLBound + 1;
		if (lElements > 0) {
			// more than 0
            hr = SafeArrayAccessData(m_psaParameters,(void**)&dispparams.rgvarg);
            if (FAILED(hr)) {
                DestroyArray();
                return VariantError(hr);
            }
			
			dispparams.cArgs = lElements;
			dispparams.cNamedArgs = 0;
			dispparams.rgdispidNamedArgs = NULL;
            
			hr = m_pDisp->Invoke(dispid,IID_NULL,LOCALE_SYSTEM_DEFAULT,DISPATCH_METHOD,&dispparams,&varResult,NULL,NULL);
			// Clear variants
            SafeArrayUnaccessData(m_psaParameters);
            DestroyArray();
            if (!FAILED(hr)) {
                return varResult;
            } else {
                return VariantError(hr);
            }

		} else {
			// incorrect
            DestroyArray();
			return VariantError();
		}	
	} 
    // Without parameters
    DestroyArray();

	dispparams.rgvarg = NULL;
	dispparams.cArgs = 0;
	dispparams.cNamedArgs = 0;
	dispparams.rgdispidNamedArgs = NULL;
	hr = m_pDisp->Invoke(dispid,IID_NULL,LOCALE_SYSTEM_DEFAULT,DISPATCH_METHOD,&dispparams,&varResult,NULL,NULL);

    
    if (!FAILED(hr)) return varResult;
    else {
        return VariantError(hr);
    }
}