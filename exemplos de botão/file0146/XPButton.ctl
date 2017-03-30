VERSION 5.00
Begin VB.UserControl Command 
   AutoRedraw      =   -1  'True
   ClientHeight    =   420
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1755
   ScaleHeight     =   420
   ScaleWidth      =   1755
   ToolboxBitmap   =   "XPButton.ctx":0000
   Begin VB.Timer TmrMouse 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   1485
      Top             =   2520
   End
   Begin VB.Image HighLight 
      Height          =   375
      Left            =   945
      Picture         =   "XPButton.ctx":0312
      Top             =   1800
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.Image Pressed 
      Height          =   375
      Left            =   1890
      Picture         =   "XPButton.ctx":1614
      Top             =   1800
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.Image Normal 
      Height          =   375
      Left            =   0
      Picture         =   "XPButton.ctx":2916
      Top             =   1800
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.Label LblMsg 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Command"
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   0
      TabIndex        =   0
      Top             =   90
      Width           =   1635
      WordWrap        =   -1  'True
   End
   Begin VB.Image Disable 
      Height          =   375
      Left            =   2835
      Picture         =   "XPButton.ctx":3C18
      Top             =   1800
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.Image HighLightSelect 
      Height          =   375
      Left            =   4770
      Picture         =   "XPButton.ctx":4F1A
      Top             =   1800
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.Image Selected 
      Height          =   375
      Left            =   3825
      Picture         =   "XPButton.ctx":621C
      Top             =   1800
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.Line LeftLine 
      BorderStyle     =   3  'Dot
      DrawMode        =   6  'Mask Pen Not
      X1              =   2610
      X2              =   2610
      Y1              =   1080
      Y2              =   1515
   End
   Begin VB.Line TopLine 
      BorderStyle     =   3  'Dot
      DrawMode        =   6  'Mask Pen Not
      X1              =   1710
      X2              =   3665
      Y1              =   1755
      Y2              =   1755
   End
   Begin VB.Line BottomLine 
      BorderStyle     =   3  'Dot
      DrawMode        =   6  'Mask Pen Not
      X1              =   1710
      X2              =   3665
      Y1              =   1665
      Y2              =   1665
   End
   Begin VB.Line RightLine 
      BorderStyle     =   3  'Dot
      DrawMode        =   6  'Mask Pen Not
      X1              =   2700
      X2              =   2700
      Y1              =   1080
      Y2              =   1515
   End
End
Attribute VB_Name = "Command"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function SendMessageByNum& Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
Private Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As Where) As Long
Private Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Private Declare Function GradientFill Lib "msimg32" (ByVal hDC As Long, ByRef pVertex As TRIVertex, ByVal dwNumVertex As Long, pMesh As Any, ByVal dwNumMesh As Long, ByVal dwMode As Long) As Integer

Private Type GRADIENT_RECT
    UpperLeft As Long
    LowerRight As Long
End Type

Private Type TRIVertex
    X As Long
    Y As Long
    Red As Integer
    Green As Integer
    Blue As Integer
    Alpha As Integer
End Type

Dim gRect As GRADIENT_RECT
Dim Vertex(2) As TRIVertex
Dim BlnHighlighted As Boolean

Private Type Where
    Pointa As Long
    Pointb As Long
End Type

Private Const TopColor = "&HFFFFFF" 'RGB values
Private Const BottomColor = "&HC6C5D7"
Private Const TopColorH = "&HC6C5D7"
Private Const BottomColorH = "&HFFFFFF"

Event Click() 'This is the Event Click on the button
              'eg command1_click()

Dim FirstTime As Byte 'first time running
Dim FormEnabled As Boolean 'Whether the form is enabled or Enabled
Dim State As Byte 'Button State 1 Normal
'                               2 HighLight
'                               3 Selected
'                               4 HighlightSelected

'Different regions of the button
Private Type TopLeft1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
End Type

Private Type Top1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
    PicWidth As Integer 'Width of image from pic
End Type

Private Type TopRight1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
End Type

Private Type Right1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
    PicHeight As Integer 'Height of image from pic
End Type

Private Type BottomRight1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
End Type

Private Type Bottom1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
    PicWidth As Integer 'Width of image from pic
End Type

Private Type BottomLeft1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
End Type

Private Type Left1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
    PicHeight As Integer 'Height of image from pic
End Type

Private Type Middle1
    X As Integer 'X location on the form
    Y As Integer 'Y location on the form
    Width As Integer 'Width of the image to paint
    Height As Integer 'Height of the image to paint
End Type

Dim TopLeft As TopLeft1
Dim Top As Top1
Dim TopRight As TopRight1
Dim Right As Right1
Dim BottomRight As BottomRight1
Dim Bottom As Bottom1
Dim BottomLeft As BottomLeft1
Dim Left As Left1
Dim Middle As Middle1
Dim MouseDown As Boolean

