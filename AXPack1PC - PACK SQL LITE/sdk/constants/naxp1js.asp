<%

// ***************************************************
// * newObjects ActiveX Pack 1 - constants           *
// * Language: JScript/ASP                           *
// * DLL Version: 2.3                                *
// Platforms: Windows: 95/98/ME/2k/XP/2003 and later *
//            Windows CE/CE.NET 3.0 or later         *
//            Prebuild binaries are available for:   *
//            Windows, Pocket PC, Mobile 2003 CE.NET *
//            Binaries can be requested for the other*
//            platforms
// ***************************************************
//
// If you need to use these constants in non-ASP environment
// remove the ASP tags and paste the file contents in the beginning 
// of your script or include it if the environment supports includes
// You can remove the constants you will never use.
// See also the TypeConvertor object for hepful functions
// not available (by default) in all the scripting languages - 
// type conversions and bitwise operations.

// STORAGES AND FILES
    // Open and Create methods
    // Open modes
    var     cSFRead                 =   0x00000000;
    var     cSFWrite                =   0x00000001;
    var     cSFReadWrite            =   0x00000002;
    // Sharing
    var     cSFShareDenyNone        =   0x00000040;
    var     cSFShareDenyRead        =   0x00000030;
    var     cSFShareDenyWrite       =   0x00000020;
    var     cSFShareExclusive       =   0x00000010;
    var     cSFSharePriority        =   0x00040000;
    // Creation
    var     cSFCreate               =   0x00001000;
    var     cSFConvert              =   0x00020000;
    var     cSFFailIfThere          =   0x00000000;
    // Transactioning (if supported)
    var     cSFDirect               =   0x00000000;
    var     cSFTransacted           =   0x00010000;
    var     cSFDeleteOnRelease      =   0x04000000;
    // Rarely needed in scripts - see STGM in MSDN for more info
    var     cSFNoScratch            =   0x00100000;
    var     cSFNoSnapshot           =   0x00200000;
    var     cSFSimple               =   0x08000000;
    var     cSFDirectSWMR           =   0x00400000;
    
    // Helpful combinations - often used
    var     cSFExRW                 =   0x00000012;  // Exclusive read/write
    var     cSFExR                  =   0x00000010;  // Exclusive read
    var     cSFExW                  =   0x00000011;  // Exclusive write
    var     cSFR                    =   0x00000020;  // Shared Read, deny write
    var     cSFRW                   =   0x00000022;  // Shared Read, Exclusive write (not all streams support this)

// Type constants (VBScript has then built-in - see vbXXX constants and VarType function)
    // Types supported by the SFField. SFRecord and SFFilter objects
    var     cvtEmpty                =   0;
    var     cvtByte                 =   17;
    var     cvtInteger              =   2;
    var     cvtLong                 =   3;
    var     cvtFloat                =   4;
    var     cvtDouble               =   5;
    var     cvtBoolean              =   11;
    var     cvtCurrency             =   6;
    var     cvtDate                 =   7;
    var     cvtString               =   8;
    var     cvtSByte                =   16;
    var     cvtUInteger             =   18;
    var     cvtULong                =   19;
    
// Code pages (The list is not full - add additional constants if you need)
    // Used in SFStream and SFFilter
    // Special - always available
    var     cpAnsi                  =   0;   // ANSI code page 
    var     cpOem                   =   1;   // OEN code page
    var     cpMac                   =   2;   // MAC code page
    var     cpThread                =   3;   // Current thread code page (not good for scripting)
    var     cpSymbol                =   42;  // Symbol code page
    
    // Specific code pages - if they are not installed on the system conversions will fail
    var     cpThai                  =   874;
    var     cpJapanese              =   932;
    var     cpChinese               =   936;
    var     cpKorean                =   949;
    var     cpChinese2              =   950;
    var     cpEasternEuropean       =   1250;
    var     cpCyrillic              =   1251;
    var     cpWestern               =   1252;
    var     cpGreek                 =   1253;
    var     cpTurkish               =   1254;
    var     cpHebrew                =   1255;
    var     cpArabic                =   1256;
    var     cpBaltic                =   1257;    
    
    // SFStorage.Commit
    var     cCommitDefault                   = 0;
    var     cCommitOverwrite                 = 1; 
    var     cCommitOnlyIfCurrent             = 2; 
    var     cCommitRelyOnDiskCache           = 4;
    var     cCommitConsolidate               = 8; 

    // SFDrive.DriveType
    var     cDriveUnknown                    = 0;
    var     cDriveRemovable                  = 2;
    var     cDriveFixed                      = 3;
    var     cDriveRemote                     = 4;
    var     cDriveCDROM                      = 5;
    var     cDriveRamDisk                    = 6;
    
