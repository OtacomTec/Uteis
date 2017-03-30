Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents MAdmin As System.Windows.Forms.MenuItem
    Friend WithEvents MAdminLeituraX As System.Windows.Forms.MenuItem
    Friend WithEvents MAdminLeituraMF As System.Windows.Forms.MenuItem
    Public WithEvents Timer1 As System.Timers.Timer
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents MAdminConfiguraECF As System.Windows.Forms.MenuItem
    Friend WithEvents MAdminTrocaOperador As System.Windows.Forms.MenuItem
    Friend WithEvents MAdminREducaoZ As System.Windows.Forms.MenuItem
    Friend WithEvents Box1 As System.Windows.Forms.GroupBox
    Friend WithEvents MAdminSuprimento As System.Windows.Forms.MenuItem
    Friend WithEvents Valor As System.Windows.Forms.TextBox
    Friend WithEvents ListIndice As System.Windows.Forms.ListBox
    Friend WithEvents MAdminSangria As System.Windows.Forms.MenuItem
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Public WithEvents MAdminConfigura As System.Windows.Forms.MenuItem
    Friend WithEvents MAdminTrocaOp As System.Windows.Forms.MenuItem
    Friend WithEvents ManutencaoProdutos As System.Windows.Forms.MenuItem
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents ListaDeProdutos As System.Windows.Forms.MenuItem
    Friend WithEvents ConsultarProdutos As System.Windows.Forms.MenuItem
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents Label21 As System.Windows.Forms.Label
    Friend WithEvents Label22 As System.Windows.Forms.Label
    Friend WithEvents Codigo_Produto As System.Windows.Forms.TextBox
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents MenuCupom As System.Windows.Forms.MenuItem
    Friend WithEvents MenuCupomCancelar_Cupom As System.Windows.Forms.MenuItem
    Friend WithEvents MenuCupomIniciar_Venda As System.Windows.Forms.MenuItem
    Friend WithEvents Cupom As System.Windows.Forms.RichTextBox
    Friend WithEvents MenuCupomCancelaUltimo As System.Windows.Forms.MenuItem
    Friend WithEvents MenuCupomCancelaNumero As System.Windows.Forms.MenuItem
    Friend WithEvents FechaCupom As System.Windows.Forms.MenuItem
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents BoxCupom As System.Windows.Forms.GroupBox
    Friend WithEvents livre As System.Windows.Forms.Label
    Friend WithEvents ListForma As System.Windows.Forms.ListBox
    Friend WithEvents ConsultaUnica As System.Windows.Forms.MenuItem

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.MainMenu1 = New System.Windows.Forms.MainMenu()
        Me.MAdmin = New System.Windows.Forms.MenuItem()
        Me.MAdminLeituraX = New System.Windows.Forms.MenuItem()
        Me.MAdminLeituraMF = New System.Windows.Forms.MenuItem()
        Me.MAdminConfiguraECF = New System.Windows.Forms.MenuItem()
        Me.MAdminTrocaOperador = New System.Windows.Forms.MenuItem()
        Me.MAdminSuprimento = New System.Windows.Forms.MenuItem()
        Me.MAdminREducaoZ = New System.Windows.Forms.MenuItem()
        Me.MAdminSangria = New System.Windows.Forms.MenuItem()
        Me.MAdminConfigura = New System.Windows.Forms.MenuItem()
        Me.MAdminTrocaOp = New System.Windows.Forms.MenuItem()
        Me.ManutencaoProdutos = New System.Windows.Forms.MenuItem()
        Me.ListaDeProdutos = New System.Windows.Forms.MenuItem()
        Me.ConsultarProdutos = New System.Windows.Forms.MenuItem()
        Me.ConsultaUnica = New System.Windows.Forms.MenuItem()
        Me.MenuCupom = New System.Windows.Forms.MenuItem()
        Me.MenuCupomCancelar_Cupom = New System.Windows.Forms.MenuItem()
        Me.MenuCupomIniciar_Venda = New System.Windows.Forms.MenuItem()
        Me.MenuCupomCancelaUltimo = New System.Windows.Forms.MenuItem()
        Me.MenuCupomCancelaNumero = New System.Windows.Forms.MenuItem()
        Me.FechaCupom = New System.Windows.Forms.MenuItem()
        Me.Timer1 = New System.Timers.Timer()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Box1 = New System.Windows.Forms.GroupBox()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.ListIndice = New System.Windows.Forms.ListBox()
        Me.Valor = New System.Windows.Forms.TextBox()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.BoxCupom = New System.Windows.Forms.GroupBox()
        Me.ListForma = New System.Windows.Forms.ListBox()
        Me.Label17 = New System.Windows.Forms.Label()
        Me.Label16 = New System.Windows.Forms.Label()
        Me.Codigo_Produto = New System.Windows.Forms.TextBox()
        Me.Label20 = New System.Windows.Forms.Label()
        Me.Label21 = New System.Windows.Forms.Label()
        Me.Label22 = New System.Windows.Forms.Label()
        Me.Cupom = New System.Windows.Forms.RichTextBox()
        Me.livre = New System.Windows.Forms.Label()
        CType(Me.Timer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        Me.Box1.SuspendLayout()
        Me.BoxCupom.SuspendLayout()
        Me.SuspendLayout()
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MAdmin, Me.MenuCupom})
        '
        'MAdmin
        '
        Me.MAdmin.Index = 0
        Me.MAdmin.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MAdminLeituraX, Me.MAdminLeituraMF, Me.MAdminConfiguraECF, Me.MAdminTrocaOperador, Me.MAdminSuprimento, Me.MAdminREducaoZ, Me.MAdminSangria, Me.MAdminConfigura, Me.MAdminTrocaOp, Me.ManutencaoProdutos, Me.ListaDeProdutos, Me.ConsultarProdutos, Me.ConsultaUnica})
        Me.MAdmin.Text = "Funções Administrativas"
        Me.MAdmin.Visible = False
        '
        'MAdminLeituraX
        '
        Me.MAdminLeituraX.Index = 0
        Me.MAdminLeituraX.RadioCheck = True
        Me.MAdminLeituraX.Shortcut = System.Windows.Forms.Shortcut.F5
        Me.MAdminLeituraX.Text = "Leitura X"
        '
        'MAdminLeituraMF
        '
        Me.MAdminLeituraMF.Index = 1
        Me.MAdminLeituraMF.Shortcut = System.Windows.Forms.Shortcut.F6
        Me.MAdminLeituraMF.Text = "Leitura da MF"
        '
        'MAdminConfiguraECF
        '
        Me.MAdminConfiguraECF.Index = 2
        Me.MAdminConfiguraECF.Shortcut = System.Windows.Forms.Shortcut.F9
        Me.MAdminConfiguraECF.Text = "ConfiguraECF"
        '
        'MAdminTrocaOperador
        '
        Me.MAdminTrocaOperador.Index = 3
        Me.MAdminTrocaOperador.Shortcut = System.Windows.Forms.Shortcut.F10
        Me.MAdminTrocaOperador.Text = "TorcaOperador"
        '
        'MAdminSuprimento
        '
        Me.MAdminSuprimento.Index = 4
        Me.MAdminSuprimento.Shortcut = System.Windows.Forms.Shortcut.F7
        Me.MAdminSuprimento.Text = "Suprimento"
        '
        'MAdminREducaoZ
        '
        Me.MAdminREducaoZ.Index = 5
        Me.MAdminREducaoZ.Shortcut = System.Windows.Forms.Shortcut.AltF12
        Me.MAdminREducaoZ.Text = "ReducaoZ"
        '
        'MAdminSangria
        '
        Me.MAdminSangria.Index = 6
        Me.MAdminSangria.Shortcut = System.Windows.Forms.Shortcut.F8
        Me.MAdminSangria.Text = "Sangria"
        '
        'MAdminConfigura
        '
        Me.MAdminConfigura.Index = 7
        Me.MAdminConfigura.Shortcut = System.Windows.Forms.Shortcut.F4
        Me.MAdminConfigura.Text = "Configura"
        '
        'MAdminTrocaOp
        '
        Me.MAdminTrocaOp.Index = 8
        Me.MAdminTrocaOp.Shortcut = System.Windows.Forms.Shortcut.F3
        Me.MAdminTrocaOp.Text = "TrocaOp"
        '
        'ManutencaoProdutos
        '
        Me.ManutencaoProdutos.Index = 9
        Me.ManutencaoProdutos.Shortcut = System.Windows.Forms.Shortcut.F2
        Me.ManutencaoProdutos.Text = "ManutencaoProdutos"
        '
        'ListaDeProdutos
        '
        Me.ListaDeProdutos.Index = 10
        Me.ListaDeProdutos.Shortcut = System.Windows.Forms.Shortcut.AltF3
        Me.ListaDeProdutos.Text = "ListaDeProdutos"
        '
        'ConsultarProdutos
        '
        Me.ConsultarProdutos.Index = 11
        Me.ConsultarProdutos.Text = "Consultar Produtos"
        '
        'ConsultaUnica
        '
        Me.ConsultaUnica.Index = 12
        Me.ConsultaUnica.Shortcut = System.Windows.Forms.Shortcut.AltF8
        Me.ConsultaUnica.Text = "ConsultaUnica"
        '
        'MenuCupom
        '
        Me.MenuCupom.Index = 1
        Me.MenuCupom.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuCupomCancelar_Cupom, Me.MenuCupomIniciar_Venda, Me.MenuCupomCancelaUltimo, Me.MenuCupomCancelaNumero, Me.FechaCupom})
        Me.MenuCupom.Text = "Cupom"
        Me.MenuCupom.Visible = False
        '
        'MenuCupomCancelar_Cupom
        '
        Me.MenuCupomCancelar_Cupom.Index = 0
        Me.MenuCupomCancelar_Cupom.Shortcut = System.Windows.Forms.Shortcut.AltF5
        Me.MenuCupomCancelar_Cupom.Text = "CancelarCupom"
        '
        'MenuCupomIniciar_Venda
        '
        Me.MenuCupomIniciar_Venda.Index = 1
        Me.MenuCupomIniciar_Venda.Shortcut = System.Windows.Forms.Shortcut.F1
        Me.MenuCupomIniciar_Venda.Text = "IniciarVenda"
        '
        'MenuCupomCancelaUltimo
        '
        Me.MenuCupomCancelaUltimo.Index = 2
        Me.MenuCupomCancelaUltimo.Shortcut = System.Windows.Forms.Shortcut.AltF6
        Me.MenuCupomCancelaUltimo.Text = "CancelaUltimo"
        '
        'MenuCupomCancelaNumero
        '
        Me.MenuCupomCancelaNumero.Index = 3
        Me.MenuCupomCancelaNumero.Shortcut = System.Windows.Forms.Shortcut.AltF7
        Me.MenuCupomCancelaNumero.Text = "CancelaNumero"
        '
        'FechaCupom
        '
        Me.FechaCupom.Index = 4
        Me.FechaCupom.Text = "FechaCupom"
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 1000
        Me.Timer1.SynchronizingObject = Me
        '
        'Label1
        '
        Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.Label1.Location = New System.Drawing.Point(0, 394)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(760, 24)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Label1"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.ControlLight
        Me.GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label8, Me.Label7, Me.Label6, Me.Label5, Me.Label4, Me.Label3, Me.Label2})
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.Color.DarkBlue
        Me.GroupBox1.Location = New System.Drawing.Point(0, 4)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(112, 384)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Funcoes Adm"
        '
        'Label8
        '
        Me.Label8.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(8, 328)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(88, 40)
        Me.Label8.TabIndex = 6
        Me.Label8.Text = "Reducao Z   (ALT + F12)"
        Me.Label8.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label7
        '
        Me.Label7.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(8, 264)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(88, 48)
        Me.Label7.TabIndex = 5
        Me.Label7.Text = "Troca Operador (F3)"
        Me.Label7.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label6
        '
        Me.Label6.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(8, 216)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(88, 40)
        Me.Label6.TabIndex = 4
        Me.Label6.Text = "Config ECF (F4)"
        Me.Label6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label5
        '
        Me.Label5.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(8, 168)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(88, 40)
        Me.Label5.TabIndex = 3
        Me.Label5.Text = "Sangria   (F8)"
        Me.Label5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label4
        '
        Me.Label4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(8, 120)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(88, 40)
        Me.Label4.TabIndex = 2
        Me.Label4.Text = "Suprimento (F7)"
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label3
        '
        Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(8, 72)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(88, 40)
        Me.Label3.TabIndex = 1
        Me.Label3.Text = "Leitura MF (F6)"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label2
        '
        Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(8, 24)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 40)
        Me.Label2.TabIndex = 0
        Me.Label2.Text = "Leitura X       (F5)"
        Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Box1
        '
        Me.Box1.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label10, Me.Label9, Me.ListIndice, Me.Valor})
        Me.Box1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Box1.ForeColor = System.Drawing.Color.RoyalBlue
        Me.Box1.Location = New System.Drawing.Point(112, 104)
        Me.Box1.Name = "Box1"
        Me.Box1.Size = New System.Drawing.Size(152, 104)
        Me.Box1.TabIndex = 2
        Me.Box1.TabStop = False
        Me.Box1.Visible = False
        '
        'Label10
        '
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label10.Location = New System.Drawing.Point(8, 15)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(136, 16)
        Me.Label10.TabIndex = 3
        Me.Label10.Text = "Forma de Pagamento"
        '
        'Label9
        '
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.Location = New System.Drawing.Point(8, 58)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(96, 16)
        Me.Label9.TabIndex = 2
        Me.Label9.Text = "Valor:"
        '
        'ListIndice
        '
        Me.ListIndice.ItemHeight = 16
        Me.ListIndice.Location = New System.Drawing.Point(8, 30)
        Me.ListIndice.Name = "ListIndice"
        Me.ListIndice.Size = New System.Drawing.Size(136, 20)
        Me.ListIndice.TabIndex = 1
        '
        'Valor
        '
        Me.Valor.Location = New System.Drawing.Point(8, 74)
        Me.Valor.Name = "Valor"
        Me.Valor.Size = New System.Drawing.Size(136, 23)
        Me.Valor.TabIndex = 0
        Me.Valor.Text = "TextBox1"
        '
        'Label11
        '
        Me.Label11.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label11.Location = New System.Drawing.Point(128, 344)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(160, 40)
        Me.Label11.TabIndex = 7
        Me.Label11.Text = "Manutencao de Produtos   ( F2)"
        Me.Label11.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label12
        '
        Me.Label12.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label12.Location = New System.Drawing.Point(304, 345)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(160, 40)
        Me.Label12.TabIndex = 8
        Me.Label12.Text = "Lista de Produtos      (Alt +  F3)"
        Me.Label12.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label13
        '
        Me.Label13.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label13.Location = New System.Drawing.Point(479, 344)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(160, 40)
        Me.Label13.TabIndex = 9
        Me.Label13.Text = "Consulta de Produtos      (Alt +  F8)"
        Me.Label13.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label14
        '
        Me.Label14.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label14.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label14.Location = New System.Drawing.Point(664, 345)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(72, 40)
        Me.Label14.TabIndex = 10
        Me.Label14.Text = "Sair (Alt+F4)"
        Me.Label14.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label15
        '
        Me.Label15.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label15.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label15.Location = New System.Drawing.Point(128, 308)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(608, 24)
        Me.Label15.TabIndex = 11
        Me.Label15.Text = "Iniciar Venda   (F1)"
        Me.Label15.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'BoxCupom
        '
        Me.BoxCupom.BackColor = System.Drawing.SystemColors.ControlLight
        Me.BoxCupom.Controls.AddRange(New System.Windows.Forms.Control() {Me.ListForma, Me.Label17, Me.Label16, Me.Codigo_Produto, Me.Label20, Me.Label21, Me.Label22})
        Me.BoxCupom.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BoxCupom.ForeColor = System.Drawing.Color.DarkBlue
        Me.BoxCupom.Location = New System.Drawing.Point(128, 2)
        Me.BoxCupom.Name = "BoxCupom"
        Me.BoxCupom.Size = New System.Drawing.Size(136, 304)
        Me.BoxCupom.TabIndex = 13
        Me.BoxCupom.TabStop = False
        Me.BoxCupom.Text = "Funcoes Cupom"
        Me.BoxCupom.Visible = False
        '
        'ListForma
        '
        Me.ListForma.Location = New System.Drawing.Point(8, 224)
        Me.ListForma.Name = "ListForma"
        Me.ListForma.Size = New System.Drawing.Size(120, 17)
        Me.ListForma.TabIndex = 6
        Me.ListForma.Visible = False
        '
        'Label17
        '
        Me.Label17.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label17.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label17.ForeColor = System.Drawing.Color.Black
        Me.Label17.Location = New System.Drawing.Point(8, 120)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(120, 40)
        Me.Label17.TabIndex = 5
        Me.Label17.Text = "Cancela Item  N. (Alt + F7)"
        Me.Label17.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label16
        '
        Me.Label16.Location = New System.Drawing.Point(8, 254)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(120, 16)
        Me.Label16.TabIndex = 4
        Me.Label16.Text = "Codigo"
        '
        'Codigo_Produto
        '
        Me.Codigo_Produto.Location = New System.Drawing.Point(8, 272)
        Me.Codigo_Produto.Name = "Codigo_Produto"
        Me.Codigo_Produto.Size = New System.Drawing.Size(120, 20)
        Me.Codigo_Produto.TabIndex = 3
        Me.Codigo_Produto.Text = ""
        '
        'Label20
        '
        Me.Label20.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label20.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label20.ForeColor = System.Drawing.Color.Black
        Me.Label20.Location = New System.Drawing.Point(8, 176)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(120, 40)
        Me.Label20.TabIndex = 2
        Me.Label20.Text = "Fechar Venda (ESC)"
        Me.Label20.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label21
        '
        Me.Label21.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label21.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label21.ForeColor = System.Drawing.Color.Black
        Me.Label21.Location = New System.Drawing.Point(8, 72)
        Me.Label21.Name = "Label21"
        Me.Label21.Size = New System.Drawing.Size(120, 40)
        Me.Label21.TabIndex = 1
        Me.Label21.Text = "Cancela Ultimo Item  (Alt + F6)"
        Me.Label21.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label22
        '
        Me.Label22.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label22.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label22.ForeColor = System.Drawing.Color.Black
        Me.Label22.Location = New System.Drawing.Point(8, 24)
        Me.Label22.Name = "Label22"
        Me.Label22.Size = New System.Drawing.Size(120, 40)
        Me.Label22.TabIndex = 0
        Me.Label22.Text = "Cancela Cupom    (Alt+F5)"
        Me.Label22.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Cupom
        '
        Me.Cupom.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Cupom.Location = New System.Drawing.Point(280, 0)
        Me.Cupom.Name = "Cupom"
        Me.Cupom.Size = New System.Drawing.Size(456, 296)
        Me.Cupom.TabIndex = 14
        Me.Cupom.Text = ""
        Me.Cupom.Visible = False
        '
        'livre
        '
        Me.livre.Font = New System.Drawing.Font("Times New Roman", 48.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.livre.ForeColor = System.Drawing.Color.FromArgb(CType(0, Byte), CType(0, Byte), CType(192, Byte))
        Me.livre.Location = New System.Drawing.Point(272, 104)
        Me.livre.Name = "livre"
        Me.livre.Size = New System.Drawing.Size(472, 80)
        Me.livre.TabIndex = 15
        Me.livre.Text = "CAIXA LIVRE"
        Me.livre.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(760, 421)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.BoxCupom, Me.livre, Me.Cupom, Me.Label15, Me.Label14, Me.Label13, Me.Label12, Me.Label11, Me.Box1, Me.GroupBox1, Me.Label1})
        Me.Menu = Me.MainMenu1
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        CType(Me.Timer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.Box1.ResumeLayout(False)
        Me.BoxCupom.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Operador_Atual = InputBox("Entre com o Nome do Operador", "ECF.NET V1.0")
        Show_MsgUser("Aguarde...LendoECF...!!", "ECF.NET")
        Inicializa_Software_ECF()
        Show_MsgUser("Aguarde...Abrindo e Lendo Banco de Dados...!!", "Produtos")
        Alimentar_DataSet(FRM_Produto.DsProduto)
        Show_MsgUser("", "")

    End Sub

    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub

    'Imprime Leitura X e verifica retorno da DLL e do ECF
    '09/02/2002
    'Claudenir C. Andrade
    Public Sub MAdminLeituraX_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminLeituraX.Click

        Show_MsgUser("Aguarde....Imprimindo LeituraX!!", "LeituraX")
        Ret = Bematech_FI_LeituraX() : Analisa_Retorno_DLL()
        Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
        Show_MsgUser("", "")

    End Sub

    'Imprime a Leitura da MF dos Ultimos 60 Dias
    'O Ideal aqui e solicitar ao usuario a um range de data desejado 
    '09/02/2002
    'Claudenir C. Andrade
    Private Sub MAdminLeituraMF_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminLeituraMF.Click
        Dim Str_Data1, Str_Data2 As String


        Str_Data1 = System.DateTime.Today()
        Str_Data1 = System.DateTime.Today.Day() & "/" & _
                   System.DateTime.Today.Month() - 1 & "/" & _
                   System.DateTime.Today.Year()


        Str_Data1 = FormatDateTime(Str_Data1, DateFormat.ShortDate)
        Str_Data2 = FormatDateTime(System.DateTime.Now, DateFormat.ShortDate)

        Show_MsgUser("Aguarde....Imprimindo Leitura da Memoria Fiscal!!", "Leitura da MF")
        Ret = Bematech_FI_LeituraMemoriaFiscalData(Str_Data1, Str_Data2)
        Analisa_Retorno_DLL()
        Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
        Show_MsgUser("", "")

    End Sub

    Private Sub Timer1_Elapsed(ByVal sender As System.Object, ByVal e As System.Timers.ElapsedEventArgs) Handles Timer1.Elapsed

        Label1.Text = "ECF.NET V1.0 -   " & FormatDateTime(System.DateTime.Now, DateFormat.LongDate) & _
        " -   Operador: " + Operador_Atual + "       " + FormatDateTime(System.DateTime.Now, DateFormat.LongTime)

        If FRM_Produto.Visible = True Then
            FRM_Produto.Label13.Text = "ECF.NET V1.0 -   " & FormatDateTime(System.DateTime.Now, DateFormat.LongDate) & _
                    " -   Operador: " + Operador_Atual + "       " + FormatDateTime(System.DateTime.Now, DateFormat.LongTime)
        End If
    End Sub


    'Executa a Reducao Z Que por seguranca solicitamos a confirmacao do usuario
    '09/02/2002
    'Claudenir C. Andrade
    Private Sub MAdminREducaoZ_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminREducaoZ.Click
        If Windows.Forms.MessageBox.Show("Esta Operacao Encerrara a Operacao com o ECF, Deseja Continuar?", "ECF.NET - Cuidado!!!", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) = DialogResult.No Then
            Exit Sub : End If
        Show_MsgUser("Aguarde....Imprimindo Reducao Z...!!", "ReducaoZ")
        Ret = Bematech_FI_ReducaoZ("", "") : Analisa_Retorno_DLL()
        Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
        Show_MsgUser("", "")
    End Sub

    'Inicializa o Box com as Formas de Pagamento
    '09/02/2002
    'Claudenir C. Andrade
    Private Sub MAdminSuprimento_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminSuprimento.Click
        Dim Pos As Byte = 1

        'Ínicializa o Box Com as Formas de Pagamento
        ListIndice.Enabled = True
        ListIndice.Items.Clear()
        Do While ((Forma_Pagamento(Pos)) <> "")
            ListIndice.Items.Add(Forma_Pagamento(Pos))
            Pos += 1
        Loop
        Valor.Text = ""
        ListIndice.Select()
        Box1.Text = "Suprimento"
        Box1.Visible = True
        ListIndice.Focus()
    End Sub

    'Verifica se foi pressionado Enter na Caixa Valor e executa o Suprimento
    'Ou A Sangria Dependendo do Nome
    '09/02/2002
    'Claudenir C. Andrade
    Private Sub Valor_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles Valor.KeyPress

        If e.KeyChar = Microsoft.VisualBasic.ChrW(13) Then
            If Box1.Text = "Sangria" Then
                If ((Windows.Forms.MessageBox.Show("Confirma Sangria?", "ECF.NET - Sangria", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes)) Then
                    Show_MsgUser("Aguarde....Realizando Sangria...!!", "Sangria")
                    Ret = Bematech_FI_Sangria(Valor.Text) : Analisa_Retorno_DLL()
                    Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
                    Show_MsgUser("", "")
                    Box1.Visible = False
                End If
            Else
                If ((Windows.Forms.MessageBox.Show("Confirma Suprimento?", "ECF.NET - Suprimento", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes)) Then
                    Show_MsgUser("Aguarde....Realizando Suprimento...!!", "Suprimento")
                    Ret = Bematech_FI_Suprimento(Valor.Text, ListIndice.GetItemText(ListIndice.SelectedItem)) : Analisa_Retorno_DLL()
                    Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
                    Show_MsgUser("", "")
                End If
            End If
            Box1.Visible = False
        End If

    End Sub



    'Inicializa o Box para Sangria
    '09/02/2002
    'Claudenir C. Andrade
    Private Sub MAdminSangria_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminSangria.Click
        Dim Pos As Byte = 1
        ListIndice.Enabled = True
        ListIndice.Items.Clear()
        Do While ((Forma_Pagamento(Pos)) <> "")
            ListIndice.Items.Add(Forma_Pagamento(Pos))
            Pos += 1
        Loop
        ListIndice.Select()
        Box1.Text = "Sangria"
        Valor.Text = ""
        Box1.Visible = True
        ListIndice.Enabled = False
        Valor.Focus()
    End Sub


    Private Sub MAdminConfigura_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminConfigura.Click
        If (Windows.Forms.MessageBox.Show("Confirma Impressao das Configuracoes do ECF??", "ECF.NET Imprime Configs", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes) Then
            Show_MsgUser("Aguarde....Imprimindo Configuracoes da Impressora...!!", "Imprime Configs")
            Ret = Bematech_FI_ImprimeConfiguracoesImpressora() : Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Show_MsgUser("", "")
        End If
    End Sub


    Private Sub MAdminTrocaOp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MAdminTrocaOp.Click
        Dim Novo_Operador As String
        Dim Acrescimo, Cancelamento, Desconto, Suprimento, Sangria As Double

        If (Windows.Forms.MessageBox.Show("Confirma Troca Operador??", "ECF.NET Troca de Operador", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes) Then
            Novo_Operador = InputBox("Entre com o Novo Operador", "ECF.NET Troca de Operador")
            Show_MsgUser("Aguarde....Lendo Valores da Impressora...!!", "Troca Operador")

            Geral = Space(2000)

            Ret = Bematech_FI_Descontos(Geral) : Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Desconto = FormatNumber((Geral / 100), 2)

            Ret = Bematech_FI_Cancelamentos(Geral) : Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Cancelamento = FormatNumber((Geral / 100), 2)

            Ret = Bematech_FI_Acrescimos(Geral) : Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Acrescimo = FormatNumber((Geral / 100), 2)

            Ret = Bematech_FI_VerificaTotalizadoresParciais(Geral)
            Sangria = FormatNumber(((Mid(Geral, 398, 14)) / 100), 2)
            Suprimento = FormatNumber(((Mid(Geral, 413, 14)) / 100), 2)

            Show_MsgUser("Aguarde....Imprimindo Relatorio de Troca Operador...!!", "Troca Operador")

            Ret = Bematech_FI_RelatorioGerencial("*************************************" + Chr(13) + Chr(10) + _
            "Relatorio de Troca de Operador" + Chr(13) + Chr(10) + _
            "*************************************" + Chr(13) + Chr(10))
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()

            Ret = Bematech_FI_RelatorioGerencial("Saida: " + Operador_Atual + Chr(13) + Chr(10) + _
            "Entrada: " + Novo_Operador + Chr(13) + Chr(10))
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()

            Ret = Bematech_FI_RelatorioGerencial(Chr(13) + Chr(13) + Chr(13) + _
            "*************************************" + Chr(13) + Chr(10) + _
            "Valores Movimentados" + Chr(13) + Chr(10) + _
            "*************************************" + Chr(13) + Chr(10))
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()


            Ret = Bematech_FI_RelatorioGerencial("Sangria: " & Sangria & Chr(13) & Chr(10) & _
            "Suprimento: " & Suprimento & Chr(13) & Chr(10) & _
            "Cancelamento" & Cancelamento & Chr(13) & Chr(10) & _
            "Desconto:" & Desconto & Chr(13) & Chr(10) & _
            "Acrescimo:" & Acrescimo & Chr(13) & Chr(10))
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()

            Ret = Bematech_FI_RelatorioGerencial(Chr(13) + Chr(13) + Chr(13) + _
                        "*************************************" + Chr(13) + Chr(10) + _
                        "Formas de Pagamento " + Chr(13) + Chr(10) + _
                        "*************************************" + Chr(13) + Chr(10))
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()


            Ret = Bematech_FI_VerificaFormasPagamento(Geral)
            Do While (Geral <> "")
                Bematech_FI_RelatorioGerencial(Mid(Geral, 1, 16) + ":" & _
                    FormatNumber((Mid(Geral, 17, 20) / 100), 2))
                Geral = Mid(Geral, 59, Len(Geral) - 60)
                If (Mid(Geral, 1, 16) = "                ") Then
                    Exit Do
                End If
            Loop

            Ret = Bematech_FI_RelatorioGerencial(Chr(13) + Chr(13) + Chr(13) + _
            "*************************************" + Chr(13) + Chr(10) + _
            "Relatorio Emitido em:" + Chr(13) + Chr(10) + _
            System.DateTime.Now + Chr(13) + Chr(10) + _
            "*************************************" + Chr(13) + Chr(10))
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()


            Ret = Bematech_FI_FechaRelatorioGerencial()
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()

            Show_MsgUser("", "")




        End If




    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub





    'Verifica se No Box Foi Pressionado a Tecla Enter e Seta o Foco para o Valor
    '09/02/2002
    'Claudenir C. Andrade
    Private Sub ListIndice_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles ListIndice.KeyUp
        If e.KeyValue = 13 Then
            Valor.Focus()
        End If
    End Sub


    Private Sub ManutencaoProdutos_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ManutencaoProdutos.Click
        Show_MsgUser("Aguarde....Abrindo e Lendo Banco de Dados...!!", "Produtos")
        FRM_Produto.Show()
        Habilita_Desabilita_TextBox(0)
        Show_MsgUser("", "")
    End Sub










    Public Sub ListaDeProdutos_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListaDeProdutos.Click
        Show_MsgUser("Aguarde...Abrindo e Lendo Banco de Dados...!!", "Produtos")
        Alimentar_DataSet(FRM_Produto.DsProduto)
        FRM_Grid.DataGrid1.Visible = True
        FRM_Grid.DataGrid1.DataSource = FRM_Produto.DsProduto
        FRM_Grid.Show()
        Show_MsgUser("", "")
    End Sub


    Public Sub Codigo_Produto_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles Codigo_Produto.KeyPress

        Dim Numero_Cupom As String

        


        If e.KeyChar = vbCr Then

            REG = FRM_Produto.DsProduto.Produto.FindByCodigo(Me.Codigo_Produto.Text)
            If (REG Is Nothing) Then
                MessageBox.Show("Produto Nao Encontrado")
                Me.Codigo_Produto.Text = ""
                Me.Codigo_Produto.Focus()
                Exit Sub
            End If

            If (Cupom.Text = "") Then
                Ret = Bematech_FI_AbreCupom("") : Analisa_Retorno_DLL()
                Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()

                Numero_Cupom = Space(10)
                Ret = Bematech_FI_NumeroCupom(Numero_Cupom)

                Me.Cupom.Text = "Bematech Industria e Comercio de Equipamentos" & vbCrLf & _
            vbCrLf & _
            "          CNPJ: 0000000000              IE?0000000000" & vbCrLf & _
            "          Indcricao Municipal:11111111111111111111" & vbCrLf & _
            "          " & _
            FormatDateTime(System.DateTime.Now, DateFormat.ShortDate).ToString & _
            FormatDateTime(System.DateTime.Now, DateFormat.ShortTime).ToString & _
            "                 GNF:00001       COO:" & Numero_Cupom & vbCrLf & _
            "                        C U P O M        F I S C A L" & vbCrLf & _
            vbCrLf & _
            "          ITEM      Codigo                       Descricao" & vbCrLf & _
            "                    QTDxUNITARIO                ST             VALOR (R$)" & vbCrLf & _
            "           -----------------------------------------------------------------------------------------" & vbCrLf

            End If

            Ret = Bematech_FI_VendeItem(REG.Codigo, REG.Descricao, _
               REG.Aliquota, "I", "1", 2, REG.Valor, "$", "0")
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Contador_Item += 1
            Me.Cupom.Text &= CStr("          " & _
            "00" & Contador_Item & "   " & REG.Codigo & "  " & REG.Descricao & vbCrLf & _
            "          1X" & REG.Valor & Space(15) & REG.Aliquota & "               " & REG.Valor & _
            vbCrLf)
            Me.Codigo_Produto.Text = ""
            Me.Codigo_Produto.Focus()


        End If
    End Sub

    Private Sub MenuCupomCancelar_Cupom_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuCupomCancelar_Cupom.Click
        Ret = Bematech_FI_CancelaCupom() : Analisa_Retorno_DLL()
        Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
        Me.Cupom.Text = "" : Contador_Item = 0
        Me.BoxCupom.Visible = False
        Me.Cupom.Visible = False
        Me.Cupom.Text = ""
        Me.Codigo_Produto.Focus()
        Me.Codigo_Produto.Text = ""
        Me.livre.Visible = True
    End Sub

    Private Sub MenuCupomIniciar_Venda_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuCupomIniciar_Venda.Click
        Me.BoxCupom.Visible = True
        Me.Cupom.Visible = True
        Me.Cupom.Text = ""
        Me.Codigo_Produto.Focus()
        Me.Codigo_Produto.Text = ""
        Me.livre.Visible = False
    End Sub


    Private Sub MenuCupomCancelaUltimo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuCupomCancelaUltimo.Click
        If (Contador_Item = 0) Then
            MessageBox.Show("Nao Existe Itens Para Cancelamnto")
        Else
            Ret = Bematech_FI_CancelaItemAnterior()
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Me.Cupom.Text &= "Cancelado Ultimo Item" & vbCrLf
        End If
    End Sub

    Private Sub MenuCupomCancelaNumero_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuCupomCancelaNumero.Click
        Dim Numero As String

        Numero = InputBox("Digite o Numero do Item que deseja Cancelar", "ECF.NET Cancela Item")
        If Numero Is Nothing Then : Exit Sub : End If

        If (Numero < Contador_Item = 0) Then
            MessageBox.Show("Nao Existe Itens Para Cancelamnto")
        Else
            Ret = Bematech_FI_CancelaItemGenerico(Numero)
            Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Me.Cupom.Text &= "Cancelado Item Numero" & Numero & vbCrLf
        End If
    End Sub

    Private Sub FechaCupom_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FechaCupom.Click
        

    End Sub

    Private Sub ListForma_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles ListForma.KeyPress
        If e.KeyChar = vbCr Then
            Ret = Bematech_FI_FechaCupomResumido(Me.ListForma.GetItemText(Me.ListForma.SelectedItem()), "Obrigado Volte Sempre" & vbCrLf & Me.Label1.Text) : Analisa_Retorno_DLL()
            Ret = Bematech_FI_RetornoImpressora(ACK, ST1, ST2) : Analisa_Retorno_ECF()
            Me.Cupom.Text = "" : Contador_Item = 0
            Me.BoxCupom.Visible = False
            Me.Cupom.Visible = False
            Me.Cupom.Text = ""
            Me.Codigo_Produto.Focus()
            Me.Codigo_Produto.Text = ""
            Me.livre.Visible = True
        End If
    End Sub

    
    
  
    Private Sub Codigo_Produto_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles Codigo_Produto.KeyDown
        If e.KeyCode = Keys.Escape Then
            Dim i As Byte = 1
            Do While Forma_Pagamento(i) <> "" And i <= 10
                Me.ListForma.Items.Add(Forma_Pagamento(i))
                i += 1
            Loop
            Me.ListForma.Visible = True
            Me.ListForma.Select()
            Me.ListForma.Focus()
            
        End If
    End Sub

    Private Sub ConsultaUnica_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ConsultaUnica.Click
        Dim Codigo As String
        Dim Count As Int32 = 0


        Codigo = InputBox("Entre com o Codigo do Item que deseja Consultar", "Consulta", )
        REG = FRM_Produto.DsProduto.Produto.FindByCodigo(Codigo)
        If REG Is Nothing Then
            Count = FRM_Produto.DsProduto.Produto.Count()
            Do While Count > 0
                REG = FRM_Produto.DsProduto.Produto.Rows.Item(Count - 1)
                If REG.Descricao = Codigo Then
                    Mostrar_Produto()
                    Exit Sub
                End If
                Count -= 1
            Loop
            REG = Nothing
        End If
        Mostrar_Produto()
    End Sub

    
End Class
