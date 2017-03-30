unit Frame1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ExtCtrls, DBCtrls, Menus, ComCtrls;



type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Relatorios1: TMenuItem;
    LeituraX1: TMenuItem;
    ReducaoZ1: TMenuItem;
    LeituraMF1: TMenuItem;
    ConfiguracaoECF1: TMenuItem;
    TrocaOperador1: TMenuItem;
    Suprimento1: TMenuItem;
    Sangria1: TMenuItem;
    MapaResumo1: TMenuItem;
    Departamentos1: TMenuItem;
    RelatorioTipo601: TMenuItem;
    GroupBox1: TGroupBox;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText1: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    LCaixaLivre: TLabel;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    CupomFiscal1: TMenuItem;
    Sair1: TMenuItem;
    InicirVenda1: TMenuItem;
    CancelaCupom1: TMenuItem;
    CancelaUltimo1: TMenuItem;
    CancelaNumero1: TMenuItem;
    FechaCupomRapido1: TMenuItem;
    FechaCupomFormas1: TMenuItem;
    MLogCupom: TMemo;
    ECodigo: TEdit;

    Procedure Analisa_Retorno_ECF;
    Procedure Analisa_Retorno_DLL;
    Procedure Verifica_ECF;
    Procedure Leitura_FormasdePagamento;

    procedure LeituraX1Click(Sender: TObject);
    procedure ReducaoZ1Click(Sender: TObject);
    procedure LeituraMF1Click(Sender: TObject);
    procedure ConfiguracaoECF1Click(Sender: TObject);
    procedure Suprimento1Click(Sender: TObject);
    procedure Sangria1Click(Sender: TObject);
    procedure MapaResumo1Click(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure TrocaOperador1Click(Sender: TObject);
    procedure RelatorioTipo601Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure InicirVenda1Click(Sender: TObject);
    procedure ECodigoKeyPress(Sender: TObject; var Key: Char);
    procedure CancelaUltimo1Click(Sender: TObject);
    procedure CancelaNumero1Click(Sender: TObject);
    procedure CancelaCupom1Click(Sender: TObject);
    procedure FechaCupomRapido1Click(Sender: TObject);
    procedure FechaCupomFormas1Click(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;
//Funções do ECF

{ Declaração das Funções da nova DLL BEMAFI32.DLL }

// Funções de Inicialização ////////////////////////////////////////////////////

function Bematech_FI_AlteraSimboloMoeda(SimboloMoeda: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaAliquota(Aliquota: String; ICMS_ISS: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaHorarioVerao: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaDepartamento(Indice: Integer; Departamento: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer; Totalizador: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaArredondamento:Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaTruncamento:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ProgramaTruncamento';
function Bematech_FI_LinhasEntreCupons(Linhas: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EspacoEntreLinhas(Dots: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ForcaImpactoAgulhas(ForcaImpacto: Integer): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções do Cupom Fiscal /////////////////////////////////////////////////////

function Bematech_FI_AbreCupom(CGC_CPF: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItemDepartamento(Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemAnterior: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemGenerico(NumeroItem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupomResumido(FormaPagamento: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupom(FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ResetaImpressora:Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento(FormaPagamento: String; ValorFormaPagamento: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoDescricaoForma(FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom(Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EstornoFormasPagamento(FormaOrigem: String; FormaDestino: String; Valor: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaUnidadeMedida(UnidadeMedida: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AumentaDescricaoItem(Descricao: String): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções dos Relatórios Fiscais //////////////////////////////////////////////

function Bematech_FI_LeituraX:Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ(Data: String; Hora: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencial(Texto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaRelatorioGerencial:Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalData(DataInicial: String; DataFinal: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducao(ReducaoInicial: String; ReducaoFinal: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialData(DataInicial: String; DataFinal: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducao(ReducaoInicial: String; ReducaoFinal: String): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções das Operações Não Fiscais ///////////////////////////////////////////

function Bematech_FI_RecebimentoNaoFiscal(IndiceTotalizador: String; Valor: String; FormaPagamento: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreComprovanteNaoFiscalVinculado(FormaPagamento: String; Valor: String; NumeroCupom: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculado(Texto: String): Integer; StdCall; External 'BEMAFI32.DLL'
function Bematech_FI_FechaComprovanteNaoFiscalVinculado:Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Sangria(Valor: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Suprimento(Valor: String; FormaPagamento: String): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções de Informações da Impressora ////////////////////////////////////////

function Bematech_FI_NumeroSerie(NumeroSerie: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotal(SubTotal: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom(NumeroCupom: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraXSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VersaoFirmware(VersaoFirmware: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CGC_IE(CGC: String; IE: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotal(GrandeTotal: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Cancelamentos(ValorCancelamentos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Descontos(ValorDescontos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroOperacoesNaoFiscais(NumeroOperacoes: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCuponsCancelados(NumeroCancelamentos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroIntervencoes(NumeroIntervencoes: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroReducoes(NumeroReducoes: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSubstituicoesProprietario(NumeroSubstituicoes: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UltimoItemVendido(NumeroItem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ClicheProprietario(Cliche: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCaixa(NumeroCaixa: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroLoja(NumeroLoja: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SimboloMoeda(SimboloMoeda: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MinutosLigada(Minutos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MinutosImprimindo(Minutos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaModoOperacao(Modo: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEpromConectada(Flag: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FlagsFiscais(Var Flag: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorPagoUltimoCupom(ValorCupom: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraImpressora(Data: String; Hora: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadoresTotalizadoresNaoFiscais(Contadores: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresNaoFiscais(Totalizadores: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraReducao(Data: String; Hora: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataMovimento(Data: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTruncamento(Flag: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Acrescimos(ValorAcrescimos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorBilhetePassagem(ContadorPassagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaAliquotasIss(Flag: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFormasPagamento(Formas: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRecebimentoNaoFiscal(Recebimentos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaDepartamentos(Departamentos: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTipoImpressora(Var TipoImpressora: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresParciais(Totalizadores: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoAliquotas(Aliquotas: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressora(Var ACK: Integer; Var ST1: Integer; Var ST2: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosUltimaReducao(DadosReducao: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MonitoramentoPapel(Var Linhas: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaIndiceAliquotasIss(Flag: String): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções de Autenticação e Gaveta de Dinheiro ////////////////////////////////

function Bematech_FI_Autenticacao:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_Autenticacao';
function Bematech_FI_ProgramaCaracterAutenticacao(Parametros: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcionaGaveta:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_AcionaGaveta';
function Bematech_FI_VerificaEstadoGaveta(Var EstadoGaveta: Integer): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções para a Impressora Restaurante ///////////////////////////////////////

function Bematech_FIR_AbreCupomRestaurante(Mesa: String; CGC_CPF: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RegistraVenda (Mesa: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; ValorUnitario: String; FlagAcrescimoDesconto: String; ValorAcrescimoDesconto: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_CancelaVenda (Mesa: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; ValorUnitario: String; FlagAcrescimoDesconto: String; ValorAcrescimoDesconto: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ConferenciaMesa (Mesa: String; FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_AbreConferenciaMesa (Mesa: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaConferenciaMesa (FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_TransferenciaMesa (MesaOrigem: String; MesaDestino: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ContaDividida (NumeroCupons: String; ValorPago: String; CGC_CPF: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomContaDividida (NumeroCupons: String; FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; FormasPagamento: String; ValorFormasPagamento: String; ValorPagoCliente: String; CGC_CPF: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_TransferenciaItem (MesaOrigem: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; ValorUnitario: String; FlagAcrescimoDesconto: String; ValorAcrescimoDesconto: String; MesaDestino: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RelatorioMesasAbertas (TipoRelatorio: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ImprimeCardapio : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RelatorioMesasAbertasSerial : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_CardapioPelaSerial : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RegistroVendaSerial(Mesa: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_VerificaMemoriaLivre (Bytes: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomRestaurante (FormaPagamento: String; FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorFormaPagto: String; Mensagem: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomResumidoRestaurante(FormaPagamento: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';


// Função para a Impressora Bilhete de Passagem

function Bematech_FI_AbreBilhetePassagem(ImprimeValorFinal: string;
  		                         ImprimeEnfatizado: string;
                                         Embarque         : string;
                                         Destino          : string;
                                         Linha            : string;
                                         Prefixo          : string;
                                         Agente           : string;
                                         Agencia          : string;
                                         Data             : string;
                                         Hora             : string;
                                         Poltrona         : string;
                                         Plataforma       : string ): Integer; StdCall; External 'BEMAFI32.DLL';


// Funções de Impressão de Cheques /////////////////////////////////////////////

function Bematech_FI_ProgramaMoedaSingular(MoedaSingular: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaMoedaPlural(MoedaPlural: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaImpressaoCheque:Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaStatusCheque(Var StatusCheque: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeCheque(Banco: String; Valor: String; Favorecido: String; Cidade: String; Data: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IncluiCidadeFavorecido(Cidade: String; Favorecido: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeCopiaCheque:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeCopiaCheque';


// Funções para o TEF

function Bematech_FITEF_Status(Identificacao: string): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_VendaCartao(Identificacao: string; ValorCompra: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_ConfirmaVenda(Identificacao: string; ValorCompra: string; Header: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_NaoConfirmaVendaImpressao(Identificacao: string; ValorCompra: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_CancelaVendaCartao(Identificacao: string; ValorCompra: string; Nsu: string; NumeroCupom: string; Hora: string; Data: string; Rede: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_ImprimeTEF(Identificacao: string; FormaPagamento: string; ValorCompra: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_ImprimeRelatorio: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FITEF_ImprimeRelatorio';
function Bematech_FITEF_ADM(Identificacao: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FITEF_VendaCompleta(Identificacao: string; ValorCompra: string; FormaPagamento: string; Texto: string): Integer; StdCall; External 'BEMAFI32.DLL';


// Outras Funções //////////////////////////////////////////////////////////////

function Bematech_FI_AbrePortaSerial:Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora(Var ACK: Integer; Var ST1: Integer; Var ST2: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaPortaSerial:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FechaPortaSerial';
function Bematech_FI_MapaResumo:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_MapaResumo';
function Bematech_FI_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechamentoDoDia:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FechamentoDoDia';
function Bematech_FI_ImprimeConfiguracoesImpressora:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeConfiguracoesImpressora';
function Bematech_FI_ImprimeDepartamentos:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeDepartamentos';
function Bematech_FI_RelatorioTipo60Analitico:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Analitico';
function Bematech_FI_RelatorioTipo60Mestre:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Mestre';
function Bematech_FI_VerificaImpressoraLigada:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_VerificaImpressoraLigada';

{ Fim da Declaração }

var
  Form1: TForm1;
  iRet: Integer;
  Operador: string;
  Valor: string;
  aFormasPagamento: array[0..10] of string;
  Codigo:string;

 const  MSG_ECF_TURNOFF = 'ECF Desligada ou desconectada, Favor Verifique';
 const ECF_OK = 1;
 const MSG_DLL_NOTOK = 'Problemas ao Enviar Comando Para o ECF';
 const MSG_ECF_NAK = 'ECF Retornou NAK - Verifique Impressora e Cabo';

 const MSG_ST1_128 = 'FIM E PAPEL - FAVOR TROCAR A BOBINA';
 const MSG_ST1_64 = 'O PAPEL ESTÁ TERMINANDO - FAVOR VERIFICAR.';
 const MSG_ST1_32 = 'ERRO NO RELOGIO INTERNO DO ECF - CHAMAR ASSISTENCIA TECNICA!!';
 const MSG_ST1_16 = 'IMPRESSORA EM ERRO - DESLIGUE E LIGUE O ECF';
 const MSG_ST1_8 = 'ERRO NO ENVIO DO COMANDO - FAVOR REPETIR A OPERACÃO';
 const MSG_ST1_4 = 'COMANDO INEXISTENTE - FAVOR ABRIR CHAMADO SUPORTE';
 const MSG_ST1_2 = 'CUPOM FISCAL ABERTO - CANCELE O CUPOM OU TERMINE A VENDA';
 const MSG_ST1_1 = 'PARAMETRO INVALIDO - FAVOR ABRIR CHAMADO SUPORTE';

 const MSG_ST2_128 = 'TIPO DE CMD INVALIDO - FAVOR ABRIR CHAMADO SUPORTE';
 const MSG_ST2_64 = 'MEMORIA FISCAL CHEIA - CHAMAR ASSISTENCIA TECNICA!!';
 const MSG_ST2_32 = 'ERRO DE CMOS DO ECF - CHAMAR ASSISTENCIA TECNICA!!';
 const MSG_ST2_16 = 'ALIQUOTA NAO PROGRAMADA - FAVOR CANCELE O CUPOM E CADASTRE A ALIQUOTA';
 const MSG_ST2_8 = 'CAPACIDADE ALIQUOTA LOTADA - FAVOR ABRIR CHAMADO SUPORTE';
 const MSG_ST2_4 = 'CANCELAMENTO NAO PERMITIDO PELO ECF';
 const MSG_ST2_2 = 'CGC/IE NAO PROGRAMDOS  - CHAMAR ASSISTENCIA TECNICA!!';
 const MSG_ST2_1 = 'COMANDO NAO EXECUTADO - VERIFIQUE O STATUS DA IMPRESSORA';


implementation

uses Frame2, Frame3, Frame4;

{$R *.DFM}

Procedure TForm1.Analisa_Retorno_DLL;
Begin
        if iRet <>1 then
        Begin
           ShowMessage(MSG_DLL_NOTOK+'  Erro N:'+ IntToStr(iRet));
        End;

End;

Procedure TForm1.Verifica_ECF;
Begin
        if (Not (iRet = Frame1.Bematech_FI_VerificaImpressoraLigada())) then
        Begin
                ShowMessage(MSG_ECF_TURNOFF);
        end;

End;

Procedure TForm1.Analisa_Retorno_ECF;
  Var iACK, iST1, iST2: Integer;
  Begin
    iACK := 0; iST1 := 0; iST2 := 0;
    iRet := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
    If iACK = 6 then
       BEGIN
          // Decodifica o ST1
          IF iST1 >= 128 Then BEGIN iST1 := iST1 - 128;
                ShowMessage(MSG_ST1_128);
          END;
          IF iST1 >= 64  Then BEGIN iST1 := iST1 - 64;
                ShowMessage(MSG_ST1_64);
          END;
          IF iST1 >= 32  Then BEGIN iST1 := iST1 - 32;
                ShowMessage(MSG_ST1_32);
          END;
          IF iST1 >= 16  Then BEGIN iST1 := iST1 - 16;
                ShowMessage(MSG_ST1_16);
          END;
          IF iST1 >= 8   Then BEGIN iST1 := iST1 - 8;
                ShowMessage(MSG_ST1_8);
          END;
          IF iST1 >= 4   Then BEGIN iST1 := iST1 - 4;
                ShowMessage(MSG_ST1_4);
          END;
          IF iST1 >= 2   Then BEGIN iST1 := iST1 - 2;
                ShowMessage(MSG_ST1_2);
          END;
          IF iST1 >= 1   Then BEGIN iST1 := iST1 - 1;
                ShowMessage(MSG_ST1_1);
          END;

          // Decodifica o ST2 ST2

          IF iST2 >= 128 Then BEGIN iST2 := iST2 - 128;
            ShowMessage(MSG_ST2_128);
          END;
          IF iST2 >= 64  Then BEGIN iST2 := iST2 - 64;
            ShowMessage(MSG_ST2_64);
          END;
          IF iST2 >= 32  Then BEGIN iST2 := iST2 - 32;
            ShowMessage(MSG_ST2_32);
          END;
          IF iST2 >= 16  Then BEGIN iST2 := iST2 - 16;
            ShowMessage(MSG_ST2_16);
          END;
          IF iST2 >= 8   Then BEGIN iST2 := iST2 - 8;
            ShowMessage(MSG_ST2_8);
          END;
          IF iST2 >= 4   Then BEGIN iST2 := iST2 - 4;
            ShowMessage(MSG_ST2_4);
          END;
          IF iST2 >= 2   Then BEGIN iST2 := iST2 - 2;
            ShowMessage(MSG_ST2_2);
          END;
          IF iST2 >= 1   Then BEGIN iST2 := iST2 - 1;
            ShowMessage(MSG_ST2_1);
          END;

       End;

    If iACK = 21 Then BEGIN

       showmessage( MSG_ECF_NAK );
       //Application.Terminate;
       //Exit;
    End;
  End;


procedure TForm1.LeituraX1Click(Sender: TObject);
begin

 Verifica_ECF();
 iRet := Frame1.Bematech_FI_LeituraX();
 Analisa_Retorno_DLL();Analisa_Retorno_ECF();

end;

procedure TForm1.ReducaoZ1Click(Sender: TObject);
begin
 Verifica_ECF();
 iRet := Frame1.Bematech_FI_ReducaoZ('','');
 Analisa_Retorno_DLL();Analisa_Retorno_ECF();
end;

procedure TForm1.LeituraMF1Click(Sender: TObject);
 var Data1,Data2:string;
begin
 Data1 := InputBox('ECFDELPHI','Entre com a Data Inicial com o Formado DD/MM/AA', 'DD/MM/AA');
 Data2 := InputBox('ECFDELPHI','Entre com a Data Inicial com o Formado DD/MM/AA', 'DD/MM/AA');

 Verifica_ECF();
 iRet := Frame1.Bematech_FI_LeituraMemoriaFiscalData(Pchar(Data1),PChar(Data2));
 Analisa_Retorno_DLL();Analisa_Retorno_ECF();

end;

procedure TForm1.ConfiguracaoECF1Click(Sender: TObject);
begin
 Verifica_ECF();
 iRet := Bematech_FI_ImprimeConfiguracoesImpressora();
 Analisa_Retorno_DLL();Analisa_Retorno_ECF();

end;

procedure TForm1.Suprimento1Click(Sender: TObject);
begin

  Form2.GroupBox1.Caption:='Suprimento';
  Leitura_FormasdePagamento;
  iRet:=0;
  While aFormasPagamento[iRet]<>'' Do
  begin
    Form2.ListBox1.Items.Add(aFormasPagamento[iRet]);
    iRet:=iRet+1;
  end;
    Form2.ListBox1.Selected[0];
    Form2.ListBox1.SetFocus;
  iRet:=0;
  Form2.Show;

end;

procedure TForm1.Leitura_FormasdePagamento ;
Var sFormas: string;
    sDescricao: string;
    iConta:integer;
begin

  for iConta := 1 to 3016 do sFormas := sFormas + ' ';
  iRet := Bematech_FI_VerificaFormasPagamento( sFormas );

  sDescricao:='Dinheiro';
  iConta:=0;
  While (iconta<=16) do
  begin
      sDescricao:=Copy( sFormas, 0, 16);

      if (Trim(sDescricao)='') then
      begin
       exit;
      end;

      sFormas:=Copy(sFormas,59,StrLen(Pchar(sFormas)) - 60);
      aFormasPagamento[iConta]:=Trim(sDescricao);
      iConta:=iConta+1;

  end;


end;




procedure TForm1.Sangria1Click(Sender: TObject);
begin

Form1.Verifica_ECF();
iRet := Frame1.Bematech_FI_Sangria(Pchar(InputBox('ECFDELPHI','Entre com o Valor da Sangria','')));
Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();


end;

procedure TForm1.MapaResumo1Click(Sender: TObject);
var

  FileHandle: TextFile;
  FileContents: string;

begin

Verifica_ECF();
iRet := Bematech_FI_MapaResumo();
Analisa_Retorno_DLL();Analisa_Retorno_ECF();


    AssignFile(FileHandle, 'c:\Retorno.txt');
    Reset(FileHandle);
    Readln(FileHandle, FileContents);
    Form3.Memo1.Text:=' M A P A   R E S U M O' +#13+#10+'=============================='+#13+#10;

While FileContents<>'' do
begin
        //Verifica_ECF();
        //iRet := Frame1.Bematech_FI_RelatorioGerencial(Pchar(FileContents));
        //Analisa_Retorno_DLL();Analisa_Retorno_ECF();
        Form3.Memo1.text:=Form3.Memo1.text +Filecontents + #13+#10;
        Readln(FileHandle, FileContents);
end;

    CloseFile(FileHandle);
    Form3.show;
    Form3.Memo1.SetFocus;

end;

procedure TForm1.Departamentos1Click(Sender: TObject);
begin
    Verifica_ECF();
    iRet := Bematech_FI_ImprimeDepartamentos();
    Analisa_Retorno_DLL();
    Analisa_Retorno_ECF();
end;

procedure TForm1.TrocaOperador1Click(Sender: TObject);
Var
  Geral:string;
  Descontos,Cancelamentos,Acrescimos,Sangria,Suprimento:string;
  Contador:integer;

begin

Operador:= inputbox('ECFDELPHI','Entre com o Nome do Novo Operador','');
if Operador='' then begin  exit; end;

for Contador := 1 to 2000 do Geral := Geral + ' ';

iRet := Bematech_FI_Descontos(Geral);
Geral:=Trim(Geral);
Contador:=StrToInt(Pchar(Geral))div 100;
Descontos :=IntToStr(Contador);

iRet := Bematech_FI_Cancelamentos(Geral);
Geral:=Trim(Geral);
Contador:=StrToInt(Pchar(Geral))div 100;
Cancelamentos :=IntToStr(Contador);

iRet := Bematech_FI_Acrescimos(Geral);
Geral:=Trim(Geral);
Contador:=StrToInt(Pchar(Geral))div 100;
Acrescimos :=IntToStr(Contador);


{* Colocamos na variável Sangria e Suprimento os valores encontrados ao
chamar a função VerificaTotalizadoresParciais,
que entre vários totalizadores devolve o valor contabilizado no
totalizador Sangria e Suprimento. Observe que já formatamos e pegamos o
valor no meio da string retornada na Geral.
Nas posições 398 de 14 em 14 dígitos conseguimos os valores de Suprimento e
Sangria}
for Contador := 1 to 1000 do Geral := Geral + ' ';
iRet := Bematech_FI_VerificaTotalizadoresParciais(Geral);
Geral:=Trim(Geral);
Contador:=StrToInt((Copy(Geral, 398, 14)))div 100;
Sangria:=IntToStr(Contador);
Contador:=StrToInt((Copy(Geral, 413, 14)))div 100;
Suprimento:=IntToStr(Contador);

iRet := Bematech_FI_RelatorioGerencial('================================='+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('T R O C A   D E   O P E R A D O R'+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('================================='+#13+#10+#13+#10);

iRet := Bematech_FI_RelatorioGerencial('Operador: '+Operador+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('Descontos     Realizados: '+Descontos+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('Suprimentos   Realizados: '+Suprimento+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('Sangria       Realizada : '+Sangria+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('Acrescimos    Realizados: '+Acrescimos+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('Cancelamentos Realizados: '+Cancelamentos+#13+#10);

iRet := Bematech_FI_RelatorioGerencial('================================='+#13+#10);
iRet := Bematech_FI_RelatorioGerencial('================================='+#13+#10+#13+#10);

iRet := Bematech_FI_FechaRelatorioGerencial();
end;

procedure TForm1.RelatorioTipo601Click(Sender: TObject);
var
  FileHandle: TextFile;
  FileContents: string;

begin

Form1.Verifica_ECF();
 iRet := Bematech_FI_RelatorioTipo60Analitico();
Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();


    AssignFile(FileHandle, 'c:\Retorno.txt');
    Reset(FileHandle);
    Readln(FileHandle, FileContents);
    iRet:=Bematech_FI_RelatorioGerencial(' M A P A   R E S U M O TIPO 60 ANALITICO' +#13+#10+'=============================='+#13+#10);

While FileContents<>'' do
begin

        iRet := Frame1.Bematech_FI_RelatorioGerencial(Pchar(FileContents));
        Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();
        Readln(FileHandle, FileContents);
end;

    //Frame1.Bematech_FI_FechaRelatorioGerencial();
    CloseFile(FileHandle);


Form1.Verifica_ECF();
 iRet := Bematech_FI_RelatorioTipo60Mestre();
Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();


    AssignFile(FileHandle, 'c:\Retorno.txt');
    Reset(FileHandle);
    Readln(FileHandle, FileContents);
    iRet:=Bematech_FI_RelatorioGerencial(' M A P A   R E S U M O TIPO 60 Mestre' +#13+#10+'=============================='+#13+#10);

While FileContents<>'' do
begin

        iRet := Frame1.Bematech_FI_RelatorioGerencial(Pchar(FileContents));
        Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();
        Readln(FileHandle, FileContents);
end;

    Frame1.Bematech_FI_FechaRelatorioGerencial();
    CloseFile(FileHandle);






end;






procedure TForm1.Sair1Click(Sender: TObject);
begin
Application.Terminate
end;

procedure TForm1.InicirVenda1Click(Sender: TObject);
begin

LCaixaLivre.Visible:=False;
MLogCupom.Visible:=True;
ECodigo.Visible:=True;


MLogCupom.Text := 'Bematech Ind. Com.Equipamentos'+#13+#10;
MLogCupom.Text := MLogCupom.Text + 'C  U  P  O  M    F  I  S  C  A  L'+#13+#10;
MLogCupom.Text := MLogCupom.Text + 'CNPJ:12345678.87/0001'+#13+#10;
MLogCupom.Text := MLogCupom.Text + 'IE:123.456.78.87'+#13+#10;
MLogCupom.Text := MLogCupom.Text + '============================'+#13+#10+#13+#10;

ECodigo.text:='';
ECodigo.SetFocus;


end;

procedure TForm1.ECodigoKeyPress(Sender: TObject; var Key: Char);
begin

if Key=#13 then
begin
Form4.Edit1.text:=ECodigo.Text;
Verifica_ECF();

Form4.Show;
Form4.Edit2.SetFocus;

end;//Final do If #13




end;

procedure TForm1.CancelaUltimo1Click(Sender: TObject);
begin

Form1.Verifica_ECF();
iRet := Frame1.Bematech_FI_CancelaItemAnterior();
Form1.Analisa_Retorno_DLL();Form1.Analisa_Retorno_ECF();

end;

procedure TForm1.CancelaNumero1Click(Sender: TObject);
begin

Form1.Verifica_ECF();

iRet := Frame1.Bematech_FI_CancelaItemGenerico(Pchar(InputBox('ECFDELPHI','Entre com o numero do Item',' ')));

Form1.Analisa_Retorno_DLL();
Form1.Analisa_Retorno_ECF();

end;

procedure TForm1.CancelaCupom1Click(Sender: TObject);
begin


Form1.Verifica_ECF();

iRet := Frame1.Bematech_FI_CancelaCupom();

Form1.Analisa_Retorno_DLL();
Form1.Analisa_Retorno_ECF();

end;

procedure TForm1.FechaCupomRapido1Click(Sender: TObject);
begin

Form1.Verifica_ECF();

iRet := Frame1.Bematech_FI_FechaCupomResumido('Dinheiro','Obrigado, Volte Sempre!!!');

Form1.Analisa_Retorno_DLL();
Form1.Analisa_Retorno_ECF();

ECodigo.text:='';
Ecodigo.Visible:=False;
MLogCupom.Visible:=False;
MLogCupom.text:='';

end;

procedure TForm1.FechaCupomFormas1Click(Sender: TObject);
var
  iConta:integer;
  sSub:string;

begin

iConta:=0;
sSub:='';

Form2.GroupBox1.Caption:='Fechamento Cupom';

Leitura_FormasdePagamento;
iRet:=0;

  While aFormasPagamento[iRet]<>'' Do
  begin
    Form2.ListBox1.Items.Add(aFormasPagamento[iRet]);
    iRet:=iRet+1;
  end;

  for iConta := 1 to 3016 do sSub := sSub + ' ';
  iRet:=Frame1.Bematech_FI_SubTotal(sSub);
  iConta:=StrToInt(Trim(sSub));
  Form2.Edit1.text:=IntToStr(iConta);
  Form2.Show;
  Form2.ListBox1.Selected[0];
  Form2.ListBox1.SetFocus;
iRet:=0;

end;

end.
