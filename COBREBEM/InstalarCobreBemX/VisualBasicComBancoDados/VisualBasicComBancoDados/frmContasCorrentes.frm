VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form frmContasCorrentes 
   Caption         =   "ContasCorrentes"
   ClientHeight    =   7320
   ClientLeft      =   1110
   ClientTop       =   345
   ClientWidth     =   5745
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   7320
   ScaleWidth      =   5745
   Begin VB.CommandButton cmdImprimirBoletos 
      Caption         =   "Imprimir Boletos"
      Height          =   255
      Left            =   600
      TabIndex        =   37
      Top             =   120
      Width           =   2175
   End
   Begin VB.CommandButton cmdEnviarBoletosPorEmail 
      Caption         =   "Enviar Boletos por Email"
      Height          =   255
      Left            =   600
      TabIndex        =   36
      Top             =   480
      Width           =   2175
   End
   Begin VB.CommandButton cmdGerarArquivoRemessa 
      Caption         =   "Gerar Arquivo de Remessa"
      Height          =   255
      Left            =   3000
      TabIndex        =   35
      Top             =   120
      Width           =   2175
   End
   Begin VB.CommandButton cmdCarregarArquivoRetorno 
      Caption         =   "Carregar Arquivo de Retorno"
      Height          =   255
      Left            =   3000
      TabIndex        =   34
      Top             =   480
      Width           =   2175
   End
   Begin VB.PictureBox picButtons 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   5745
      TabIndex        =   29
      Top             =   6690
      Width           =   5745
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "&Update"
         Height          =   300
         Left            =   1675
         TabIndex        =   31
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "&Refresh"
         Height          =   300
         Left            =   4445
         TabIndex        =   33
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "&Delete"
         Height          =   300
         Left            =   3060
         TabIndex        =   32
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "&Add"
         Height          =   300
         Left            =   290
         TabIndex        =   30
         Top             =   0
         Width           =   1095
      End
   End
   Begin VB.TextBox txtFields 
      DataField       =   "IdentificacaoCedenteBolet"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   13
      Left            =   2040
      TabIndex        =   27
      Top             =   5055
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "CaminhoLogotipoBoletoImpr"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   12
      Left            =   2040
      TabIndex        =   25
      Top             =   4740
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "EnderecoEmailCedente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   11
      Left            =   2040
      TabIndex        =   23
      Top             =   4425
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "ArquivoLicenca"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   10
      Left            =   2040
      TabIndex        =   21
      Top             =   4095
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "ProximoNossoNumero"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   9
      Left            =   2040
      TabIndex        =   19
      Top             =   3780
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "FimNossoNumero"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   8
      Left            =   2040
      TabIndex        =   17
      Top             =   3465
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "InicioNossoNumero"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   7
      Left            =   2040
      TabIndex        =   15
      Top             =   3135
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "CNPJCPFCedente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   6
      Left            =   2040
      TabIndex        =   13
      Top             =   2820
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "NomeCedente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   5
      Left            =   2040
      TabIndex        =   11
      Top             =   2505
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "CodigoCedente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   4
      Left            =   2040
      TabIndex        =   9
      Top             =   2175
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "ContaCorrenteCedente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   3
      Left            =   2040
      TabIndex        =   7
      Top             =   1860
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "AgenciaCedente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   2
      Left            =   2040
      TabIndex        =   5
      Top             =   1545
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "Banco"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   1
      Left            =   2040
      TabIndex        =   3
      Top             =   1215
      Width           =   3375
   End
   Begin VB.TextBox txtFields 
      DataField       =   "ChaveContaCorrente"
      DataSource      =   "datPrimaryRS"
      Height          =   285
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Top             =   900
      Width           =   3375
   End
   Begin MSAdodcLib.Adodc datPrimaryRS 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      Top             =   6990
      Width           =   5745
      _ExtentX        =   10134
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   $"frmContasCorrentes.frx":0000
      OLEDBString     =   $"frmContasCorrentes.frx":00A8
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   $"frmContasCorrentes.frx":0150
      Caption         =   " "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSDataGridLib.DataGrid grdDataGrid 
      Height          =   1305
      Left            =   0
      TabIndex        =   28
      Top             =   5385
      Width           =   5760
      _ExtentX        =   10160
      _ExtentY        =   2302
      _Version        =   393216
      AllowUpdate     =   -1  'True
      HeadLines       =   1
      RowHeight       =   15
      AllowAddNew     =   -1  'True
      AllowDelete     =   -1  'True
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin VB.Label lblLabels 
      Caption         =   "IdentificacaoCedenteBolet:"
      Height          =   255
      Index           =   13
      Left            =   120
      TabIndex        =   26
      Top             =   5055
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "CaminhoLogotipoBoletoImpr:"
      Height          =   255
      Index           =   12
      Left            =   120
      TabIndex        =   24
      Top             =   4740
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "EnderecoEmailCedente:"
      Height          =   255
      Index           =   11
      Left            =   120
      TabIndex        =   22
      Top             =   4425
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "ArquivoLicenca:"
      Height          =   255
      Index           =   10
      Left            =   120
      TabIndex        =   20
      Top             =   4095
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "ProximoNossoNumero:"
      Height          =   255
      Index           =   9
      Left            =   120
      TabIndex        =   18
      Top             =   3780
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "FimNossoNumero:"
      Height          =   255
      Index           =   8
      Left            =   120
      TabIndex        =   16
      Top             =   3465
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "InicioNossoNumero:"
      Height          =   255
      Index           =   7
      Left            =   120
      TabIndex        =   14
      Top             =   3135
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "CNPJCPFCedente:"
      Height          =   255
      Index           =   6
      Left            =   120
      TabIndex        =   12
      Top             =   2820
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "NomeCedente:"
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   10
      Top             =   2505
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "CodigoCedente:"
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   8
      Top             =   2175
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "ContaCorrenteCedente:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   1860
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "AgenciaCedente:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   1545
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Banco:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   1215
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "ChaveContaCorrente:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   900
      Width           =   1815
   End
