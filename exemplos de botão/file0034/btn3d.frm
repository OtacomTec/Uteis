VERSION 5.00
Object = "{897F6C5E-0831-11D1-B752-444553540000}#1.0#0"; "BOTAO3D.OCX"
Begin VB.Form Form1 
   Caption         =   "Como Utilizar o Botão 3D"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin Botao3D.Botao Botao1 
      Height          =   855
      Left            =   840
      TabIndex        =   0
      ToolTipText     =   "Executar"
      Top             =   120
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   1508
      Picture         =   "btn3d.frx":0000
      Bordas          =   -1  'True
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
'Não esqueça de colocar na propriedade borda (True)
'Execute o programa e passe o mouse sobre o botão
'Não esqueça de relacionar o botão a uma imagem ou ícone na propriedade (Picture)
'Coloque o que o botão faz no ToolTipText
End Sub
