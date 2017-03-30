// mfcView.h : interface of the CMfcView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_MFCVIEW_H__C16FF210_E3C7_11D4_9984_0040332BA2EA__INCLUDED_)
#define AFX_MFCVIEW_H__C16FF210_E3C7_11D4_9984_0040332BA2EA__INCLUDED_

#include "mfcDoc.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CMfcView : public CView
{
protected: // create from serialization only
	CMfcView();
	DECLARE_DYNCREATE(CMfcView)

// Attributes
public:
	CMfcDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMfcView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMfcView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMfcView)
	afx_msg void OnEditSetscript();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

#ifndef _DEBUG  // debug version in mfcView.cpp
inline CMfcDoc* CMfcView::GetDocument()
   { return (CMfcDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MFCVIEW_H__C16FF210_E3C7_11D4_9984_0040332BA2EA__INCLUDED_)