End
Attribute VB_Name = "frmContasCorrentes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim CobreBemX As CobreBemX.ContaCorrente

Const CaminhoInstalacaoCBX = "C:\CobreBemX\"

Private Function VerificaNulo(Campo As Field) As Variant
    If IsNull(Campo) Then
        If Campo.Type = adVarChar Then
            VerificaNulo = ""
        Else
            VerificaNulo = 0
        End If
    Else
        VerificaNulo = Campo
    End If
End Function

Private Sub PassaDadosContaCorrenteParaCobreBemX()
' Início dos parâmetros obrigatórios da conta corrente
     CobreBemX.ArquivoLicenca = datPrimaryRS.Recordset("ArquivoLicenca")
     CobreBemX.CodigoAgencia = VerificaNulo(datPrimaryRS.Recordset("AgenciaCedente"))
     CobreBemX.NumeroContaCorrente = VerificaNulo(datPrimaryRS.Recordset("ContaCorrenteCedente"))
     CobreBemX.CodigoCedente = VerificaNulo(datPrimaryRS.Recordset("CodigoCedente"))
     CobreBemX.InicioNossoNumero = VerificaNulo(datPrimaryRS.Recordset("InicioNossoNumero"))
     CobreBemX.FimNossoNumero = VerificaNulo(datPrimaryRS.Recordset("FimNossoNumero"))
     CobreBemX.ProximoNossoNumero = VerificaNulo(datPrimaryRS.Recordset("ProximoNossoNumero"))
' Término dos parâmetros obrigatórios da conta corrente

' Início da configuração dos dados do Cedente para envio de boletos por email
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Servidor = "localhost" ' Trocar para apontar para o seu servidor SMTP
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Porta = 25
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Usuario = "cedente" 'utilizar esta propriedade para acesso a servidores SMTP seguros
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Senha = "cedente" 'utilizar esta propriedade para acesso a servidores SMTP seguros
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLImagensCodigoBarras = "http://www.bptob.com/imagenscbe/"
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLLogotipo = "http://www.thisf.com.br/banners/BannerCBE.gif"
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.Assunto = "Boleto de Cobrança"
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.EmailFrom.Endereco = VerificaNulo(datPrimaryRS.Recordset("EnderecoEmailCedente"))
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.EmailFrom.Nome = VerificaNulo(datPrimaryRS.Recordset("NomeCedente"))
     CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.FormaEnvio = feeSMTPBoletoHTML
