VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3045
   ClientLeft      =   2505
   ClientTop       =   2190
   ClientWidth     =   4080
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3045
   ScaleWidth      =   4080
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   840
      Top             =   1440
   End
   Begin VB.PictureBox pichook 
      Height          =   555
      Left            =   180
      ScaleHeight     =   495
      ScaleWidth      =   795
      TabIndex        =   0
      Top             =   165
      Width           =   855
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   2
      Left            =   2400
      Picture         =   "TrayIcon.frx":0000
      Top             =   240
      Width           =   480
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   1
      Left            =   1875
      Picture         =   "TrayIcon.frx":030A
      Top             =   225
      Width           =   480
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   0
      Left            =   1320
      Picture         =   "TrayIcon.frx":0614
      Top             =   240
      Width           =   480
   End
   Begin VB.Menu mnuPopUp 
      Caption         =   "PopUp"
      Begin VB.Menu mnuPop 
         Caption         =   "About"
         Index           =   0
      End
      Begin VB.Menu mnuPop 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mnuPop 
         Caption         =   "E&xit"
         Index           =   2
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Criado por -Lenda Urbana- MADMAX
'E-Mail: feimgarcia@hotmail.com

Private Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    uId As Long
    uFlags As Long
    ucallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4

Private Const WM_LBUTTONDBLCLK = &H203
Private Const WM_LBUTTONDOWN = &H201
Private Const WM_LBUTTONUP = &H202
Private Const WM_MBUTTONDBLCLK = &H209
Private Const WM_MBUTTONDOWN = &H207
Private Const WM_MBUTTONUP = &H208
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = &H204
Private Const WM_RBUTTONUP = &H205

Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Dim TrayI As NOTIFYICONDATA
Private Sub Form_Load()
    TrayI.cbSize = Len(TrayI)
    TrayI.hWnd = pichook.hWnd 'Link do icone do systray para o picturebox
    TrayI.uId = 1&
    TrayI.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    TrayI.ucallbackMessage = WM_LBUTTONDOWN
    TrayI.hIcon = imgIcon(2).Picture
    TrayI.szTip = "KPD-Team 1999" & Chr$(0)
    'Criando o icone
    Shell_NotifyIcon NIM_ADD, TrayI
    Me.Hide
End Sub
Private Sub Form_Unload(Cancel As Integer)
    TrayI.cbSize = Len(TrayI)
    TrayI.hWnd = pichook.hWnd
    TrayI.uId = 1&
    'Apagando o icone
    Shell_NotifyIcon NIM_DELETE, TrayI
    End
End Sub
Private Sub mnuPop_Click(Index As Integer)
    Select Case Index
        Case 0
            MsgBox "-Lenda Urbana- MADMAX - Programação Na Veia -", vbInformation + vbOKOnly
        Case 2
            Unload Me
    End Select
End Sub
Private Sub pichook_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Msg = X / Screen.TwipsPerPixelX
    If Msg = WM_LBUTTONDBLCLK Then  'se for dado duplo clique no icone
        mnuPop_Click 0
    ElseIf Msg = WM_RBUTTONUP Then  'clique com o direito
        Me.PopupMenu mnuPopUp
    End If
End Sub
Private Sub Timer1_Timer()
    'Animação do icone
    Static mPic As Integer
    Me.Icon = imgIcon(mPic).Picture
    TrayI.hIcon = imgIcon(mPic).Picture
    mPic = mPic + 1
    If mPic = 3 Then mPic = 0
    Shell_NotifyIcon NIM_MODIFY, TrayI
End Sub