Private Sub LblMsg_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Local Error Resume Next
    UserControl_MouseDown Button, Shift, X, Y 'Change to pressed picture
End Sub

Private Sub LblMsg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Local Error Resume Next
    UserControl_MouseMove Button, Shift, X, Y 'Change to Highlight picture
End Sub

Private Sub LblMsg_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Local Error Resume Next
    UserControl_MouseUp Button, Shift, X, Y 'RaiseEvent Click
End Sub

Private Sub TmrMouse_Timer()
On Local Error Resume Next
    Dim AnB As Where
    Call GetCursorPos(AnB)
    parenthwnd = WindowFromPoint(AnB.Pointa, AnB.Pointb) 'Mouse pos.
    If parenthwnd = Parent.hWnd Then
        Refresh
    Else
        If parenthwnd <> Parent.hWnd And parenthwnd <> UserControl.hWnd Then
            Refresh
        End If
    End If
End Sub

Private Sub UserControl_GotFocus()
On Local Error Resume Next
If FormEnabled = False Then Exit Sub
    If State <> 2 Then
        State = 3
        Paint Selected 'Paint Selected Button
    End If
    If State = 2 Then
        State = 4
        Paint Pressed
    End If
End Sub

Public Sub Initialize()
On Local Error Resume Next
    State = 1
    TmrMouse.Enabled = True
    TmrMouse.Interval = 100
End Sub

Private Sub UserControl_LostFocus()
On Local Error Resume Next
If FormEnabled = False Then Exit Sub
    If State <> 1 Then
        State = 1
        Paint Normal 'Paint Selected Button
    End If
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Local Error Resume Next
If FormEnabled = False Then Exit Sub
    If Button = 1 Then
        MouseDown = True
        Paint Pressed 'If not already pressed image painted then paint it
    End If
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Local Error Resume Next
If FormEnabled = False Then Exit Sub
    If State = 1 Then
        State = 2
        Paint HighLight 'If not already highlighted image painted then paint it
    End If
    
    If State = 3 And MouseDown = False Then
        State = 4
        Paint HighLightSelect
    End If
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Local Error Resume Next
If FormEnabled = False Then Exit Sub
    If Button = 1 Then
        
        MouseDown = False
        
        If State = 2 Then
            Paint Normal 'paint normal image
        End If
    
        If State = 4 Then
            Paint HighLightSelect 'Paint highlighted image
        End If
    End If

    If FormEnabled = True And State <> 3 Then
        RaiseEvent Click 'Raise event click
    End If
End Sub

Private Sub UserControl_Resize()
On Local Error Resume Next
    DoForm 'this repaints the form if its Enabled or not
End Sub


