VERSION 5.00
Begin VB.Form frmShellTray 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "VBThunder - Shell Tray Icon"
   ClientHeight    =   3240
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmShellTray.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3240
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   0
      Top             =   2760
      Width           =   1215
   End
   Begin VB.Label lblVBT 
      AutoSize        =   -1  'True
      Caption         =   "Visual Basic Thunder Web Site"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   195
      Left            =   120
      MouseIcon       =   "frmShellTray.frx":000C
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Top             =   2040
      Width           =   2145
   End
   Begin VB.Label lbl 
      Caption         =   "Go to:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   4
      Top             =   1800
      Width           =   3855
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      Index           =   1
      X1              =   120
      X2              =   4560
      Y1              =   2520
      Y2              =   2520
   End
   Begin VB.Label lbl 
      Caption         =   "This demonstration project shows how to use the API to place your own custom icon in Explorer's system tray."
      Height          =   495
      Index           =   2
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   4455
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      Index           =   0
      X1              =   120
      X2              =   4560
      Y1              =   840
      Y2              =   840
   End
   Begin VB.Label lbl 
      Caption         =   "Shell Tray Icon Demo"
      Height          =   255
      Index           =   1
      Left            =   720
      TabIndex        =   2
      Top             =   360
      Width           =   3855
   End
   Begin VB.Label lbl 
      Caption         =   "Visual Basic Thunder"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   720
      TabIndex        =   1
      Top             =   120
      Width           =   3855
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Left            =   120
      Picture         =   "frmShellTray.frx":015E
      Top             =   120
      Width           =   480
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "Main Menu"
      Visible         =   0   'False
      Begin VB.Menu mnuAbout 
         Caption         =   "&About..."
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmShellTray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'=======================================
'Downloaded from Visual Basic Thunder
'www.vbthunder.com
'Created on: 8/18/2002 2:32:27 PM
'=======================================

'Note: These declarations are not used for the
'system tray portion of this project. They are
'used in the Navigate routine that is called
'from the lblVBT_Click event.
Private Const SW_SHOW = 1

Private Declare Function ShellExecute Lib _
    "shell32.dll" Alias "ShellExecuteA" _
    (ByVal hWnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long

Private Sub Navigate(ByVal WebPageURL As String)

Dim hBrowse As Long
hBrowse = ShellExecute(0, "open", WebPageURL, "", "", SW_SHOW)

End Sub


Private Sub cmdOK_Click()

Me.Hide

End Sub

Private Sub Form_Load()

ShellIconInitialize

End Sub

Private Sub Form_Unload(Cancel As Integer)

ShellIconTerminate

End Sub

Private Sub lblVBT_Click()

'Go to the VB Thunder web site
Navigate "http://www.vbthunder.com"

End Sub

Private Sub mnuAbout_Click()

frmShellTray.Show

End Sub

Private Sub mnuExit_Click()

Unload frmShellTray

End Sub

