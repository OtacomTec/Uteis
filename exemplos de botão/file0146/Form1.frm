VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin Project1.Command Command2 
      Height          =   615
      Left            =   420
      TabIndex        =   3
      Top             =   900
      Width           =   2505
      _ExtentX        =   4419
      _ExtentY        =   1085
      Caption         =   "Focused"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Project1.Command Command1 
      Height          =   705
      Left            =   780
      TabIndex        =   2
      Top             =   1740
      Width           =   1725
      _ExtentX        =   3043
      _ExtentY        =   1244
      Caption         =   "Highlighted"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Project1.Command CmdDisabled 
      Height          =   555
      Left            =   2040
      TabIndex        =   1
      Top             =   90
      Width           =   1755
      _ExtentX        =   3096
      _ExtentY        =   979
      Enabled         =   0   'False
      Caption         =   "Disabled"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Project1.Command CmdButton1 
      Height          =   555
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   1545
      _ExtentX        =   2725
      _ExtentY        =   979
      Caption         =   "Normal"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub CmdButton1_Click()
    If CmdDisabled.Enabled = True Then
        CmdDisabled.Enabled = False
    Else
        CmdDisabled.Enabled = True
    End If
End Sub

Private Sub CmdDisabled_Click()
    MsgBox "Click"
End Sub

Private Sub Form_Load()
    InitialiseButtons Form1, True, True 'Must Call this to initialise the buttons
End Sub

Public Sub InitialiseButtons(FrmForm As Form, Initialise As Boolean, Optional BytEnabled As Boolean)
On Local Error Resume Next
Dim Control As Object 'Define the variable control as an object
    For Each Control In FrmForm 'Check all controls on a form
        If TypeOf Control Is Command Then
            If Initialise = True Then
                Control.Initialize 'If its a XP command button then initialise it.
            Else
                If BytEnabled = True Then
                    Control.Enabled = True
                Else
                    Control.Enabled = False
                End If
            End If
        End If
    Next
End Sub


