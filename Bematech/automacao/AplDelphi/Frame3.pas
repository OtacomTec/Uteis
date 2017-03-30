unit Frame3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    procedure MemoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
 Uses Frame1;
{$R *.DFM}

procedure TForm3.MemoKeyPress(Sender: TObject; var Key: Char);
var
  FileHandle: TextFile;
  FileContents: string;
begin

if Key = #13 then
begin
Form1.Verifica_ECF();
Frame1.iRet := Frame1.Bematech_FI_MapaResumo();
Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();


    AssignFile(FileHandle, 'c:\Retorno.txt');
    Reset(FileHandle);
    Readln(FileHandle, FileContents);
    Form3.Memo1.Text:=' M A P A   R E S U M O' +#13+#10+'=============================='+#13+#10;

While FileContents<>'' do
begin

        iRet := Frame1.Bematech_FI_RelatorioGerencial(Pchar(FileContents));
        Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();
        Readln(FileHandle, FileContents);
end;

    Frame1.Bematech_FI_FechaRelatorioGerencial();
    CloseFile(FileHandle);
    Form3.Hide;
end;
Form3.Hide;
end;



end.