Private Sub Paint(Pic As Image)
'This sub calculates where to put the 9 images to paint
'and then stretches each part to fit
'Top left, top, top right, right, bototm right, bottom
'bottom left, left, middle are the images
'The reason for not the whole picture is because
'if you stretch it, the border of the button stretches
'as well. If you have individual pieces and stretch them
'the right way, there will be no signs of distortion.
On Local Error Resume Next
    If State = 1 Then BlnHighlighted = False
    If State = 2 Then BlnHighlighted = True
    If State = 3 Then BlnHighlighted = False
    TopLeft.X = 1
    TopLeft.Y = 1
    TopLeft.Width = 60
    TopLeft.Height = 60
    
    Top.X = TopLeft.Width
    Top.Y = TopLeft.Y
    Top.Width = UserControl.Width - (2 * TopLeft.Width)
    Top.Height = TopLeft.Height
    Top.PicWidth = 960 - (2 * TopLeft.Width)
    
    TopRight.X = TopLeft.Width + Top.Width
    TopRight.Y = TopLeft.Y
    TopRight.Width = TopLeft.Width
    TopRight.Height = TopLeft.Height
    
    Right.X = TopRight.X
    Right.Y = TopRight.Height
    Right.Width = TopRight.Width
    Right.Height = UserControl.Height - (2 * TopRight.Height)
    Right.PicHeight = 375 - (2 * TopRight.Height)
    
    BottomRight.X = TopRight.X
    BottomRight.Y = TopRight.Height + Right.Height
    BottomRight.Width = TopRight.Width
    BottomRight.Height = 105
    
    Bottom.X = TopLeft.Width
    Bottom.Y = BottomRight.Y
    Bottom.Width = Top.Width
    Bottom.Height = Top.Height
    Bottom.PicWidth = Top.PicWidth
    
    BottomLeft.X = TopLeft.X
    BottomLeft.Y = Bottom.Y
    BottomLeft.Width = TopLeft.Width
    BottomLeft.Height = BottomRight.Height
    
    Left.X = TopLeft.X
    Left.Y = TopLeft.Height
    Left.Width = TopLeft.Width
    Left.Height = Right.Height
    Left.PicHeight = Right.PicHeight
    
    Middle.X = TopLeft.Width
    Middle.Y = TopLeft.Height
    Middle.Width = Top.Width
    Middle.Height = Left.Height
    
    UserControl.Cls 'Clear any existing image
                    'Paint the new image
    SetGradient
    UserControl.PaintPicture Pic, TopLeft.X, TopLeft.Y, , , , , TopLeft.Width, TopLeft.Height
    UserControl.PaintPicture Pic, Top.X, Top.Y, Top.Width, , TopLeft.Width, 1, Top.PicWidth, Top.Height
    UserControl.PaintPicture Pic, TopRight.X, TopRight.Y, , , Top.PicWidth + TopRight.Width, 1, TopRight.Width, TopRight.Height
    UserControl.PaintPicture Pic, Right.X, Right.Y, , Right.Height, Top.PicWidth + TopRight.Width, TopRight.Height, Right.Width, Right.PicHeight
    UserControl.PaintPicture Pic, BottomRight.X, BottomRight.Y, , , Top.PicWidth + TopRight.Width, TopRight.Height + Right.PicHeight, BottomRight.Width, BottomRight.Height
    UserControl.PaintPicture Pic, Bottom.X, Bottom.Y, Bottom.Width, , BottomLeft.Width, TopRight.Height + Right.PicHeight, Bottom.PicWidth, Bottom.Height
    UserControl.PaintPicture Pic, BottomLeft.X, BottomLeft.Y, , , , TopRight.Height + Right.PicHeight, TopLeft.Width, Bottom.Height
    UserControl.PaintPicture Pic, Left.X, Left.Y, , Left.Height, Left.X, TopLeft.Height, Left.Width, Left.PicHeight
    'UserControl.PaintPicture Pic, Middle.X, Middle.Y, Middle.Width, Middle.Height, TopLeft.Width * 2, TopLeft.Height * 2, TopLeft.Width, TopLeft.Height
    UserControl.Refresh
    
    'centre buttons caption
    LblMsg.Top = (UserControl.Height - LblMsg.Height - 20) / 2
    LblMsg.Left = 0 'Left.Width
    LblMsg.Width = UserControl.Width '- Right.Width
    
    LeftLine.Visible = False
    TopLine.Visible = False
    RightLine.Visible = False
    BottomLine.Visible = False
    
    If State = 3 Or State = 4 Then 'Draw dotted line around button
        LeftLine.Visible = True
        TopLine.Visible = True
        RightLine.Visible = True
        BottomLine.Visible = True
        
        LeftLine.X1 = 0 + TopLeft.Width
        LeftLine.Y1 = 0 + TopLeft.Height
        LeftLine.X2 = 0 + TopLeft.Width
        LeftLine.Y2 = UserControl.Height - TopLeft.Height
        
        TopLine.X1 = 0 + TopLeft.Width
        TopLine.Y1 = 0 + TopLeft.Height
        TopLine.X2 = UserControl.Width - TopLeft.Width
        TopLine.Y2 = 0 + TopLeft.Height
        
        RightLine.X1 = UserControl.Width - (TopLeft.Width) - 10
        RightLine.Y1 = 0 + TopLeft.Height
        RightLine.X2 = UserControl.Width - (TopLeft.Width) - 10
        RightLine.Y2 = UserControl.Height - TopLeft.Height
        
        BottomLine.X1 = 0 + BottomLeft.Width
        BottomLine.Y1 = UserControl.Height - TopLeft.Height - 10
        BottomLine.X2 = UserControl.Width - BottomLeft.Width
        BottomLine.Y2 = UserControl.Height - TopLeft.Height - 10
    End If
End Sub

Private Sub Refresh()
'This sub gets called in the main form in the
'form_mousemove property. Eg Command1.Refreshit
'This just repaints the normal picture when you move
'off the button otherwise it stays highlighted
On Local Error Resume Next
    If FormEnabled = False Then Exit Sub
    
    If State = 2 Then
        State = 1
        Paint Normal
    End If
    
    If State = 4 Then
        State = 3
        Paint Selected
    End If
End Sub

Public Property Let Visible(New_Visible As Byte)
On Local Error Resume Next
    If New_Visible = False Then
        UserControl.BackStyle = 0
    Else
        UserControl.BackStyle = 1
        RedoControl
    End If
        
    PropertyChanged "Visible"
    
End Property