' Término da configuração dos dados do Cedente para envio de boletos por email

' A próxima linha só é necessária se for solicitada a impressão de boletos e
' se desejar colocar o logotipo do Cedente na parte superior do boleto
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo = VerificaNulo(datPrimaryRS.Recordset("CaminhoLogotipoBoletoImpr"))
     
' Início da configuração dos dados do Cedente para impressão de boletos

' A próxima linha só é necessária se for solicitada a impressão de boletos e
' se desejar colocar o logotipo do Cedente na parte superior do boleto

     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo = CaminhoInstalacaoCBX & "Imagens\BannerCBX.gif"
     CobreBemX.PadroesBoleto.InstrucoesCaixa
     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras = CaminhoInstalacaoCBX & "Imagens\"

' Utilize o parâmetro abaixo para efetuar ajustes na impressão do boleto subindo ou descendo o mesmo na folha de papel
'  Os valores devem ser informados em milímetros e quanto maior o valor mais para baixo será iniciado o boleto
'  Se este parâmetro não for passado será assumido o valor 15 que é o indicado para a maioria das impressoras Jato de Tinta }

     CobreBemX.PadroesBoleto.PadroesBoletoImpresso.MargemSuperior = 3

' Término da configuração dos dados do Cedente para impressão de boletos
     
' A próxima linha é utilizada para exibir um texto do lado direito do logotipo nos boletos impressos ou
' enviados por email
     CobreBemX.PadroesBoleto.IdentificacaoCedente = VerificaNulo(datPrimaryRS.Recordset("IdentificacaoCedenteBolet"))

End Sub

Private Sub SalvaDadosContaCorrente()
    txtFields(1).Text = Left$(CobreBemX.NumeroBanco, 3)
    txtFields(2).Text = CobreBemX.CodigoAgencia
    txtFields(3).Text = CobreBemX.NumeroContaCorrente
    txtFields(4).Text = CobreBemX.CodigoCedente
    txtFields(5).Text = CobreBemX.NomeCedente
    txtFields(6).Text = CobreBemX.CnpjCpfCedente
    txtFields(8).Text = CobreBemX.FimNossoNumero
    If txtFields(7).Text <> CobreBemX.InicioNossoNumero Then
        txtFields(9).Text = CobreBemX.InicioNossoNumero
    End If
    txtFields(7).Text = CobreBemX.InicioNossoNumero
End Sub

