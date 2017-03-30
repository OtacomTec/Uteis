#ifndef _SCPHOSTCLNT_H_
#define _SCPHOSTCLNT_H_

MIDL_INTERFACE("6CEAA770-C22C-11d4-9979-0040332BA2EA")
    IScpMan : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_versionString( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ VARIANT varKey,
            /* [in] */ VARIANT varItem,
            /* [retval][out] */ VARIANT __RPC_FAR *pvarPlace) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ long __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ VARIANT varIndex,
            /* [retval][out] */ VARIANT __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Key( 
            /* [in] */ VARIANT varKey,
            /* [retval][out] */ VARIANT __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ IUnknown __RPC_FAR *__RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ VARIANT varIndex,
            /* [retval][out] */ VARIANT __RPC_FAR *pvarResult) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_locked( 
            /* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoadEngine( 
            /* [in] */ BSTR bstrEngine,
            /* [retval][out] */ VARIANT __RPC_FAR *pvarResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddText( 
            /* [in] */ BSTR bstrText,
            /* [retval][out] */ VARIANT __RPC_FAR *pvarResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Run( 
            /* [retval][out] */ VARIANT __RPC_FAR *pvarResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Stop( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Close( void) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_script( 
            /* [retval][out] */ IDispatch __RPC_FAR *__RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_lastError( 
            /* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEventHandler( 
            /* [in] */ BSTR bstrItem,
            /* [in] */ BSTR bstrSubItem,
            /* [in] */ BSTR bstrEvent,
            /* [in] */ BSTR bstrCode,
            /* [retval][out] */ VARIANT __RPC_FAR *pvarResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Connect( 
            /* [retval][out] */ VARIANT __RPC_FAR *pvarResult) = 0;
        
    };

const CLSID CLSID_ScpMan = {0x6CEAA772,0xC22C,0x11d4,{0x99,0x79,0x00,0x40,0x33,0x2B,0xA2,0xEA}};
const IID IID_IScpMan = {0x6CEAA770,0xC22C,0x11d4,{0x99,0x79,0x00,0x40,0x33,0x2B,0xA2,0xEA}};

// Every Interface returned by the functions here must be released after use !

class SCPHOSTCLNT {
    IScpMan*    m_pScpMan;
public:
    SCPHOSTCLNT();
    virtual ~SCPHOSTCLNT();

    virtual BOOL    Success();

    virtual int             Add(LPCTSTR,IDispatch*);
    virtual int             Count();
    virtual IDispatch*      Item(LPCTSTR);
    virtual IDispatch*      Item(int);
    virtual BOOL            Clear();
    virtual BOOL            Remove(LPCTSTR);
    virtual BOOL            Remove(int);
    virtual BOOL            IsLocked();
    virtual BOOL            LoadEngine(LPCTSTR);
    virtual BOOL            AddCode(LPCTSTR);
    virtual BOOL            AddEventHandler(LPCTSTR,LPCTSTR,LPCTSTR,LPCTSTR);
    virtual BOOL            Connect();
    virtual BOOL            Run();
    virtual BOOL            Stop();
    virtual BOOL            Close();
    virtual IDispatch*      GetScriptDispatch();
    virtual int             GetLastError(LPTSTR,int);
    virtual IDispatch*      GetSelfDispatch();
};

BSTR    _PackInBSTR(LPCTSTR);


// Note about the parameters of the constructor
// if bAddReff is FALSE - no AddRef will be called
// on the IDispatch packed here. It is useful if the
// object was initialized from the IDispatch pointer
// returned from another function
class DISPCALLER {
    LPDISPATCH          m_pDisp;
    SAFEARRAY*			m_psaParameters;
public:
    DISPCALLER(LPDISPATCH pDisp,BOOL bAddRef = FALSE) {
        m_pDisp = pDisp;
        m_psaParameters = NULL;
        if (bAddRef && m_pDisp) m_pDisp->AddRef();
    }
    DISPCALLER() {
        m_pDisp = NULL;
        m_psaParameters = NULL;
    }
    ~DISPCALLER() {
        if (m_pDisp) m_pDisp->Release();
        DestroyArray();
    }

    BOOL    IsValid() { return (m_pDisp)?TRUE:FALSE; }

    // Assignment
    DISPCALLER& operator = (IDispatch* pDisp);  // Makes AddRef
    DISPCALLER& operator <= (IDispatch* pDisp); // Doesn't make AddRef
    DISPCALLER& operator = (IUnknown* pUnk);
    
    private:
    bool	CreateArray();
	bool	DestroyArray();
	bool	AddToArray(VARIANT* v);
	public:
    int     GetParamCount();

    // Parameter operators

    DISPCALLER& operator << (int v);
	DISPCALLER& operator << (LPCTSTR v);
	DISPCALLER& operator << (IUnknown* v); 
    DISPCALLER& operator << (IDispatch* v);
    DISPCALLER& operator << (VARIANT v);   // does not clear passed variant !!!

    VARIANT  VariantBool(bool b);
    VARIANT  VariantError(HRESULT hr = E_FAIL);

    VARIANT     VariantCall(LPCTSTR szMethod);

};

#endif //_SCPHOSTCLNT_H_