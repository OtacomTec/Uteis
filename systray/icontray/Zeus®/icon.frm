VERSION 5.00
Begin VB.Form frmNotfIc 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "API 32 Bits Exemplo"
   ClientHeight    =   660
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   5295
   Icon            =   "icon.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   660
   ScaleWidth      =   5295
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox pichook 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   120
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label Label1 
      Caption         =   "Aqui é o seu form......."
      ForeColor       =   &H00800000&
      Height          =   855
      Left            =   720
      TabIndex        =   1
      Top             =   120
      Width           =   3975
   End
   Begin VB.Menu mnu_taskbar 
      Caption         =   "mnu_taskbar"
      Visible         =   0   'False
      Begin VB.Menu mnu_sobre 
         Caption         =   "So&bre..."
      End
      Begin VB.Menu mnutraco 
         Caption         =   "-"
      End
      Begin VB.Menu mnusair 
         Caption         =   "Sa&ir"
      End
   End
End
Attribute VB_Name = "frmNotfIc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
Private Const WM_MOUSEMOVE = &H200
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4

Private Const WM_LBUTTONDBLCLK = &H203
Private Const WM_LBUTTONDOWN = &H201
Private Const WM_LBUTTONUP = &H202
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = &H204
Private Const WM_RBUTTONUP = &H205

Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Dim t As NOTIFYICONDATA

Private Sub Command1_Click()
    Me.WindowState = 1
    aboapi.Show
End Sub

Private Sub Form_Load()
    Static vShowMsg As Variant 'mostra mensagem 1a vez
    If IsEmpty(vShowMsg) Or vShowMsg = 1 Then
        MsgBox "A aplicação será reduzida a um ícone em forma de Banana no lado direito da Barra de Tarefas do Windows.", 64, "Shell_NotifyIcon 32 bits API"
        vShowMsg = 2
    End If
     
    t.cbSize = Len(t)
    t.hWnd = pichook.hWnd
    t.uId = 1&
    t.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    t.ucallbackMessage = WM_MOUSEMOVE
    t.hIcon = Me.Icon
    t.szTip = "Exemplo de API Shell_NotifyIcon ..." & Chr$(0) 'Texto a ser exibido quando o mouse é movido sobre o ícone.
    Shell_NotifyIcon NIM_ADD, t
    Me.Hide
    App.TaskVisible = False
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    t.cbSize = Len(t)
    t.hWnd = pichook.hWnd
    t.uId = 1&
    Shell_NotifyIcon NIM_DELETE, t  'Remove o ícone da barra de tarefas.
End Sub

Private Sub Form_Resize()
    If (Me.WindowState) = 1 Then
        Me.Hide
    End If
    
    
End Sub

Private Sub mnu_sobre_Click()
    Me.WindowState = 0
    Me.Show
End Sub

Private Sub mnusair_Click()
    Unload Me
    End
End Sub

Private Sub pichook_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'pichook é uma picture box, utilizada pelo Windows para
'reconhecer o ícone na barra de tarefas.
    Static rec As Boolean, msg As Long
    msg = X / Screen.TwipsPerPixelX
    If rec = False Then
        rec = True
        Select Case msg
            Case WM_LBUTTONDBLCLK:
            Case WM_LBUTTONDOWN:
            Case WM_LBUTTONUP:
            Case WM_RBUTTONDBLCLK:
            Case WM_RBUTTONDOWN:
            Case WM_RBUTTONUP:
        'Se for pressionado o botão direito
        'sobre o ícone, é exibido um menu pop-up.
                Me.PopupMenu mnu_taskbar    'mnuBar-menu criado no form.
        End Select
        rec = False
    End If
End Sub


