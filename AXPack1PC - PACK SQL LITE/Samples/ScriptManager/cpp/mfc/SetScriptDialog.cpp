// SetScriptDialog.cpp : implementation file
//

#include "stdafx.h"
#include "mfc.h"
#include "SetScriptDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSetScriptDialog dialog


CSetScriptDialog::CSetScriptDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CSetScriptDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSetScriptDialog)
	m_strLanguage = _T("");
	m_strScriptText = _T("");
	//}}AFX_DATA_INIT
}


void CSetScriptDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSetScriptDialog)
	DDX_Control(pDX, IDC_SCRIPTLANGUAGE, m_Language);
	DDX_Control(pDX, IDC_SCRIPTTEXT, m_ScriptText);
	DDX_Text(pDX, IDC_SCRIPTLANGUAGE, m_strLanguage);
	DDX_Text(pDX, IDC_SCRIPTTEXT, m_strScriptText);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSetScriptDialog, CDialog)
	//{{AFX_MSG_MAP(CSetScriptDialog)
	ON_BN_CLICKED(IDC_LOADFILE, OnLoadfile)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSetScriptDialog message handlers

void CSetScriptDialog::OnLoadfile() {
	CFileDialog dlgFile(TRUE);
    CString str;
    dlgFile.m_ofn.hwndOwner = m_hWnd;
    if (dlgFile.DoModal() == IDOK) {
        TRY {
            CFile file(dlgFile.m_ofn.lpstrFile,CFile::modeRead | CFile::shareDenyNone);
            UINT    uLength = file.GetLength();
            if (uLength > 0) {
                LPSTR   lpsz;
                lpsz = new CHAR[uLength + 1];
                UINT    uRead = file.Read(lpsz,uLength);
                lpsz[uRead] = '\0';
                // Just to simplify conversion in unicode case
                str = lpsz;
                m_ScriptText.SetWindowText(str);
                file.Close();
                str = &(dlgFile.m_ofn.lpstrFile[dlgFile.m_ofn.nFileExtension]);
                if (str.CompareNoCase(_TEXT("JS")) == 0) {
                    m_Language.SetWindowText(_TEXT("JScript"));
                } else {
                    if (str.CompareNoCase(_TEXT("VBS")) == 0) {
                        m_Language.SetWindowText(_TEXT("VBScript"));
                    }
                }
            }
        } CATCH(CFileException, pFileException) {
            MessageBox("Error openning file");
        } END_CATCH
    }
}