Private Sub PassaDadosBoletosParaCobreBemX()
Dim Boleto As Object
Dim Email As Object
Dim rs As ADODB.Recordset
    CobreBemX.DocumentosCobranca.Clear
    Set rs = datPrimaryRS.Recordset.Fields("ChildCMD").Value
    rs.MoveFirst
    While Not rs.EOF
        Set Boleto = CobreBemX.DocumentosCobranca.Add
        Boleto.NumeroDocumento = VerificaNulo(rs("ChaveBoleto"))
        Boleto.NomeSacado = VerificaNulo(rs("NomeSacado"))
        If Len(VerificaNulo(rs("CNPJCPFSacado"))) > 11 Then
            Boleto.CNPJSacado = VerificaNulo(rs("CNPJCPFSacado"))
        Else
            Boleto.CPFSacado = VerificaNulo(rs("CNPJCPFSacado"))
        End If
        Boleto.EnderecoSacado = VerificaNulo(rs("EnderecoSacado"))
        Boleto.BairroSacado = VerificaNulo(rs("BairroSacado"))
        Boleto.CidadeSacado = VerificaNulo(rs("CidadeSacado"))
        Boleto.EstadoSacado = VerificaNulo(rs("EstadoSacado"))
        Boleto.CepSacado = VerificaNulo(rs("CEPSacado"))
        Boleto.DataDocumento = Format$(Date, "dd/mm/yyyy")
        If Not IsNull(rs("DataVencimento")) Then
            Boleto.DataVencimento = rs("DataVencimento")
        End If
        Boleto.DataProcessamento = Format$(Date, "dd/mm/yyyy")
        Boleto.ValorDocumento = VerificaNulo(rs("ValorBoleto"))
        Boleto.PercentualJurosDiaAtraso = VerificaNulo(rs("PercentualJuros"))
        Boleto.PercentualMultaAtraso = VerificaNulo(rs("PercentualMulta"))
        Boleto.PercentualDesconto = VerificaNulo(rs("PercentualDesconto"))
        Boleto.ValorOutrosAcrescimos = VerificaNulo(rs("ValorOutrosAcrescimos"))
        Boleto.PadroesBoleto.Demonstrativo = VerificaNulo(rs("Demonstrativo"))
        Boleto.PadroesBoleto.InstrucoesCaixa = VerificaNulo(rs("InstrucoesCaixa"))
        Set Email = Boleto.EnderecosEmailSacado.Add
        Email.Nome = Boleto.NomeSacado
        Email.Endereco = VerificaNulo(rs("EnderecoEmailSacado"))
        Boleto.ControleProcessamentoDocumento.Imprime = scpExecutar
        Boleto.ControleProcessamentoDocumento.EnviaEmail = scpExecutar
        Boleto.ControleProcessamentoDocumento.GravaRemessa = scpExecutar
        If Not IsNull(rs("NossoNumero")) Then
            Boleto.NossoNumero = rs("NossoNumero")
            If Len(rs("NossoNumero")) < (CobreBemX.MascaraNossoNumero + 1) Then
                Boleto.CalculaDacNossoNumero = True
            End If
        End If
        rs.MoveNext
     Wend
End Sub

Private Sub SalvaDadosBoletos()
Dim i As Integer
Dim rs As ADODB.Recordset
    Set rs = datPrimaryRS.Recordset.Fields("ChildCMD").Value
    For i = 0 To CobreBemX.DocumentosCobranca.Count - 1
        rs.Find "ChaveBoleto=" & CobreBemX.DocumentosCobranca(i).NumeroDocumento
        If rs("ChaveBoleto") = CobreBemX.DocumentosCobranca(i).NumeroDocumento Then
            If VerificaNulo(rs("NossoNumero")) <> CobreBemX.DocumentosCobranca(i).NossoNumero Then
                rs("NossoNumero") = CobreBemX.DocumentosCobranca(i).NossoNumero
                rs.Update
            End If
        End If
    Next i
    If txtFields(9).Text <> CobreBemX.ProximoNossoNumero Then
        txtFields(9).Text = CobreBemX.ProximoNossoNumero
        datPrimaryRS.Recordset.Update
    End If
End Sub

Private Sub SalvaDadosOcorrenciasCobranca()
Dim i As Integer
Dim rs As ADODB.Recordset
    Set rs = datPrimaryRS.Recordset.Fields("ChildCMD").Value
     For i = 0 To CobreBemX.OcorrenciasCobranca.Count - 1
        rs.Find "NossoNumero='" & CobreBemX.OcorrenciasCobranca(i).NossoNumero & "'"
        If rs("NossoNumero") = CobreBemX.OcorrenciasCobranca(i).NossoNumero Then
            If CobreBemX.OcorrenciasCobranca(i).Pagamento Then
                rs("DataPagamento") = CobreBemX.OcorrenciasCobranca(i).DataOcorrencia
                rs("ValorPago") = CobreBemX.OcorrenciasCobranca(i).ValorPago
                rs.Update
            End If
        End If
    Next i
End Sub

Private Sub cmdCarregarArquivoRetorno_Click()
     PassaDadosContaCorrenteParaCobreBemX
     CobreBemX.OcorrenciasCobranca.Clear
     CobreBemX.CarregaArquivosRetorno
     SalvaDadosOcorrenciasCobranca
     MsgBox "Pagamentos Carregados"
End Sub

