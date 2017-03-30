#include <automationhlp.h>


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
    if (pUnk) {
        HRESULT hr = pUnk->QueryInterface(&m_pDisp);
        if (FAILED(hr)) m_pDisp = NULL;
    } else {
        m_pDisp = NULL;
    }
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
DISPCALLER& DISPCALLER::operator << (float v) {
    VARIANT     var;

    VariantInit(&var);
    var.vt      = VT_R4;
    var.fltVal  = v;

    if (!AddToArray(&var)) {
        // Error code
    }
    VariantClear(&var);
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (double v) {
    VARIANT     var;

    VariantInit(&var);
    var.vt      = VT_R8;
    var.dblVal  = v;

    if (!AddToArray(&var)) {
        // Error code
    }
    VariantClear(&var);
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (LPCTSTR v) {
    VARIANT     var;
    BSTR        bstrValue;

    VariantInit(&var);
    if (v) {
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
    }
    if (!AddToArray(&var)) {
        // Error code
    }
    
    VariantClear(&var); // Release this string
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (BSTR v) {
    VARIANT var;
    VariantInit(&var);
    if (v) {
        var.vt = VT_BSTR;
        var.bstrVal = v;
    }
    if (!AddToArray(&var)) {
        // Error code
    }
    // Don't clear the variant !!! BSTR is not copied.
    // Missing VariantClear is not an error.
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (IUnknown* v) {
    
    VARIANT     var;
    VariantInit(&var);
    if (v) {
        var.vt = VT_UNKNOWN;
        var.punkVal = v;
        v->AddRef();
    }
     
    if (!AddToArray(&var)) {
        // Error code
    }
    VariantClear(&var); // Releases IUnknow
    return (*this);
}
DISPCALLER& DISPCALLER::operator << (IDispatch* v) {
    VARIANT     var;

    VariantInit(&var);
    if (v) {
        var.vt      = VT_DISPATCH;
        var.punkVal = v;
        v->AddRef();
    }
    
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

VARIANT     DISPCALLER::VariantCall(LPCTSTR szMethod,EXCEPINFO* pExcep,WORD wContext) {
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
    DISPID		dispid;

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

    hr = m_pDisp->GetIDsOfNames(IID_NULL,&bstrMethod,1,LOCALE_SYSTEM_DEFAULT,&dispid);
    SysFreeString(bstrMethod);
    if (FAILED(hr)) {         // <winerror.h>
        DestroyArray();
        return VariantError(hr);
    }


    long		lLBound,lUBound;
	long		lElements;
    DISPPARAMS	dispparams;
    DISPID      didPutProp = DISPID_PROPERTYPUT;

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
            if (wContext == DISPATCH_PROPERTYPUT) {
                dispparams.rgdispidNamedArgs = &didPutProp;
                dispparams.cNamedArgs = 1;
            } else {
                dispparams.cNamedArgs = 0;
			    dispparams.rgdispidNamedArgs = NULL;
            }
            
			hr = m_pDisp->Invoke(dispid,IID_NULL,LOCALE_SYSTEM_DEFAULT,wContext,&dispparams,&varResult,pExcep,NULL);
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
	hr = m_pDisp->Invoke(dispid,IID_NULL,LOCALE_SYSTEM_DEFAULT,wContext,&dispparams,&varResult,NULL,NULL);

    if (!FAILED(hr)) {
        return varResult;
    } else {
        return VariantError(hr);
    }
}
// By ID
VARIANT     DISPCALLER::VariantCall(DISPID dispid,EXCEPINFO* pExcep,WORD wContext) {
    HRESULT             hr;
    VARIANT             varResult;

    // Parameters are packed in the variant - this is not required 
    // but we have other plans

    if (!m_pDisp) {
        DestroyArray();
        return VariantError(E_NOINTERFACE);
    }
    
    VariantInit(&varResult);
    

    long		lLBound,lUBound;
	long		lElements;
    DISPPARAMS	dispparams;
    DISPID      didPutProp = DISPID_PROPERTYPUT;

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
            if (wContext == DISPATCH_PROPERTYPUT) {
                dispparams.rgdispidNamedArgs = &didPutProp;
                dispparams.cNamedArgs = 1;
            } else {
                dispparams.cNamedArgs = 0;
			    dispparams.rgdispidNamedArgs = NULL;
            }
            
			hr = m_pDisp->Invoke(dispid,IID_NULL,LOCALE_SYSTEM_DEFAULT,wContext,&dispparams,&varResult,pExcep,NULL);
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
	hr = m_pDisp->Invoke(dispid,IID_NULL,LOCALE_SYSTEM_DEFAULT,wContext,&dispparams,&varResult,NULL,NULL);

    if (!FAILED(hr)) {
        return varResult;
    } else {
        return VariantError(hr);
    }
}
VARIANT     DISPCALLER::GetProperty(LPCTSTR szMethod,EXCEPINFO* pExcep) {
    return VariantCall(szMethod,pExcep,DISPATCH_PROPERTYGET);
}
VARIANT     DISPCALLER::PutProperty(LPCTSTR szMethod,EXCEPINFO* pExcep) {
    return VariantCall(szMethod,pExcep,DISPATCH_PROPERTYPUT);
}
VARIANT     DISPCALLER::GetProperty(DISPID dispid,EXCEPINFO* pExcep) {
    return VariantCall(dispid,pExcep,DISPATCH_PROPERTYGET);
}
VARIANT     DISPCALLER::PutProperty(DISPID dispid,EXCEPINFO* pExcep) {
    return VariantCall(dispid,pExcep,DISPATCH_PROPERTYPUT);
}

// VARIANTENUM

VARIANTENUM::VARIANTENUM() {
    ::VariantInit(this);
    m_pEnum = NULL;
    m_bAtEnd = false;
}
VARIANTENUM::VARIANTENUM(IUnknown* pUnk) {
    ::VariantInit(this);
    m_bAtEnd = false;
    DISPCALLER dc(pUnk);
    HRESULT hr;
    IUnknown* pUnkEnum = NULL;
    if (dc.IsValid()) {
        // Obtain enum
        VARIANT var;
        ::VariantInit(&var);
        var = dc.GetProperty(DISPID_NEWENUM);
        if (var.vt == VT_UNKNOWN) {
            pUnkEnum = var.punkVal;
            pUnkEnum->AddRef();
        }
        ::VariantClear(&var);
        dc.Release();
    } else {
        pUnkEnum = pUnk;
        if (pUnkEnum) pUnkEnum->AddRef();
    }
    if (pUnkEnum) {
        hr = pUnkEnum->QueryInterface(&m_pEnum);
        if (FAILED(hr)) {
            m_pEnum = NULL;
        } else {
            // Move to the first
            Next();
        }
    }
}
VARIANTENUM::VARIANTENUM(IEnumVARIANT* pEnm) {
    ::VariantInit(this);
    m_pEnum = pEnm;
    if (m_pEnum) m_pEnum->AddRef();
    m_bAtEnd = false;
    Next();
}
VARIANTENUM::~VARIANTENUM() {
    if (m_pEnum) m_pEnum->Release();
}

bool            VARIANTENUM::Next() {
    HRESULT hr;
    ::VariantClear((VARIANT*)this);
    if (m_pEnum) {
        ULONG   uFetched;
        hr = m_pEnum->Next(1,(VARIANT*)this,&uFetched);
        if (hr == S_OK) return true;
        else {
            m_bAtEnd = true;
        }
    }
    return false;
}
bool            VARIANTENUM::Reset() {
    HRESULT hr;
    ::VariantClear((VARIANT*)this);
    if (m_pEnum) {
        hr = m_pEnum->Reset();
        if (hr == S_OK) {
            return Next();
        }
    }
    return false;
}
bool            VARIANTENUM::Skip(int n) {
    HRESULT hr;
    ::VariantClear((VARIANT*)this);
    if (m_pEnum) {
        hr = m_pEnum->Skip((ULONG)n);
        if (hr == S_OK) {
            return Next();
        }
    }
    return false;
}
VARIANTENUM&    VARIANTENUM::operator = (VARIANTENUM& ve) {
    Clear();
    HRESULT hr;
    if (ve.IsValid()) {
        hr = ve.m_pEnum->Clone(&m_pEnum);
        if (!FAILED(hr)) {
            Reset();
        }
    }
    return (*this);
}
VARIANTENUM&    VARIANTENUM::operator = (IUnknown* pUnk) {
    Clear();
    m_bAtEnd = false;
    DISPCALLER dc(pUnk);
    HRESULT hr;
    IUnknown* pUnkEnum = NULL;
    if (dc.IsValid()) {
        // Obtain enum
        VARIANT var;
        ::VariantInit(&var);
        var = dc.GetProperty(DISPID_NEWENUM);
        if (var.vt == VT_UNKNOWN) {
            pUnkEnum = var.punkVal;
            pUnkEnum->AddRef();
        }
        ::VariantClear(&var);
        dc.Release();
    } else {
        pUnkEnum = pUnk;
        if (pUnkEnum) pUnkEnum->AddRef();
    }
    if (pUnkEnum) {
        hr = pUnkEnum->QueryInterface(&m_pEnum);
        if (FAILED(hr)) {
            m_pEnum = NULL;
        } else {
            // Move to the first
            Next();
        }
    }
    return (*this);
}
VARIANTENUM&    VARIANTENUM::operator = (IEnumVARIANT* pEnm) {
    Clear();
    m_pEnum = pEnm;
    if (m_pEnum) m_pEnum->AddRef();
    m_bAtEnd = false;
    return (*this);
}







