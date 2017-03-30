#if !defined(AFX_SETSCRIPTDIALOG_H__C16FF21A_E3C7_11D4_9984_0040332BA2EA__INCLUDED_)
#define AFX_SETSCRIPTDIALOG_H__C16FF21A_E3C7_11D4_9984_0040332BA2EA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SetScriptDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSetScriptDialog dialog

class CSetScriptDialog : public CDialog
{
// Construction
public:
	CSetScriptDialog(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSetScriptDialog)
	enum { IDD = IDD_DIALOG1 };
	CEdit	m_Language;
	CEdit	m_ScriptText;
	CString	m_strLanguage;
	CString	m_strScriptText;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSetScriptDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSetScriptDialog)
	afx_msg void OnLoadfile();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETSCRIPTDIALOG_H__C16FF21A_E3C7_11D4_9984_0040332BA2EA__INCLUDED_)
