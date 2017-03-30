<%

' ***************************************************
' * newObjects ActiveX Pack 1 - constants           *
' * Language: VBScript/ASP                          *
' * DLL Version: 2.3                                *
' Platforms: Windows: 95/98/ME/2k/XP/2003 and later *
'            Windows CE/CE.NET 3.0 or later         *
'            Prebuild binaries are available for:   *
'            Windows, Pocket PC, Mobile 2003 CE.NET *
'            Binaries can be requested for the other*
'            platforms
' ***************************************************
'
' If you need to use these constants in non-ASP environment
' remove the ASP tags and paste the file contents in the beginning 
' of your script or include it if the environment supports include files
' You can remove the constants you will never use.
' See also the TypeConvertor object for hepful functions
' not available (by default) in all the scripting languages - 
' type conversions and bitwise operations.


' General flags used in various classes
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

' STORAGES AND FILES
    ' Open and Create methods
    ' Open modes
    Const   cSFRead                 =   &H00000000
    Const   cSFWrite                =   &H00000001
    Const   cSFReadWrite            =   &H00000002
    ' Sharing
    Const   cSFShareDenyNone        =   &H00000040
    Const   cSFShareDenyRead        =   &H00000030
    Const   cSFShareDenyWrite       =   &H00000020
    Const   cSFShareExclusive       =   &H00000010
    Const   cSFSharePriority        =   &H00040000
    ' Creation
    Const   cSFCreate               =   &H00001000
    Const   cSFConvert              =   &H00020000
    Const   cSFFailIfThere          =   &H00000000
    ' Transactioning (if supported)
    Const   cSFDirect               =   &H00000000
    Const   cSFTransacted           =   &H00010000
    Const   cSFDeleteOnRelease      =   &H04000000
    ' Rarely needed in scripts - see STGM in MSDN for more info
    Const   cSFNoScratch            =   &H00100000
    Const   cSFNoSnapshot           =   &H00200000
    Const   cSFSimple               =   &H08000000
    Const   cSFDirectSWMR           =   &H00400000
    
    ' Helpful presets - often used
    Const   cSFExRW                 =   &H00000012  ' Exclusive read/write
    Const   cSFExR                  =   &H00000010  ' Exclusive read
    Const   cSFExW                  =   &H00000011  ' Exclusive write
    Const   cSFR                    =   &H00000020  ' Shared Read, deny write
    Const   cSFRW                   =   &H00000022  ' Shared Read, Exclusive write (not all streams support this)
    
' Type constants (VBScript has then built-in - see vbXXX constants and VarType function)
    ' Types supported by the SFField. SFRecord and SFFilter objects
    Const   cvtEmpty                =   0       
    Const   cvtByte                 =   17
    Const   cvtInteger              =   2
    Const   cvtLong                 =   3
    Const   cvtFloat                =   4
    Const   cvtDouble               =   5
    Const   cvtBoolean              =   11
    Const   cvtCurrency             =   6
    Const   cvtDate                 =   7
    Const   cvtString               =   8
    Const   cvtSByte                =   16
    Const   cvtUInteger             =   18
    Const   cvtULong                =   19
    
' Code pages (The list is not full - add additional constants if you need them)
    ' Used in SFStream and SFFilter
    ' Special - always available
    Const   cpAnsi                  =   0   ' ANSI code page 
    Const   cpOem                   =   1   ' OEN code page
    Const   cpMac                   =   2   ' MAC code page
    Const   cpThread                =   3   ' Current thread code page (not good for scripting)
    Const   cpSymbol                =   42  ' Symbol code page
    
    ' Specific code pages - if they are not installed on the system conversions will fail
    Const   cpThai                  =   874
    Const   cpJapanese              =   932
    Const   cpChinese               =   936
    Const   cpKorean                =   949
    Const   cpChinese2              =   950
    Const   cpEasternEuropean       =   1250
    Const   cpCyrillic              =   1251
    Const   cpWestern               =   1252
    Const   cpGreek                 =   1253
    Const   cpTurkish               =   1254
    Const   cpHebrew                =   1255
    Const   cpArabic                =   1256
    Const   cpBaltic                =   1257    
    
' Constants used in specific objects and methods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
' SFStorage.Commit
    Const   cCommitDefault                   = 0
    Const   cCommitOverwrite                 = 1 
    Const   cCommitOnlyIfCurrent             = 2 
    Const   cCommitRelyOnDiskCache           = 4
    Const   cCommitConsolidate               = 8 

' SFDrive.DriveType
    Const   cDriveUnknown                    = 0
    Const   cDriveRemovable                  = 2
    Const   cDriveFixed                      = 3
    Const   cDriveRemote                     = 4
    Const   cDriveCDROM                      = 5
    Const   cDriveRamDisk                    = 6
    
