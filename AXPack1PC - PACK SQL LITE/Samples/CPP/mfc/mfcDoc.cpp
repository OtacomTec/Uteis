// mfcDoc.cpp : implementation of the CMfcDoc class
//

#include "stdafx.h"
#include "mfc.h"

#include "mfcDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMfcDoc

IMPLEMENT_DYNCREATE(CMfcDoc, CDocument)

BEGIN_MESSAGE_MAP(CMfcDoc, CDocument)
	//{{AFX_MSG_MAP(CMfcDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BEGIN_DISPATCH_MAP(CMfcDoc, CDocument)
	//{{AFX_DISPATCH_MAP(CMfcDoc)
	DISP_PROPERTY_EX(CMfcDoc, "color", GetNotSupported, SetColor, VT_COLOR)
	DISP_PROPERTY_EX(CMfcDoc, "bgColor", GetNotSupported, SetBgColor, VT_COLOR)
	DISP_PROPERTY_EX(CMfcDoc, "lineWidth", GetNotSupported, SetLineWidth, VT_I4)
	DISP_FUNCTION(CMfcDoc, "Line", DrawLine, VT_EMPTY, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	DISP_FUNCTION(CMfcDoc, "Rect", DrawRect, VT_EMPTY, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	DISP_FUNCTION(CMfcDoc, "Ellipse", DrawEllipse, VT_EMPTY, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	DISP_FUNCTION(CMfcDoc, "Write", WriteText, VT_EMPTY, VTS_I4 VTS_I4 VTS_BSTR)
	//}}AFX_DISPATCH_MAP
END_DISPATCH_MAP()

// Note: we add support for IID_IMfc to support typesafe binding
//  from VBA.  This IID must match the GUID that is attached to the 
//  dispinterface in the .ODL file.

// {C16FF204-E3C7-11D4-9984-0040332BA2EA}
static const IID IID_IMfc =
{ 0xc16ff204, 0xe3c7, 0x11d4, { 0x99, 0x84, 0x0, 0x40, 0x33, 0x2b, 0xa2, 0xea } };

BEGIN_INTERFACE_MAP(CMfcDoc, CDocument)
	INTERFACE_PART(CMfcDoc, IID_IMfc, Dispatch)
END_INTERFACE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMfcDoc construction/destruction

CMfcDoc::CMfcDoc()
{
	// Init handles and some parameters
    m_pCurrentDC    = NULL;
    m_pBrush        = NULL;
    m_pPen          = NULL;
        m_nPenWidth     = 0;
        m_nPenStyle     = PS_SOLID;
    m_crForeColor   = RGB(0,0,0);
    m_crBackColor   = RGB(255,255,255);
    m_strParameters = "";	

    m_strEngine = "";
    m_strScript = "";

	EnableAutomation();

	AfxOleLockApp();
}

CMfcDoc::~CMfcDoc() {
    // Clean up the script component
    // here this is optional
    // and can be fatal only if the script or some of the
    // namespaces keep a reference to the script control itself
    m_Script.Close();
    m_Script.Clear();
	AfxOleUnlockApp();
}

BOOL CMfcDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;
    // Clean up control
	m_Script.Close();
    m_Script.Clear();

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CMfcDoc serialization

void CMfcDoc::Serialize(CArchive& ar)
{
    // Make possible to save script and name of the engine
	if (ar.IsStoring())
	{
        // Store
        ar << m_strEngine;
	    ar << m_strScript;
	}
	else
	{
		// load
        ar >> m_strEngine;
        ar >> m_strScript;
        m_Script.Close();
        m_Script.Clear();
        SetScript(m_strScript,m_strEngine);
	}
}

/////////////////////////////////////////////////////////////////////////////
// CMfcDoc diagnostics

#ifdef _DEBUG
void CMfcDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CMfcDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

// PAINTING METHODS
// called by the view

void CMfcDoc::BeginPainting(CDC *pdc) {
    // Must not be called twice withowt EndPainting between
    ASSERT(m_pCurrentDC == NULL);
    // Must be called with valid DC
    ASSERT(pdc != NULL);
    m_pCurrentDC = pdc;
    m_pPen = NULL;
    m_pBrush = NULL;
    m_nDC = m_pCurrentDC->SaveDC();
}

void CMfcDoc::EndPainting() {
    ASSERT(m_pCurrentDC != NULL);
    m_pCurrentDC->RestoreDC(m_nDC);
    m_pCurrentDC = NULL;
    if (m_pBrush) {
        delete m_pBrush;
        m_pBrush = NULL;
    }
    if (m_pPen) {
        delete m_pPen;
        m_pPen = NULL;
    }
}

// Drawing itself
CString CMfcDoc::DoDrawing() {
    CString str;
    if (m_Script.IsLocked()) {
        // Create a dispatch call helper object
        DISPCALLER  script;
        // Set the dispatch without adding reference
        //  (operator "=" does AddRef, operator <= does not)
        script <= m_Script.GetScriptDispatch();
        // Check if the dispatch is valid
        ASSERT (script.IsValid());
        // Put a parameter. It is not used in the application
        // but you can extend it and then use this parameter
        // in the script
        script << (LPCTSTR)m_strParameters;
        VARIANT var;
        TCHAR   _l[1024];
        // Call the script's Draw method 
        // it returns variant that is of type VT_ERROR
        // in case of a script error
        var = script.VariantCall("Draw");
        if (var.vt == VT_ERROR) {
            // return non-empty string but first copy the error description
            // to it
            m_Script.GetLastError(_l,1023);
            str = _l;
        }
        // Clear variant
        VariantClear(&var);
    }
    return str;
}

// Set/change script
BOOL CMfcDoc::SetScript(LPCTSTR lpsz,LPCTSTR szEngine) {
    m_Script.Close();
    m_Script.Clear();
    m_strEngine = szEngine;
    m_strScript = lpsz;
    TCHAR   _l[1024];
    if (!m_Script.Success()) {
        m_Script.GetLastError(_l,1023);
        MessageBox(NULL,_l,_TEXT("General error (check is the control registered) !"),MB_OK);
        return FALSE;
    }
    if (!m_Script.LoadEngine(szEngine)) {
        m_Script.GetLastError(_l,1023);
        MessageBox(NULL,_l,_TEXT("Load engine error!"),MB_OK);
        return FALSE;
    }
    
    if (!m_Script.AddCode(lpsz)) {
        m_Script.GetLastError(_l,1023);
        MessageBox(NULL,_l,_TEXT("Add code error!"),MB_OK);
        m_Script.Close();
        return FALSE;
    }
    LPDISPATCH  pDisp = GetIDispatch(FALSE);
    m_Script.Add(_TEXT("canvas"),pDisp);
    if (!m_Script.Run()) {
        m_Script.GetLastError(_l,1023);
        MessageBox(NULL,_l,_TEXT("Run error!"),MB_OK);
        m_Script.Close();
        m_Script.Clear();
        return FALSE;
    }
    return TRUE;
}

// AUTOMATION METHODS
// The following methods are the implementations of the dispatch provided
// by the CMfcDoc.
void CMfcDoc::SetColor(OLE_COLOR nNewValue) {
    if (!m_pCurrentDC) return;
    m_crForeColor = nNewValue;
	CPen*   pPen = new CPen(m_nPenStyle,m_nPenWidth,m_crForeColor);
    m_pCurrentDC->SelectObject(pPen);
    if (m_pPen) delete m_pPen;
    m_pPen = pPen;
    m_pCurrentDC->SetTextColor(m_crForeColor);
}

void CMfcDoc::SetBgColor(OLE_COLOR nNewValue) {
    if (!m_pCurrentDC) return;
    m_crBackColor = nNewValue;	
    CBrush* pBrush = new CBrush(m_crBackColor);
    m_pCurrentDC->SelectObject(pBrush);
    if (m_pBrush) delete m_pBrush;
    m_pBrush = pBrush;
    m_pCurrentDC->SetBkColor(m_crBackColor);
}

void CMfcDoc::DrawLine(long xBegin, long yBegin, long xEnd, long yEnd) {
	if (!m_pCurrentDC) return;
    POINT   pt;
    pt.x = xBegin; pt.y = yBegin;
    m_pCurrentDC->MoveTo(pt);
    pt.x = xEnd; pt.y = yEnd;
    m_pCurrentDC->LineTo(pt);
}

void CMfcDoc::DrawRect(long left, long top, long right, long bottom) {
	if (!m_pCurrentDC) return;
    RECT    rc;
    rc.left = left;
    rc.top = top;
    rc.right = right;
    rc.bottom = bottom;
    m_pCurrentDC->Rectangle(&rc);
}

void CMfcDoc::DrawEllipse(long left, long top, long right, long bottom) {
	if (!m_pCurrentDC) return;
    RECT    rc;
    rc.left = left;
    rc.top = top;
    rc.right = right;
    rc.bottom = bottom;
    m_pCurrentDC->Ellipse(&rc);
}

void CMfcDoc::WriteText(long x, long y, LPCTSTR text) {
    if (!m_pCurrentDC) return;	
    CString str = text;
    m_pCurrentDC->TextOut(x,y,str);
}



void CMfcDoc::SetLineWidth(long nNewValue) {
    if (!m_pCurrentDC) return;
	m_nPenWidth = (int)nNewValue;
	CPen*   pPen = new CPen(m_nPenStyle,m_nPenWidth,m_crForeColor);
    m_pCurrentDC->SelectObject(pPen);
    if (m_pPen) delete m_pPen;
    m_pPen = pPen;
}