Private Sub cmdEnviarBoletosPorEmail_Click()
     PassaDadosContaCorrenteParaCobreBemX
     PassaDadosBoletosParaCobreBemX
     CobreBemX.EnviaBoletosPorEmail
     SalvaDadosBoletos
     MsgBox "Boletos Enviados por email"
End Sub

Private Sub cmdGerarArquivoRemessa_Click()
     PassaDadosContaCorrenteParaCobreBemX
     PassaDadosBoletosParaCobreBemX
     CobreBemX.GravaArquivoRemessa
     SalvaDadosBoletos
     MsgBox "Arquivo de Remessa gerado"
End Sub

Private Sub cmdImprimirBoletos_Click()
     PassaDadosContaCorrenteParaCobreBemX
     PassaDadosBoletosParaCobreBemX
     CobreBemX.ImprimeBoletos
     SalvaDadosBoletos
End Sub

Private Sub Form_Load()
    Set CobreBemX = New ContaCorrente
    Set grdDataGrid.DataSource = datPrimaryRS.Recordset("ChildCMD").UnderlyingValue
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  'This will resize the grid when the form is resized
  grdDataGrid.Width = Me.ScaleWidth
  grdDataGrid.Height = Me.ScaleHeight - grdDataGrid.Top - datPrimaryRS.Height - 30 - picButtons.Height
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Screen.MousePointer = vbDefault
  Set CobreBemX = Nothing
End Sub

Private Sub datPrimaryRS_Error(ByVal ErrorNumber As Long, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, fCancelDisplay As Boolean)
  'This is where you would put error handling code
  'If you want to ignore errors, comment out the next line
  'If you want to trap them, add code here to handle them
  MsgBox "Data error event hit err:" & Description
End Sub

Private Sub datPrimaryRS_MoveComplete(ByVal adReason As ADODB.EventReasonEnum, ByVal pError As ADODB.Error, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  'This will display the current record position for this recordset
  datPrimaryRS.Caption = "Record: " & CStr(datPrimaryRS.Recordset.AbsolutePosition)
End Sub

Private Sub datPrimaryRS_WillChangeRecord(ByVal adReason As ADODB.EventReasonEnum, ByVal cRecords As Long, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
  'This is where you put validation code
  'This event gets called when the following actions occur
  Dim bCancel As Boolean

  Select Case adReason
  Case adRsnAddNew
  Case adRsnClose
  Case adRsnDelete
  Case adRsnFirstChange
  Case adRsnMove
  Case adRsnRequery
  Case adRsnResynch
  Case adRsnUndoAddNew
  Case adRsnUndoDelete
  Case adRsnUndoUpdate
  Case adRsnUpdate
  End Select

  If bCancel Then adStatus = adStatusCancel
End Sub

Private Sub cmdAdd_Click()
  On Error GoTo AddErr
  datPrimaryRS.Recordset.AddNew
  
  datPrimaryRS.Recordset("ArquivoLicenca") = CaminhoInstalacaoCBX & "Exemplos\Licencas\001-18.conf"
  PassaDadosContaCorrenteParaCobreBemX
  CobreBemX.ConfiguraContaCorrente
  SalvaDadosContaCorrente
  
  Exit Sub
AddErr:
  MsgBox Err.Description
End Sub

Private Sub cmdDelete_Click()
  On Error GoTo DeleteErr
  With datPrimaryRS.Recordset
    .Delete
    .MoveNext
    If .EOF Then .MoveLast
  End With
  Exit Sub
DeleteErr:
  MsgBox Err.Description
End Sub

Private Sub cmdRefresh_Click()
  'This is only needed for multi user apps
  On Error GoTo RefreshErr
  datPrimaryRS.Refresh
  Set grdDataGrid.DataSource = datPrimaryRS.Recordset("ChildCMD").UnderlyingValue
  Exit Sub
RefreshErr:
  MsgBox Err.Description
End Sub

Private Sub cmdUpdate_Click()
  On Error GoTo UpdateErr

  datPrimaryRS.Recordset.UpdateBatch adAffectAll
  Exit Sub
UpdateErr:
  MsgBox Err.Description
End Sub