' ConfigFile
    ' Registry branches
    Const   cRegClassesRoot         =   0
    Const   cRegCurrentUser         =   1
    Const   cRegLocalMachine        =   2
    ' Warning! Not all OSes have the following branches - use with care and
    ' never use in portable code!
    Const   cRegUsers               =   3
    Const   cRegPerfData            =   4
    Const   cRegCurrentConfig       =   5
    Const   cRegDynData             =   6
    
    ' Node type for the data trees returned by the 
    ' ConfigFile Read methods ( object.Info.Type )
    Const   cSectionNode            =   True
    Const   cRecordNode             =   False
    
    ' ConfigFile options.
    ' Following two sections are provided mostly as reminders
    ' You can use boolean values safely, but for better readablity
    ' you can put these constants instead.
    ' object.PreserveStringsWide
        Const   cCFSaveWideStrings        = True
        Const   cCFSaveANSIStrings        = False
    ' object.PreserveUnsignedInt
        Const   cCFPreserveUnignedLong    = True
        Const   cCFSaveUnignedAsLong      = False
    
    ' objec.ErrorMode
    Const   cCFErrModeCheckFlags      =   1
    Const   cCFErrModeAdjustFlags     =   2
    Const   cErrModeNormal            =   0
    
' ScriptManager and ScriptAggregate 
    ' (AddEx method)
    Const   cScrItemNormal          =   0
    Const   cScrItemSource          =   1
    Const   cScrItemGlobal          =   2
    Const   cScrItemScriptGlobal    =   3
    Const   cScrItemScriptNormal    =   4
    
    ' ScriptAggregate.Run
    Const   cRunNormal              =   0
    Const   cRunReverse             =   -1
    
' SFStream
' Move and Seek
    Const   cStreamBegin            =   0
    Const   cStreamCurrent          =   1
    Const   cStreamEnd              =   2
    
' SFStream.ReadText
    Const   cReadAll                =   -2  ' Entire stream
    Const   cReadLine               =   -1  ' Single line, end of line is detected as exact match (see textLineSeparator)
    Const   cReadLineAny            =   -3  ' Single line, end of line is detected as any character from the textLineSeparator
                                            ' This is very tollerant to any format but requires seekable stream
                                            
' SFStream.WriteText - Options
    Const   cWriteAsIs              =   0
    Const   cWriteLine              =   1   ' Adds the textLineSeparator at the end
    
' Object type (stats and elementType of SFStorage and SFStream)
    Const   cStorage                =   1
    Const   cStream                 =   2        

' SFStream.Find - Flags
    Const   cFindAndReturn          =   &H01    ' Return to the initial position after operation (exclusive with the next flag)
    Const   cFindAndStayThere       =   &H02    ' Stay after the found sequence
    Const   cFindAny                =   &H04    ' Find any chunk (se Chunksize parameter)
    ' This function is powerful binary search - see the documentation for more details
    
' SFCOMThread and SFCOMApartment
' object.Priority
' Note accpetable values are >= -15 and <= +15
' But these are recommended:
    Const cThreadPriorityNotmal     =   0
    Const cThreadPriorityMin        =   -2
    Const cThreadPriorityMax        =   2
    Const cThreadPriorityRealTime   =   15   ' Not recommended for scripting apps.
    Const cThreadPriorityIdle       =   -15
    
' SFBinaryData and SFFilter
' ByteOrder and UnicodeByteOrder
    Const   cByteOrderSBML          =   &H01
    Const   cByteOrderSLMB          =   &H02    ' Reserved for non-Windows platforms
    Const   cByteOrderSLML          =   &H00    
    Const   cByteOrderSBMB          =   &H03
    Const   cByteOrderTrivial       =   &H04    ' default - force trivial
    ' Description SL - meands Source is little endian, SB - source is big endian
    '             ML - machine is little endian, MB - machine is big endian
    
' Constants for features not supported on all platforms
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
' SFMain.GetSpecialPath
' Note! This function is not supported on some Windows CE based platforms!
	Const	cGSPPrograms			=	&H02
	Const	cGSPPersonal			=	&H05
	Const	cGSPFavorites			=	&H06
	Const	cGSPStartup				=	&H07
	Const	cGSPRecent				=	&H08
	Const	cGSPSendTo				=	&H09
	Const	cGSPStartMenu			=	&H0B
	Const	cGSPDesktopDirectory	=	&H10
	Const	cGSPFonts				=	&H14
	Const	cGSPTemplates			=	&H15
	Const	cGSPCommonStartMenu		=	&H16
	Const	cGSPCommonPrograms		=	&H17
	Const	cGSPCommonStartUp		=	&H18
	Const	cGSPCommonDesktopDir	=	&H19
	Const	cGSPAPPData				=	&H1A
	Const	cGSPCommonFavorites		=	&H1F
	Const	cGSPCookies				=	&H21
	Const	cGSPHistory				=	&H22    
	Const   cGSPSysPath             =   -1
	Const   cGSPWinDir              =   -2
	Const   cGSPTempPath            =   -3
	Const   cGSPProgramFiles        =   -4
	Const   cGSPCommonFiles         =   -5

' SFShellLink
; Note! This object is not supported on most Windows CE platforms	
' Show window constants
    Const   cswSHOWNORMAL           =   1
    Const   cswSHOWMINIMIZED        =   2
    Const   cswSHOWMAXIMIZED        =   3
    
' Remarks:
'   Some methods and objects need shell (SFShellLink, SFMain.GetSpecialPath)
'   Unfortunately the CE versions use different shells including custom OEM shells.
'   Therefore these features are not standard for Windows CE. You can request special
'   version of the DLL or additional DLL but please before doing so read the plicy notes in the 
'   documentation. The policy is intended to guarantee wider compatibility with minimum
'   amount of binary distributions.
%>