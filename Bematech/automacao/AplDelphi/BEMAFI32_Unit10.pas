unit BEMAFI32_Unit10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm10 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label5: TLabel;
    Edit4: TEdit;
    GroupBox3: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label6: TLabel;
    Edit5: TEdit;
    GroupBox4: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label7: TLabel;
    Edit6: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  sAliquota: String;
  sTipoQtde: String;
  iDecimal: Integer;
  sTipoDesconto: String;

implementation

Uses BEMAFI32_Unit1;

{$R *.DFM}

Procedure TForm10.Button1Click(Sender: TObject);
  Begin

    //  Verifica o Tipo da Quantidade:
    // 'I' para Inteira ou 'F' para Fracion�ria

    If RadioButton1.Checked = True Then Begin sTipoQtde := 'I' End;
    If RadioButton2.Checked = True Then Begin sTipoQtde := 'F' End;

    // Verifica o Tipo de Decimal:
    // 2 para duas casas ou 3 para tr�s casas

    If RadioButton3.Checked = True Then Begin iDecimal := 2 End;
    If RadioButton4.Checked = True Then Begin iDecimal := 3 End;

    // Verifica o Tipo de Desconto:
    // '%' para percentual ou '$' para valor

    If RadioButton5.Checked = True Then Begin sTipoDesconto := '%' End;
    If RadioButton6.Checked = True Then Begin sTipoDesconto := '$' End;

    {
    iRetorno := Bematech_FI_VendeItem( Pchar('123ABC'), Pchar('Impressora Fiscal'),
                                       Pchar('1700'), Pchar('I'), Pchar('0001'), 2, Pchar('85000'),
                                       Pchar('%'), Pchar('1000') );
    }

    iRetorno := Bematech_FI_VendeItem( Edit1.Text, Edit2.Text, Edit3.Text,
                sTipoQtde, Edit4.Text, iDecimal, Edit5.Text,
                sTipoDesconto, Edit6.Text );

    Form1.Analisa_iRetorno();
    Form1.Retorno_Impressora();
  End;

Procedure TForm10.Edit4Change(Sender: TObject);
  Begin
    If RadioButton1.Checked = True Then Begin Edit3.MaxLength := 4; End;
    If RadioButton2.Checked = True Then Begin Edit3.MaxLength := 7; End;
  End;

Procedure TForm10.Button2Click(Sender: TObject);
  Begin
    Form10.Close;
  End;

Procedure TForm10.Edit6Change(Sender: TObject);
  Begin
    If RadioButton5.Checked = True Then Begin Edit5.MaxLength := 4; End;
    If RadioButton6.Checked = True Then Begin Edit5.MaxLength := 8; End;
  End;


// Cria��o do Conjunto de Al�quotas
// � usada a fun��o Bematech_FI_RetornoAl�quotas para obter as al�quotas
// que est�o programadas na impressora

Procedure TForm10.FormCreate(Sender: TObject);
  Var cAliquotas, cAliq, cVerCaracter, cCompleto: String;
      iConta: Integer;
  Begin
     For iConta := 1 To 79 Do Begin cAliquotas := cAliquotas + ' ' End;
     iRetorno := Bematech_FI_RetornoAliquotas( cAliquotas );
     For iConta := 1 To Length( Trim( cAliquotas ) ) Do
         Begin
            cVerCaracter := Copy( cAliquotas, iConta, 1 );
            If cVerCaracter <> ',' Then
                 Begin
                   cAliq := cAliq + cVerCaracter;
                 End
               Else
                 Begin
                   cCompleto := cCompleto + cAliq + #13;
                 End;
         End;

  End;


End.