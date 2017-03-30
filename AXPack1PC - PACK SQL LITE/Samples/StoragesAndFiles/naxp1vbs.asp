<%

' ***************************************************
' * newObjects ActiveX Pack 1 - constants           *
' * Language: VBScript/ASP                          *
' * DLL Version: 2.0                                *
' ***************************************************
'
' If you need to use these constants in non-ASP environment
' remove the ASP tags and paste the file contents in the beginning 
' of your script or include it if the environment supports includes
' You can remove the constants you will never use.
' See also the TypeConvertor object for hepful functions
' not available (by default) in all the scripting languages - 
' type conversions and bitwise operations.

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
    
    ' Helpful combinations - often used
    Const   cSFExRW                 =   &H00000012  ' Exclusive read/write
    Const   cSFExR                  =   &H00000010  ' Exclusive read
    Const   cSFExW                  =   &H00000011  ' Exclusive write
    Const   cSFR                    =   &H00000020  ' Shared Read, deny write
    Const   cSFRW                   =   &H00000022  ' Shared Read, Exclusive write (not all streams support this)
    
    
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
    ' Warning not all OSes have the following branches
    Const   cRegUsers               =   3
    Const   cRegPerfData            =   4
    Const   cRegCurrentConfig       =   5
    Const   cRegDynData             =   6
    
    ' Node type
    Const   cSectionNode            =   True
    Const   cRecordNode             =   False
    
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
    
' Code pages (The list is not full - add additional constants if you need)
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
    Const   cFindAny                =   &H04    ' Find any any chunk (se Chunksize parameter)
    ' This function is powerful binary search - see the documentation for more details
    
    
    
%>