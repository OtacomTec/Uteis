unit Frame2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ListKeyPress(Sender: TObject; var Key: Char);

    procedure EditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

Uses Frame1;
{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);

begin
// Form1.Leitura_FormasdePagamento();


end;



procedure TForm2.ListKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#13 then
        begin
           Form2.Edit1.SetFocus;
        end;
end;



procedure TForm2.EditKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#13 then
        begin

        if GroupBox1.Caption='Suprimento' then
        begin
        Form1.Verifica_ECF();
        iRet := Frame1.Bematech_FI_Suprimento(Pchar(Edit1.Text),
        Pchar(Form2.ListBox1.Items[Form2.ListBox1.ItemIndex]));

        Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();

        Form2.ListBox1.Clear;
        Form2.Edit1.Text:='';
        Form2.Close;
        end;
        if GroupBox1.Caption='Fechamento Cupom' then
        begin
           iRet := Frame1.Bematech_FI_FechaCupomResumido(Pchar(Form2.ListBox1.Items[Form2.ListBox1.ItemIndex]),Pchar(Edit1.Text));
        end;

         Form2.ListBox1.Clear;
        Form2.Edit1.text:='';
        Form2.Close;
        end;//Final do if #13

end;//Final da Rotina

end.