Private Sub SetGradient()
    If BlnHighlighted = False Then
        Vertex(0).Red = "&H" & Mid$(Hex$(TopColor), 1, 2) + "00": Vertex(1).Red = "&H" & Mid$(Hex$(BottomColor), 1, 2) + "00"
        Vertex(0).Green = "&H" & Mid$(Hex$(TopColor), 3, 2) + "00": Vertex(1).Green = "&H" & Mid$(Hex$(BottomColor), 3, 2) + "00"
        Vertex(0).Blue = "&H" & Mid$(Hex$(TopColor), 5, 2) + "00": Vertex(1).Blue = "&H" & Mid$(Hex$(BottomColor), 5, 2) + "00"
    Else
        Vertex(0).Red = "&H" & Mid$(Hex$(TopColorH), 1, 2) + "00": Vertex(1).Red = "&H" & Mid$(Hex$(BottomColorH), 1, 2) + "00"
        Vertex(0).Green = "&H" & Mid$(Hex$(TopColorH), 3, 2) + "00": Vertex(1).Green = "&H" & Mid$(Hex$(BottomColorH), 3, 2) + "00"
        Vertex(0).Blue = "&H" & Mid$(Hex$(TopColorH), 5, 2) + "00": Vertex(1).Blue = "&H" & Mid$(Hex$(BottomColorH), 5, 2) + "00"
    End If

    UserControl.ScaleMode = vbPixels
    
    Vertex(0).X = 0: Vertex(1).X = UserControl.ScaleWidth - 1
    Vertex(0).Y = 0: Vertex(1).Y = UserControl.ScaleHeight - 1
    
    gRect.UpperLeft = 1
    gRect.LowerRight = 0
    
    GradientFill UserControl.hDC, Vertex(0), 4, gRect, 1, 1
    
    UserControl.ScaleMode = 1
    UserControl.Refresh
End Sub

Public Property Get Visible() As Byte
On Local Error Resume Next
    If UserControl.BackStyle = 0 Then
        Visible = False
    Else
        Visible = True
        RedoControl
    End If
End Property

Public Property Let FontColour(New_FontColour As OLE_COLOR)
On Local Error GoTo ErrorTrap
    LblMsg.ForeColor = New_FontColour
    RedoControl
    PropertyChanged "FontColour"
    Exit Property
ErrorTrap:
    RedoControl
End Property

Public Property Get FontColour() As OLE_COLOR
On Local Error GoTo ErrorTrap
    FontColour = LblMsg.ForeColor
    RedoControl
    Exit Property
ErrorTrap:
    RedoControl
    Resume Next
End Property

Public Property Get Enabled() As Boolean
On Local Error Resume Next
    If FirstTime = 0 Then
        RedoControl
        FirstTime = 1
        FormEnabled = True
    End If
        
    Enabled = FormEnabled
    DoForm
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
On Local Error Resume Next
    FormEnabled = New_Enabled
    PropertyChanged "Enabled"
    DoForm
End Property

Public Property Get Caption() As String
On Local Error Resume Next
    Caption = LblMsg.Caption
End Property

Public Property Let Caption(ByVal New_Caption As String)
On Local Error Resume Next
    LblMsg.Caption() = New_Caption
    PropertyChanged "Caption"
End Property

Public Property Get Font() As Font
On Local Error Resume Next
    Set Font = LblMsg.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
On Local Error Resume Next
    Set LblMsg.Font = New_Font
    PropertyChanged "Font"
End Property

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
On Local Error Resume Next
    FormEnabled = PropBag.ReadProperty("Enabled", True)
    LblMsg.Caption = PropBag.ReadProperty("Caption", "Command1")
    LblMsg.Font = PropBag.ReadProperty("Font", Ambient.Font)
    FirstTime = PropBag.ReadProperty("FirstRun", "1")
    LblMsg.ForeColor = PropBag.ReadProperty("FontColour", "0")
    UserControl.BackStyle = PropBag.ReadProperty("Visible", "1")
    RedoControl
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
On Local Error Resume Next
    PropBag.WriteProperty "Enabled", FormEnabled, True
    PropBag.WriteProperty "Caption", LblMsg.Caption, "Command"
    PropBag.WriteProperty "FirstRun", FirstTime, "1"
    PropBag.WriteProperty "Font", LblMsg.Font, Ambient.Font
    PropBag.WriteProperty "FontColour", LblMsg.ForeColor, "0"
    PropBag.WriteProperty "Visible", UserControl.BackStyle, "1"
    RedoControl
End Sub

Private Sub DoForm()
On Local Error Resume Next
    If FormEnabled = False Then
        Paint Disable
        LblMsg.Enabled = False
    Else
        Paint Normal
        LblMsg.Enabled = True
    End If
End Sub

Private Sub RedoControl()
On Local Error Resume Next
If FormEnabled = False Then Exit Sub
On Local Error GoTo ErrorTrap
    LblMsg.Enabled = True
    
    If FirstTime = 0 Then
        LblMsg.Tag = 15724527
        LblMsg.ForeColor = 0
    End If
    
    Paint Normal
    Exit Sub
ErrorTrap:
    LblMsg.Tag = 15724527
    LblMsg.ForeColor = 0
    Resume Next
End Sub