// ConfigFile
    // Registry branches
    var     cRegClassesRoot         =   0;
    var     cRegCurrentUser         =   1;
    var     cRegLocalMachine        =   2;
    // Warning not all OSes have the following branches
    var     cRegUsers               =   3;
    var     cRegPerfData            =   4;
    var     cRegCurrentConfig       =   5;
    var     cRegDynData             =   6;
    
    // Node type
    var     cSectionNode            =   true;
    var     cRecordNode             =   false;
    
    // Node type for the data trees returned by the 
    // ConfigFile Read methods ( object.Info.Type )
    var   cSectionNode            =   true;
    var   cRecordNode             =   false;
    
    // ConfigFile options.
    // Following two sections are provided mostly as reminders
    // You can use boolean values safely, but for better readablity
    // you can put these constants instead.
    // object.PreserveStringsWide
        var   cCFSaveWideStrings        = true;
        var   cCFSaveANSIStrings        = false;
    // object.PreserveUnsignedInt
        var   cCFPreserveUnignedLong    = true;
        var   cCFSaveUnignedAsLong      = false;
    
    // objec.ErrorMode
    var     cCFErrModeCheckFlags      =   1;
    var     cCFErrModeAdjustFlags     =   2;
    var     cErrModeNormal            =   0;
    
// ScriptManager and ScriptAggregate 
    // (AddEx method)
    var     cScrItemNormal          =   0;
    var     cScrItemSource          =   1;
    var     cScrItemGlobal          =   2;
    var     cScrItemScriptGlobal    =   3;
    var     cScrItemScriptNormal    =   4;
    
    // ScriptAggregate.Run
    var     cRunNormal              =   0;
    var     cRunReverse             =   -1;
    

    
// Move and Seek
    var     cStreamBegin            =   0;
    var     cStreamCurrent          =   1;
    var     cStreamEnd              =   2;
    
// SFStream.ReadText
    var     cReadAll                =   -2;  // Entire stream
    var     cReadLine               =   -1;  // Single line, end of line is detected as exact match (see textLineSeparator)
    var     cReadLineAny            =   -3;  // Single line, end of line is detected as any character from the textLineSeparator
                                             // This is very tollerant to any format but requires seekable stream
                                            
// SFStream.WriteText - Options
    var     cWriteAsIs              =   0;
    var     cWriteLine              =   1;   // Adds the textLineSeparator at the end
    
// Object type (stats and elementType of SFStorage and SFStream)
    var     cStorage                =   1;
    var     cStream                 =   2;

// SFStream.Find - Flags
    var     cFindAndReturn          =   0x01;   // Return to the initial position after operation (exclusive with the next flag)
    var     cFindAndStayThere       =   0x02;   // Stay after the found sequence
    var     cFindAny                =   0x04;   // Find any any chunk (se Chunksize parameter)
    // This function is powerful binary search - see the documentation for more details
    
// SFCOMThread and SFCOMApartment
// object.Priority
// Note accpetable values are >= -15 and <= +15
// But these are recommended:
    var cThreadPriorityNotmal     =   0;
    var cThreadPriorityMin        =   -2;
    var cThreadPriorityMax        =   2;
    var cThreadPriorityRealTime   =   15;   // Not recommended for scripting apps.
    var cThreadPriorityIdle       =   -15;
    
// SFBinaryData and SFFilter
// ByteOrder and UnicodeByteOrder
    var   cByteOrderSBML          =   0x01;
    var   cByteOrderSLMB          =   0x02;    // Reserved for non-Windows platforms
    var   cByteOrderSLML          =   0x00;
    var   cByteOrderSBMB          =   0x03;
    var   cByteOrderTrivial       =   0x04;    // default - force trivial
    // Description SL - meands Source is little endian, SB - source is big endian
    //             ML - machine is little endian, MB - machine is big endian    

// SFMain.GetSpecialPath
	var		cGSPPrograms			=	0x02;
	var		cGSPPersonal			=	0x05;
	var		cGSPFavorites			=	0x06;
	var		cGSPStartup				=	0x07;
	var		cGSPRecent				=	0x08;
	var		cGSPSendTo				=	0x09;
	var		cGSPStartMenu			=	0x0B;
	var		cGSPDesktopDirectory	=	0x10;
	var		cGSPFonts				=	0x14;
	var		cGSPTemplates			=	0x15;
	var		cGSPCommonStartMenu		=	0x16;
	var		cGSPCommonPrograms		=	0x17;
	var		cGSPCommonStartUp		=	0x18;
	var		cGSPCommonDesktopDir	=	0x19;
	var		cGSPAPPData				=	0x1A;
	var		cGSPCommonFavorites		=	0x1F;
	var		cGSPCookies				=	0x21;
	var		cGSPHistory				=	0x22;    
	
// Show window constants
    var     cswSHOWNORMAL           =   1;
    var     cswSHOWMINIMIZED        =   2;
    var     cswSHOWMAXIMIZED        =   3;	

// Remarks:
//   Some methods and objects need shell (SFShellLink, SFMain.GetSpecialPath)
//   Unfortunately the CE versions use different shells including custom OEM shells.
//   Therefore these features are not standard for Windows CE. You can request special
//   version of the DLL or additional DLL but please before doing so read the plicy notes in the 
//   documentation. The policy is intended to guarantee wider compatibility with minimum
//   amount of binary distributions.
    
%>