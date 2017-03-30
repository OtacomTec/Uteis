// mfcView.cpp : implementation of the CMfcView class
//

#include "stdafx.h"
#include "mfc.h"

#include "mfcDoc.h"
#include "mfcView.h"
#include "SetScriptDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMfcView

IMPLEMENT_DYNCREATE(CMfcView, CView)

BEGIN_MESSAGE_MAP(CMfcView, CView)
	//{{AFX_MSG_MAP(CMfcView)
	ON_COMMAND(ID_EDIT_SETSCRIPT, OnEditSetscript)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMfcView construction/destruction

CMfcView::CMfcView()
{
	// TODO: add construction code here

}

CMfcView::~CMfcView()
{
}

BOOL CMfcView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CMfcView drawing

void CMfcView::OnDraw(CDC* pDC)
{
	CMfcDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
    CString str;

    // Call the document to do drawing
    pDoc->BeginPainting(pDC);
    str = pDoc->DoDrawing();
    pDoc->EndPainting();
    if (!str.IsEmpty()) {
        // If the DoDrawing returns non-empty string - this is an error
        // display it
        MessageBox(str);
    }
}

/////////////////////////////////////////////////////////////////////////////
// CMfcView diagnostics

#ifdef _DEBUG
void CMfcView::AssertValid() const
{
	CView::AssertValid();
}

void CMfcView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CMfcDoc* CMfcView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMfcDoc)));
	return (CMfcDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMfcView message handlers

void CMfcView::OnEditSetscript() {
     // Open the Set / edit script dialog
	 CSetScriptDialog dlgSetScript(this);
     CMfcDoc* pDoc = GetDocument();
	 ASSERT_VALID(pDoc);
	 dlgSetScript.m_strScriptText = pDoc->m_strScript;
     dlgSetScript.m_strLanguage = pDoc->m_strEngine;
     if (dlgSetScript.DoModal() == IDOK) {
         if (!pDoc->SetScript(dlgSetScript.m_strScriptText,dlgSetScript.m_strLanguage)) {
             MessageBox("Error setting the script");
         }
     }
     Invalidate();
}
