; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMfcDoc
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "mfc.h"
ODLFile=mfc.odl
LastPage=0

ClassCount=6
Class1=CMfcApp
Class2=CMfcDoc
Class3=CMfcView
Class4=CMainFrame

ResourceCount=5
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Class5=CAboutDlg
Resource3=IDR_MAINFRAME (English (U.S.))
Resource4=IDD_ABOUTBOX (English (U.S.))
Class6=CSetScriptDialog
Resource5=IDD_DIALOG1 (English (U.S.))

[CLS:CMfcApp]
Type=0
HeaderFile=mfc.h
ImplementationFile=mfc.cpp
Filter=N

[CLS:CMfcDoc]
Type=0
HeaderFile=mfcDoc.h
ImplementationFile=mfcDoc.cpp
Filter=N
BaseClass=CDocument
VirtualFilter=DC
LastObject=CMfcDoc

[CLS:CMfcView]
Type=0
HeaderFile=mfcView.h
ImplementationFile=mfcView.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=CMfcView


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=ID_EDIT_SETSCRIPT




[CLS:CAboutDlg]
Type=0
HeaderFile=mfc.cpp
ImplementationFile=mfc.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_MRU_FILE1
Command6=ID_APP_EXIT
Command10=ID_EDIT_PASTE
Command11=ID_VIEW_TOOLBAR
Command12=ID_VIEW_STATUS_BAR
Command13=ID_APP_ABOUT
CommandCount=13
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command7=ID_EDIT_UNDO
Command8=ID_EDIT_CUT
Command9=ID_EDIT_COPY

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command5=ID_EDIT_CUT
Command6=ID_EDIT_COPY
Command7=ID_EDIT_PASTE
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_NEXT_PANE
CommandCount=13
Command4=ID_EDIT_UNDO
Command13=ID_PREV_PANE


[TB:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_APP_ABOUT
Command5=ID_EDIT_SETSCRIPT
CommandCount=5

[MNU:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_MRU_FILE1
Command6=ID_APP_EXIT
Command7=ID_EDIT_SETSCRIPT
Command8=ID_VIEW_TOOLBAR
Command9=ID_VIEW_STATUS_BAR
Command10=ID_APP_ABOUT
CommandCount=10

[ACL:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_UNDO
Command5=ID_EDIT_CUT
Command6=ID_EDIT_COPY
Command7=ID_EDIT_PASTE
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_NEXT_PANE
Command13=ID_PREV_PANE
CommandCount=13

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[CLS:CSetScriptDialog]
Type=0
HeaderFile=SetScriptDialog.h
ImplementationFile=SetScriptDialog.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_EDIT1
VirtualFilter=dWC

[DLG:IDD_DIALOG1 (English (U.S.))]
Type=1
Class=CSetScriptDialog
ControlCount=7
Control1=IDC_LOADFILE,button,1342242816
Control2=IDC_STATIC,static,1342308352
Control3=IDC_SCRIPTLANGUAGE,edit,1350631552
Control4=IDC_STATIC,static,1342308352
Control5=IDC_SCRIPTTEXT,edit,1353781444
Control6=IDOK,button,1342242817
Control7=IDCANCEL,button,1342242816

