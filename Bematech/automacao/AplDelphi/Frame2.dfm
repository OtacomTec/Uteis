object Form2: TForm2
  Left = 246
  Top = 127
  Width = 229
  Height = 183
  BiDiMode = bdLeftToRight
  Caption = 'ECFDELPHI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 193
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Valor:'
    end
    object Edit1: TEdit
      Left = 24
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = EditKeyPress
    end
  end
  object ListBox1: TListBox
    Left = 32
    Top = 13
    Width = 145
    Height = 68
    ItemHeight = 13
    TabOrder = 1
    OnKeyPress = ListKeyPress
  end
end
