// mfcDoc.h : interface of the CMfcDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_MFCDOC_H__C16FF20E_E3C7_11D4_9984_0040332BA2EA__INCLUDED_)
#define AFX_MFCDOC_H__C16FF20E_E3C7_11D4_9984_0040332BA2EA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000



class CMfcDoc : public CDocument
{
protected: // create from serialization only
	CMfcDoc();
	DECLARE_DYNCREATE(CMfcDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMfcDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual BOOL SetScript(LPCTSTR lpsz,LPCTSTR szEngine);
	virtual CString DoDrawing();
	virtual void EndPainting();
	virtual void BeginPainting(CDC* pdc);
	CDC* m_pCurrentDC;
    SCPHOSTCLNT  m_Script;
    CString      m_strParameters;
    CString      m_strScript;
    CString      m_strEngine;
	virtual ~CMfcDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMfcDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

	// Generated OLE dispatch map functions
	//{{AFX_DISPATCH(CMfcDoc)
	afx_msg void SetColor(OLE_COLOR nNewValue);
	afx_msg void SetBgColor(OLE_COLOR nNewValue);
	afx_msg void SetLineWidth(long nNewValue);
	afx_msg void DrawLine(long xBegin, long yBegin, long xEnd, long yEnd);
	afx_msg void DrawRect(long left, long top, long right, long bottom);
	afx_msg void DrawEllipse(long left, long top, long right, long bottom);
	afx_msg void WriteText(long x, long y, LPCTSTR text);
	//}}AFX_DISPATCH
	DECLARE_DISPATCH_MAP()
	DECLARE_INTERFACE_MAP()
private:
    CBrush*     m_pBrush;
    int         m_nPenWidth;
    int         m_nPenStyle;
    COLORREF    m_crForeColor;
    COLORREF    m_crBackColor;
	CPen*       m_pPen;
    int         m_nDC; // save DC
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MFCDOC_H__C16FF20E_E3C7_11D4_9984_0040332BA2EA__INCLUDED_)
