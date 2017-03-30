
Module Procedures

    'Objetos para Manipulacao das Janelas e controles
    Public FRM_Start As New Form1() 'Objeto para Controlar o Form1
    Public FRM_MsgUser As New Form2() 'Objeto para Controlar o Form2
    Public FRM_Produto As New Form3() 'Objeto para Controlar o Form3
    Public FRM_Grid As New Form4() 'Objeto para Controlar o Form4
    Public REG As dsProduto.ProdutoRow

    'Variaveis e Constantes Globais
    Public Ret As Byte = 0 'Recebe o retorno das funcoes do ECF
    Public ACK, ST1, ST2 As Byte 'REcebe o Retorno de Cada Comando Enviado
    Public Operador_Atual As String 'Armazena oi Operador Atual
    Public Forma_Pagamento(10) As String ' Armezena as Formas de pagamento
    Public Totalizadores(20) As String 'Armazena os Totalizadores Nao Fiscais
    Public Aliquotas(16) As String 'Armazena as Aliquotas Cadastradas
    Public Geral As String 'Variavel para uso Geral...he,he,he
    Public Contador_Item As Byte ' Conta os itens vendidos no cupom

    'Constantes de  Mensagens e Valores
    Public Const ECF_OK = 1

    Public Const MSG_DLL_NOTOK = "Problemas ao Enviar Comando Para o ECF"
    Public Const MSG_ECF_NAK = "ECF Retornou NAK - Verifique Impressora e Cabo"

    Public Const MSG_ST1_128 = "FIM E PAPEL - FAVOR TROCAR A BOBINA"
    Public Const MSG_ST1_64 = "O PAPEL ESTÁ TERMINANDO - FAVOR VERIFICAR."
    Public Const MSG_ST1_32 = "ERRO NO RELOGIO INTERNO DO ECF - CHAMAR ASSISTENCIA TECNICA!!"
    Public Const MSG_ST1_16 = "IMPRESSORA EM ERRO - DESLIGUE E LIGUE O ECF"
    Public Const MSG_ST1_8 = "ERRO NO ENVIO DO COMANDO - FAVOR REPETIR A OPERACÃO"
    Public Const MSG_ST1_4 = "COMANDO INEXISTENTE - FAVOR ABRIR CHAMADO SUPORTE"
    Public Const MSG_ST1_2 = "CUPOM FISCAL ABERTO - CANCELE O CUPOM OU TERMINE A VENDA"
    Public Const MSG_ST1_1 = "PARAMETRO INVALIDO - FAVOR ABRIR CHAMADO SUPORTE"

    Public Const MSG_ST2_128 = "TIPO DE CMD INVALIDO - FAVOR ABRIR CHAMADO SUPORTE"
    Public Const MSG_ST2_64 = "MEMORIA FISCAL CHEIA - CHAMAR ASSISTENCIA TECNICA!!"""
    Public Const MSG_ST2_32 = "ERRO DE CMOS DO ECF - CHAMAR ASSISTENCIA TECNICA!!"
    Public Const MSG_ST2_16 = "ALIQUOTA NAO PROGRAMADA - FAVOR CANCELE O CUPOM E CADASTRE A ALIQUOTA"
    Public Const MSG_ST2_8 = "CAPACIDADE ALIQUOTA LOTADA - FAVOR ABRIR CHAMADO SUPORTE"
    Public Const MSG_ST2_4 = "CANCELAMENTO NAO PERMITIDO PELO ECF"
    Public Const MSG_ST2_2 = "CGC/IE NAO PROGRAMDOS  - CHAMAR ASSISTENCIA TECNICA!!"
    Public Const MSG_ST2_1 = "COMANDO NAO EXECUTADO - VERIFIQUE O STATUS DA IMPRESSORA"




    '******************************************************************************
    'Esta Funcao apenas Mostra a Janela de Mensagem de Operacao 
    'para que o usuario espere a execucao de uma tarefa
    'Caso Parametro Msg seja igual a vazio Esconderá a Janela
    'Claudenir C. Andrade
    '09/02/2002
    '******************************************************************************
    Public Sub Show_MsgUser(ByVal Msg As String, ByVal Title As String)
        If Msg = "" Then : FRM_MsgUser.Hide() : Exit Sub : End If
        FRM_MsgUser.Label1.Text = Msg
        FRM_MsgUser.Text = "ECF.NET V1.0 - " & Title
        FRM_MsgUser.Label1.Refresh()
        FRM_MsgUser.Show()
        FRM_MsgUser.Refresh()
    End Sub


    '******************************************************************************
    'Analisa o RET devolvido pela dll de comunicacao
    'Claudenir C. Andrade
    '09/02/2002
    '******************************************************************************
    Public Sub Analisa_Retorno_DLL()
        If Ret <> 1 Then : ECF_NotOk(MSG_DLL_NOTOK) : Exit Sub : End If
    End Sub

    '******************************************************************************
    'Analisa o Retorno do ECF, o ACK,ST1 e ST2
    'Verifica o Status baseado na Codificacao Binaria
    'Claudenir C. Andrade
    '09/02/2002
    '******************************************************************************
    Public Sub Analisa_Retorno_ECF()
        'Analisamos o ACK se DEvolveu NAK (Not Acknolege) ou ACK
        If ACK <> 6 Then : ECF_NotOk(MSG_ECF_NAK) : Exit Sub : End If

        'Analisamos o Byte ST1 e o ST2
        'A NOTACAO (VARIVEL)(OPERADOR) = (VALOR) Agora é permitida no VB.NET
        'Antes era necessario (Variavel) = (Variavel) (Operador) (valor)
        If ST1 >= 128 Then : ECF_NotOk(MSG_ST1_128) : ST1 -= 128 : End If
        If ST1 >= 64 Then : ECF_NotOk(MSG_ST1_64) : ST1 -= 64 : End If
        If ST1 >= 32 Then : ECF_NotOk(MSG_ST1_32) : ST1 -= 32 : End If
        If ST1 >= 16 Then : ECF_NotOk(MSG_ST1_16) : ST1 -= 16 : End If
        If ST1 >= 8 Then : ECF_NotOk(MSG_ST1_8) : ST1 -= 8 : End If
        If ST1 >= 4 Then : ECF_NotOk(MSG_ST1_4) : ST1 -= 4 : End If
        If ST1 >= 2 Then : ECF_NotOk(MSG_ST1_2) : ST1 -= 2 : End If
        If ST1 >= 1 Then : ECF_NotOk(MSG_ST1_1) : ST1 -= 1 : End If

        If ST2 >= 128 Then : ECF_NotOk(MSG_ST2_128) : ST2 -= 128 : End If
        If ST2 >= 64 Then : ECF_NotOk(MSG_ST2_64) : ST2 -= 64 : End If
        If ST2 >= 32 Then : ECF_NotOk(MSG_ST2_32) : ST2 -= 32 : End If
        If ST2 >= 16 Then : ECF_NotOk(MSG_ST2_16) : ST2 -= 16 : End If
        If ST2 >= 8 Then : ECF_NotOk(MSG_ST2_8) : ST2 -= 8 : End If
        If ST2 >= 4 Then : ECF_NotOk(MSG_ST2_4) : ST2 -= 4 : End If
        If ST2 >= 2 Then : ECF_NotOk(MSG_ST2_2) : ST2 -= 2 : End If
        If ST2 >= 1 Then : ECF_NotOk(MSG_ST2_1) : ST2 -= 1 : End If

    End Sub


    '******************************************************************************
    'Funcao para Mostrar erro retornado pela DLL, antes de enviar o comando 
    'para a impressora
    'Claudenir C. Andrade
    '09/02/2002
    '******************************************************************************
    Public Sub ECF_NotOk(ByVal MSG_CONST As String)
        System.Windows.Forms.MessageBox.Show(MSG_CONST, "ECF.NET V1.0 - ERRO!!!", MessageBoxButtons.OK, MessageBoxIcon.Error, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly)
        If FRM_MsgUser.Visible = True Then : FRM_MsgUser.Hide() : End If
    End Sub

    '******************************************************************************
    'Este Modulo ira inicializar o software executando comandos na impressora fiscal
    'E armazenando informacoes do Caixa, ECF, Formas de Pagamento, etc..
    'Para Uso durante o Software
    'Claudenir C. Andrade
    '09/02/2002
    '******************************************************************************
    Public Sub Inicializa_Software_ECF()
        Dim Contador As Byte = 1
        Dim Pos As Int16 = 0

        'Como as formas de pagamento nao sao mais armazenadas, inicializamos Staticamnete.
        'O Ideal e vc puxar estas informacoes de seu banco de dados
        Forma_Pagamento(1) = "Dinheiro"
        Forma_Pagamento(2) = "Cheque"
        Forma_Pagamento(3) = "Cartao"
        Forma_Pagamento(4) = "Debito"
        Forma_Pagamento(5) = "Carne"
        Forma_Pagamento(6) = "Prazo"

        'Os Totalizadores Nao Fiscais Sao Armazenados pela impressora por isso devem ser
        'Lidos diretamente da Impressora, para isso passamos um avariavel de 2000 bytes
        Geral = Space(2000)
        Ret = Bematech_FI_VerificaTotalizadoresNaoFiscais(Geral)

        'Preenchemos a Matriz com os Totalizadores Nao Fiscais
        Do While (Contador <= 20)
            Totalizadores(Contador) = Mid(Geral, 1, 19)
            Geral = Mid(Geral, 21, Len(Geral) - 20)
            Contador += 1
        Loop
    End Sub

    '******************************************************************************
    'Procedure para Deixar Editavel o TextBox ou nao
    'Usamos o tratamento de Exception com Try, Catch e Finally
    'Claudenir C. Andrade
    '10/02/2002
    '******************************************************************************
    Public Sub Habilita_Desabilita_TextBox(ByVal TRUE_FALSE As Byte)
        With FRM_Produto
            If TRUE_FALSE = 0 Then
                .TextBox1.Enabled = False
                .TextBox2.Enabled = False
                .TextBox3.Enabled = False
                .TextBox4.Enabled = False
                .TextBox5.Enabled = False
                .TextBox6.Enabled = False
            Else
                .TextBox1.Enabled = True
                .TextBox2.Enabled = True
                .TextBox3.Enabled = True
                .TextBox4.Enabled = True
                .TextBox5.Enabled = True
                .TextBox6.Enabled = True
            End If
        End With
    End Sub
    '******************************************************************************
    'Procedure para Alimentar o DataSet de Produtos
    'Usamos o tratamento de Exception com Try, Catch e Finally
    'Claudenir C. Andrade
    '10/02/2002
    '******************************************************************************
    Public Sub Alimentar_DataSet(ByVal DataSet As ECFVBNET.dsProduto)
        'Conexao com o BD, fazemos refrencia ao form e o controle do BD
        FRM_Produto.cnnECFNET.Open()
        DataSet.EnforceConstraints = False
        Try
            'Chamamos o FILL para preencher o data set
            FRM_Produto.daProduto.Fill(DataSet)
        Catch DataExc As System.Exception
            Throw DataExc 'Caso dë o erro acionamos o tratamento
        Finally
            DataSet.EnforceConstraints = True
            FRM_Produto.cnnECFNET.Close()
        End Try
    End Sub

    '******************************************************************************
    'Procedure para Mostrar a Posicao Atual dos Registros
    'Claudenir C. Andrade
    '10/02/2002
    '******************************************************************************
    Public Sub Indice_Atual()
        Dim Reg_Contador As Int32
        Dim Posicao As Int32

        'Recebemos a quantidade de registros
        Reg_Contador = FRM_Produto.BindingContext(FRM_Produto.DsProduto, "Produto").Count

        'Se Nao tiver nenhum, registro mostramos um message
        If Reg_Contador = 0 Then
            MessageBox.Show("Nao Ha Registros para Exibiçao")
        End If

        Posicao = FRM_Produto.BindingContext(FRM_Produto.DsProduto, "Produto").Position + 1
    End Sub

    '******************************************************************************
    'Cancela a inlcusao de um registro em edicao
    'Claudenir C. Andrade
    '10/02/2002
    '******************************************************************************
    Public Sub Cancela_Inclusao()
        FRM_Produto.BindingContext(FRM_Produto.DsProduto, "Produto").CancelCurrentEdit()
        Habilita_Desabilita_TextBox(0)
    End Sub

    Public Sub Atualiza_DataSet()
        Dim Objeto_DataModificado As dsProduto = New dsProduto()
        Dim Objeto_DataAltualizado As Data.DataSet = New dsProduto()


        'Alimentamos o novo DataSet com os Registros Alterados
        Objeto_DataModificado = CType(FRM_Produto.DsProduto.GetChanges, dsProduto)

        'Verificamos se existe registros para ser sincronizados com o BD
        If (Not (Objeto_DataModificado) Is Nothing) Then
            Sincronizar_DS_BancoDados(Objeto_DataModificado)
            FRM_Produto.DsProduto.Merge(Objeto_DataAltualizado)
            FRM_Produto.DsProduto.AcceptChanges()
        End If


    End Sub

    Public Sub Sincronizar_DS_BancoDados(ByVal DS_SET As dsProduto)
        Dim REG_Modificados As Data.DataSet
        Dim REG_Incluidos As Data.DataSet
        Dim REG_Eliminados As Data.DataSet
        Dim REG_Mexidos As Int32


        FRM_Produto.cnnECFNET.Close() 'Por garantia, he,he,he
        FRM_Produto.cnnECFNET.Open()

        'O Objeto DataRow Sate indica um a um o ststus dos registros
        REG_Modificados = FRM_Produto.DsProduto.GetChanges(DataRowState.Modified)
        REG_Incluidos = FRM_Produto.DsProduto.GetChanges(DataRowState.Added)
        REG_Eliminados = FRM_Produto.DsProduto.GetChanges(DataRowState.Deleted)

        'Iniciamos a atualizacao e é saudavel estarmos com o try ligado
        Try
            If (Not (REG_Modificados) Is Nothing) Then
                REG_Mexidos = FRM_Produto.daProduto.Update(REG_Modificados)
            End If
            If (Not (REG_Incluidos) Is Nothing) Then
                REG_Mexidos += FRM_Produto.daProduto.Update(REG_Incluidos)
            End If
            If (Not (REG_Eliminados) Is Nothing) Then
                REG_Mexidos += FRM_Produto.daProduto.Update(REG_Eliminados)
            End If

        Catch eAtualiza As System.Exception
            MessageBox.Show("Erro ao Criar o Data Set com as Modificaoes dos registros")
        Finally
            FRM_Produto.cnnECFNET.Close()
        End Try

    End Sub


    '******************************************************************************
    'Mostra o Produto Pesquizado caso o REG (Rows) Nao seja Nothing
    'Claudenir C. Andrade
    '10/02/2002
    '******************************************************************************
    Public Sub Mostrar_Produto()

        If Not REG Is Nothing Then
            MessageBox.Show("Codigo : " & REG.Codigo.ToString & vbNewLine & _
                            "Produto: " & REG.Descricao.ToString & vbNewLine & _
                            "Valor  : " & REG.Valor.ToString & vbNewLine, "ECF.NET V1.0 Consulta Produto", MessageBoxButtons.OK, MessageBoxIcon.Information)
        End If
    End Sub
End Module
