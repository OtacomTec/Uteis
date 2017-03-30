Public Class Form3
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
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox4 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox5 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox6 As System.Windows.Forms.TextBox
    Public WithEvents daProduto As System.Data.OleDb.OleDbDataAdapter
    Friend WithEvents FillProduto As System.Data.OleDb.OleDbCommand
    Friend WithEvents InsertProduto As System.Data.OleDb.OleDbCommand
    Friend WithEvents UpDateProduto As System.Data.OleDb.OleDbCommand
    Friend WithEvents DeleteProduto As System.Data.OleDb.OleDbCommand
    Public WithEvents cnnECFNET As System.Data.OleDb.OleDbConnection
    Public WithEvents DsProduto As ECFVBNET.dsProduto
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Adicionar_Registro As System.Windows.Forms.MenuItem
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Produto_Anterior As System.Windows.Forms.MenuItem
    Friend WithEvents Produto_Proximo As System.Windows.Forms.MenuItem
    Friend WithEvents ExcluirRegistro As System.Windows.Forms.MenuItem
    Friend WithEvents OK As System.Windows.Forms.MenuItem
    Friend WithEvents CancelarTudo As System.Windows.Forms.MenuItem
    Friend WithEvents Label13 As System.Windows.Forms.Label

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.TextBox6 = New System.Windows.Forms.TextBox()
        Me.DsProduto = New ECFVBNET.dsProduto()
        Me.TextBox5 = New System.Windows.Forms.TextBox()
        Me.TextBox4 = New System.Windows.Forms.TextBox()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.daProduto = New System.Data.OleDb.OleDbDataAdapter()
        Me.DeleteProduto = New System.Data.OleDb.OleDbCommand()
        Me.cnnECFNET = New System.Data.OleDb.OleDbConnection()
        Me.InsertProduto = New System.Data.OleDb.OleDbCommand()
        Me.FillProduto = New System.Data.OleDb.OleDbCommand()
        Me.UpDateProduto = New System.Data.OleDb.OleDbCommand()
        Me.MainMenu1 = New System.Windows.Forms.MainMenu()
        Me.MenuItem1 = New System.Windows.Forms.MenuItem()
        Me.Adicionar_Registro = New System.Windows.Forms.MenuItem()
        Me.ExcluirRegistro = New System.Windows.Forms.MenuItem()
        Me.Produto_Anterior = New System.Windows.Forms.MenuItem()
        Me.Produto_Proximo = New System.Windows.Forms.MenuItem()
        Me.OK = New System.Windows.Forms.MenuItem()
        Me.CancelarTudo = New System.Windows.Forms.MenuItem()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.GroupBox1.SuspendLayout()
        CType(Me.DsProduto, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.TextBox6, Me.TextBox5, Me.TextBox4, Me.TextBox3, Me.TextBox2, Me.TextBox1, Me.Label6, Me.Label5, Me.Label4, Me.Label3, Me.Label2, Me.Label1})
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.GroupBox1.Location = New System.Drawing.Point(32, -1)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(552, 208)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ECF.NET V1.0 - Ficha de Manutencao de Produtos"
        '
        'TextBox6
        '
        Me.TextBox6.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.DsProduto, "Produto.Estoque"))
        Me.TextBox6.Location = New System.Drawing.Point(160, 152)
        Me.TextBox6.Name = "TextBox6"
        Me.TextBox6.Size = New System.Drawing.Size(360, 23)
        Me.TextBox6.TabIndex = 11
        Me.TextBox6.Text = ""
        '
        'DsProduto
        '
        Me.DsProduto.DataSetName = "dsProduto"
        Me.DsProduto.Locale = New System.Globalization.CultureInfo("pt-BR")
        Me.DsProduto.Namespace = "http://www.tempuri.org/dsProduto.xsd"
        '
        'TextBox5
        '
        Me.TextBox5.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.DsProduto, "Produto.Valor"))
        Me.TextBox5.Location = New System.Drawing.Point(160, 128)
        Me.TextBox5.Name = "TextBox5"
        Me.TextBox5.Size = New System.Drawing.Size(360, 23)
        Me.TextBox5.TabIndex = 10
        Me.TextBox5.Text = ""
        '
        'TextBox4
        '
        Me.TextBox4.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.DsProduto, "Produto.Desconto"))
        Me.TextBox4.Location = New System.Drawing.Point(160, 104)
        Me.TextBox4.Name = "TextBox4"
        Me.TextBox4.Size = New System.Drawing.Size(360, 23)
        Me.TextBox4.TabIndex = 9
        Me.TextBox4.Text = ""
        '
        'TextBox3
        '
        Me.TextBox3.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.DsProduto, "Produto.Aliquota"))
        Me.TextBox3.Location = New System.Drawing.Point(160, 80)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(360, 23)
        Me.TextBox3.TabIndex = 8
        Me.TextBox3.Text = ""
        '
        'TextBox2
        '
        Me.TextBox2.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.DsProduto, "Produto.Descricao"))
        Me.TextBox2.Location = New System.Drawing.Point(160, 58)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(360, 23)
        Me.TextBox2.TabIndex = 7
        Me.TextBox2.Text = ""
        '
        'TextBox1
        '
        Me.TextBox1.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.DsProduto, "Produto.Codigo"))
        Me.TextBox1.Location = New System.Drawing.Point(160, 34)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(360, 23)
        Me.TextBox1.TabIndex = 6
        Me.TextBox1.Text = ""
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.ForeColor = System.Drawing.Color.Black
        Me.Label6.Location = New System.Drawing.Point(24, 160)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(129, 16)
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "Saldo em Estoque :"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.ForeColor = System.Drawing.Color.Black
        Me.Label5.Location = New System.Drawing.Point(24, 136)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(96, 16)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "Valor Unitario:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.Black
        Me.Label4.Location = New System.Drawing.Point(24, 112)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(73, 16)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "Desconto :"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.ForeColor = System.Drawing.Color.Black
        Me.Label3.Location = New System.Drawing.Point(24, 88)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(65, 16)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Alíquota :"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.Black
        Me.Label2.Location = New System.Drawing.Point(24, 58)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(76, 16)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Descrição :"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.Black
        Me.Label1.Location = New System.Drawing.Point(24, 34)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(58, 16)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Código :"
        '
        'daProduto
        '
        Me.daProduto.DeleteCommand = Me.DeleteProduto
        Me.daProduto.InsertCommand = Me.InsertProduto
        Me.daProduto.SelectCommand = Me.FillProduto
        Me.daProduto.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Produto", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Codigo", "Codigo"), New System.Data.Common.DataColumnMapping("Descricao", "Descricao"), New System.Data.Common.DataColumnMapping("Aliquota", "Aliquota"), New System.Data.Common.DataColumnMapping("Desconto", "Desconto"), New System.Data.Common.DataColumnMapping("Valor", "Valor"), New System.Data.Common.DataColumnMapping("Estoque", "Estoque")})})
        Me.daProduto.UpdateCommand = Me.UpDateProduto
        '
        'DeleteProduto
        '
        Me.DeleteProduto.CommandText = "DELETE FROM Produto WHERE (Codigo = ?) AND (Aliquota = ? OR ? IS NULL AND Aliquot" & _
        "a IS NULL) AND (Desconto = ?) AND (Descricao = ? OR ? IS NULL AND Descricao IS N" & _
        "ULL) AND (Valor = ? OR ? IS NULL AND Valor IS NULL)"
        Me.DeleteProduto.Connection = Me.cnnECFNET
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Codigo", System.Data.OleDb.OleDbType.VarWChar, 13, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Codigo", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Aliquota", System.Data.OleDb.OleDbType.VarWChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Aliquota", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Aliquota1", System.Data.OleDb.OleDbType.VarWChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Aliquota", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Desconto", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Desconto", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Descricao", System.Data.OleDb.OleDbType.VarWChar, 29, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Descricao", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Descricao1", System.Data.OleDb.OleDbType.VarWChar, 29, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Descricao", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Valor", System.Data.OleDb.OleDbType.VarWChar, 20, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Valor", System.Data.DataRowVersion.Original, Nothing))
        Me.DeleteProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Valor1", System.Data.OleDb.OleDbType.VarWChar, 20, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Valor", System.Data.DataRowVersion.Original, Nothing))
        '
        'cnnECFNET
        '
        Me.cnnECFNET.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Password="""";User ID=Admin;Data Source=C:\Arquivo" & _
        "s de programas\Microsoft Visual Studio .NET\Vb7\Bin\Book\aplVBNET\ECFVBNET\ECFNE" & _
        "T.MDB;Mode=Share Deny None;Extended Properties="""";Jet OLEDB:System database="""";J" & _
        "et OLEDB:Registry Path="""";Jet OLEDB:Database Password="""";Jet OLEDB:Engine Type=5" & _
        ";Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB" & _
        ":Global Bulk Transactions=1;Jet OLEDB:New Database Password="""";Jet OLEDB:Create " & _
        "System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Loca" & _
        "le on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP" & _
        "=False"
        '
        'InsertProduto
        '
        Me.InsertProduto.CommandText = "INSERT INTO Produto(Aliquota, Codigo, Desconto, Descricao, Estoque, Valor) VALUES" & _
        " (?, ?, ?, ?, ?, ?)"
        Me.InsertProduto.Connection = Me.cnnECFNET
        Me.InsertProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Aliquota", System.Data.OleDb.OleDbType.VarWChar, 4, "Aliquota"))
        Me.InsertProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Codigo", System.Data.OleDb.OleDbType.VarWChar, 13, "Codigo"))
        Me.InsertProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Desconto", System.Data.OleDb.OleDbType.Boolean, 2, "Desconto"))
        Me.InsertProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Descricao", System.Data.OleDb.OleDbType.VarWChar, 29, "Descricao"))
        Me.InsertProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Estoque", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(10, Byte), CType(0, Byte), "Estoque", System.Data.DataRowVersion.Current, Nothing))
        Me.InsertProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Valor", System.Data.OleDb.OleDbType.VarWChar, 20, "Valor"))
        '
        'FillProduto
        '
        Me.FillProduto.CommandText = "SELECT Aliquota, Codigo, Desconto, Descricao, Estoque, Valor FROM Produto"
        Me.FillProduto.Connection = Me.cnnECFNET
        '
        'UpDateProduto
        '
        Me.UpDateProduto.CommandText = "UPDATE Produto SET Aliquota = ?, Codigo = ?, Desconto = ?, Descricao = ?, Estoque" & _
        " = ?, Valor = ? WHERE (Codigo = ?) AND (Aliquota = ? OR ? IS NULL AND Aliquota I" & _
        "S NULL) AND (Desconto = ?) AND (Descricao = ? OR ? IS NULL AND Descricao IS NULL" & _
        ") AND (Valor = ? OR ? IS NULL AND Valor IS NULL)"
        Me.UpDateProduto.Connection = Me.cnnECFNET
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Aliquota", System.Data.OleDb.OleDbType.VarWChar, 4, "Aliquota"))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Codigo", System.Data.OleDb.OleDbType.VarWChar, 13, "Codigo"))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Desconto", System.Data.OleDb.OleDbType.Boolean, 2, "Desconto"))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Descricao", System.Data.OleDb.OleDbType.VarWChar, 29, "Descricao"))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Estoque", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(10, Byte), CType(0, Byte), "Estoque", System.Data.DataRowVersion.Current, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Valor", System.Data.OleDb.OleDbType.VarWChar, 20, "Valor"))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Codigo", System.Data.OleDb.OleDbType.VarWChar, 13, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Codigo", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Aliquota", System.Data.OleDb.OleDbType.VarWChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Aliquota", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Aliquota1", System.Data.OleDb.OleDbType.VarWChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Aliquota", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Desconto", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Desconto", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Descricao", System.Data.OleDb.OleDbType.VarWChar, 29, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Descricao", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Descricao1", System.Data.OleDb.OleDbType.VarWChar, 29, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Descricao", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Valor", System.Data.OleDb.OleDbType.VarWChar, 20, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Valor", System.Data.DataRowVersion.Original, Nothing))
        Me.UpDateProduto.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Valor1", System.Data.OleDb.OleDbType.VarWChar, 20, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Valor", System.Data.DataRowVersion.Original, Nothing))
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.Adicionar_Registro, Me.ExcluirRegistro, Me.Produto_Anterior, Me.Produto_Proximo, Me.OK, Me.CancelarTudo})
        Me.MenuItem1.Text = "REgistro"
        Me.MenuItem1.Visible = False
        '
        'Adicionar_Registro
        '
        Me.Adicionar_Registro.Index = 0
        Me.Adicionar_Registro.Shortcut = System.Windows.Forms.Shortcut.Ins
        Me.Adicionar_Registro.Text = "AdicionarRegistro"
        '
        'ExcluirRegistro
        '
        Me.ExcluirRegistro.Index = 1
        Me.ExcluirRegistro.Shortcut = System.Windows.Forms.Shortcut.Del
        Me.ExcluirRegistro.Text = "ExcluirRegistro"
        '
        'Produto_Anterior
        '
        Me.Produto_Anterior.Index = 2
        Me.Produto_Anterior.Shortcut = System.Windows.Forms.Shortcut.F7
        Me.Produto_Anterior.Text = "Anterior"
        '
        'Produto_Proximo
        '
        Me.Produto_Proximo.Index = 3
        Me.Produto_Proximo.Shortcut = System.Windows.Forms.Shortcut.F8
        Me.Produto_Proximo.Text = "Proximo"
        '
        'OK
        '
        Me.OK.Index = 4
        Me.OK.Shortcut = System.Windows.Forms.Shortcut.F4
        Me.OK.Text = "OK"
        '
        'CancelarTudo
        '
        Me.CancelarTudo.Index = 5
        Me.CancelarTudo.Shortcut = System.Windows.Forms.Shortcut.F3
        Me.CancelarTudo.Text = "CancelarTudo"
        '
        'Label7
        '
        Me.Label7.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.ForeColor = System.Drawing.Color.FromArgb(CType(0, Byte), CType(0, Byte), CType(192, Byte))
        Me.Label7.Location = New System.Drawing.Point(36, 223)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(136, 40)
        Me.Label7.TabIndex = 1
        Me.Label7.Text = "Cadastrar Produto       (Insert)"
        Me.Label7.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label8
        '
        Me.Label8.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.ForeColor = System.Drawing.Color.Red
        Me.Label8.Location = New System.Drawing.Point(36, 271)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(136, 40)
        Me.Label8.TabIndex = 2
        Me.Label8.Text = "Eliminar Produto       (Del)"
        Me.Label8.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label9
        '
        Me.Label9.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.ForeColor = System.Drawing.Color.FromArgb(CType(0, Byte), CType(0, Byte), CType(192, Byte))
        Me.Label9.Location = New System.Drawing.Point(448, 271)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(136, 40)
        Me.Label9.TabIndex = 3
        Me.Label9.Text = ">> Proximo >>         (F8)"
        Me.Label9.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label10
        '
        Me.Label10.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label10.ForeColor = System.Drawing.Color.Red
        Me.Label10.Location = New System.Drawing.Point(448, 223)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(136, 40)
        Me.Label10.TabIndex = 4
        Me.Label10.Text = "<< Anterior <<             (F7)"
        Me.Label10.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label11
        '
        Me.Label11.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label11.ForeColor = System.Drawing.Color.Red
        Me.Label11.Location = New System.Drawing.Point(240, 271)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(136, 40)
        Me.Label11.TabIndex = 5
        Me.Label11.Text = "Cancelar Tudo    (F3)"
        Me.Label11.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label12
        '
        Me.Label12.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label12.ForeColor = System.Drawing.Color.FromArgb(CType(0, Byte), CType(0, Byte), CType(192, Byte))
        Me.Label12.Location = New System.Drawing.Point(240, 223)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(136, 40)
        Me.Label12.TabIndex = 6
        Me.Label12.Text = "OK - Aplicar         (F4)"
        Me.Label12.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label13
        '
        Me.Label13.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label13.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.Label13.Location = New System.Drawing.Point(-68, 352)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(760, 24)
        Me.Label13.TabIndex = 7
        Me.Label13.Text = "Label13"
        Me.Label13.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Form3
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(624, 372)
        Me.ControlBox = False
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label13, Me.Label12, Me.Label11, Me.Label10, Me.Label9, Me.Label8, Me.Label7, Me.GroupBox1})
        Me.MaximizeBox = False
        Me.Menu = Me.MainMenu1
        Me.MinimizeBox = False
        Me.Name = "Form3"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Manutencao de Produtos"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.DsProduto, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '10/02/2002
        'Alimentamos o DataSet com os Registros e mostramos
        'O Indice Atual

        Me.cnnECFNET.Close() 'So pra garantir, he,he,he.
        Alimentar_DataSet(DsProduto)
        Indice_Atual()

    End Sub

    
    Private Sub Adicionar_Registro_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Adicionar_Registro.Click
        Habilita_Desabilita_TextBox(1)
        Try
            FRM_Produto.BindingContext(DsProduto, "Produto").AddNew()
        Catch Erro_Add As System.Exception
            MessageBox.Show("Erro Fatal ao Adicionar Registro", "ECF.NET ERRO!!")
            Habilita_Desabilita_TextBox(0)
        Finally
            FRM_Produto.TextBox1.Focus()
        End Try
    End Sub


    Private Sub Produto_Proximo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Produto_Proximo.Click
        Habilita_Desabilita_TextBox(0)
        FRM_Produto.BindingContext(FRM_Produto.DsProduto, "Produto").Position += 1
        Indice_Atual()
    End Sub

    Private Sub Produto_Anterior_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Produto_Anterior.Click
        Habilita_Desabilita_TextBox(0)
        FRM_Produto.BindingContext(FRM_Produto.DsProduto, "Produto").Position -= 1
        Indice_Atual()
    End Sub


    Private Sub ExcluirRegistro_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExcluirRegistro.Click

        If (MessageBox.Show("Deseja Realmente Eliminar este Registro?", "ECF.NET  - Eliminar Registro" _
        , MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) = DialogResult.Yes) Then

            If FRM_Produto.BindingContext(DsProduto, "Produto").Count > 0 Then

                FRM_Produto.BindingContext(DsProduto, "Produto"). _
                RemoveAt(FRM_Produto.BindingContext(DsProduto, "Produto").Position)

                Indice_Atual()
            Else
                MessageBox.Show("Não Há Registros a serem Eliminados")
            End If

        End If
    End Sub

   
    Private Sub TextBox6_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox6.KeyPress
        If e.KeyChar = Microsoft.VisualBasic.vbTab Or _
           e.KeyChar = Microsoft.VisualBasic.vbCr Then

            If (MessageBox.Show("Confirma este Novo Registro?", "ECF.NET Novo REgistro", MessageBoxButtons.YesNo, MessageBoxIcon.Question) _
            = DialogResult.No) Then
                FRM_Produto.BindingContext(DsProduto, "Produto").CancelCurrentEdit()
                Indice_Atual()
                Habilita_Desabilita_TextBox(0)
            Else
                'Adicionar_Registro_Click(Adicionar_Registro, e)
                'TextBox1.Focus()
                Habilita_Desabilita_TextBox(0)
            End If

        End If
    End Sub

    Private Sub Label12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label12.Click
        FRM_Produto.Hide()

    End Sub

    
   
    Private Sub CancelarTudo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CancelarTudo.Click
        If (MessageBox.Show("Tem Certeza que deseja Cancelar Todas as operacoes realizadas?", "ECF.NET Cancelar Modificaçoes e Inclusoes", MessageBoxButtons.YesNo, MessageBoxIcon.Question) _
                   = DialogResult.Yes) Then
            FRM_Produto.DsProduto.RejectChanges()
            Indice_Atual()

        End If
    End Sub

    Private Sub TextBox1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox1.KeyDown
        If e.KeyCode = Keys.Escape Then
            If (MessageBox.Show("Deseja Cancelar esta Inclusao?", "ECF.NET Cancela Inclusão", MessageBoxButtons.YesNo, _
            MessageBoxIcon.Question) = DialogResult.Yes) Then
                Cancela_Inclusao()
            End If
        End If
    End Sub

    Private Sub TextBox2_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox2.KeyDown
        If e.KeyCode = Keys.Escape Then
            If (MessageBox.Show("Deseja Cancelar esta Inclusao?", "ECF.NET Cancela Inclusão", MessageBoxButtons.YesNo, _
            MessageBoxIcon.Question) = DialogResult.Yes) Then
                Cancela_Inclusao()
            End If
        End If
    End Sub

    Private Sub TextBox3_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox3.KeyDown
        If e.KeyCode = Keys.Escape Then
            If (MessageBox.Show("Deseja Cancelar esta Inclusao?", "ECF.NET Cancela Inclusão", MessageBoxButtons.YesNo, _
            MessageBoxIcon.Question) = DialogResult.Yes) Then
                Cancela_Inclusao()
            End If
        End If
    End Sub

    Private Sub TextBox4_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox4.KeyDown
        If e.KeyCode = Keys.Escape Then
            If (MessageBox.Show("Deseja Cancelar esta Inclusao?", "ECF.NET Cancela Inclusão", MessageBoxButtons.YesNo, _
            MessageBoxIcon.Question) = DialogResult.Yes) Then
                Cancela_Inclusao()
            End If
        End If
    End Sub

    Private Sub TextBox5_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox5.KeyDown
        If e.KeyCode = Keys.Escape Then
            If (MessageBox.Show("Deseja Cancelar esta Inclusao?", "ECF.NET Cancela Inclusão", MessageBoxButtons.YesNo, _
            MessageBoxIcon.Question) = DialogResult.Yes) Then
                Cancela_Inclusao()
            End If
        End If
    End Sub

    Private Sub TextBox6_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox6.KeyDown
        If e.KeyCode = Keys.Escape Then
            If (MessageBox.Show("Deseja Cancelar esta Inclusao?", "ECF.NET Cancela Inclusão", MessageBoxButtons.YesNo, _
            MessageBoxIcon.Question) = DialogResult.Yes) Then
                Cancela_Inclusao()
            End If
        End If
    End Sub

    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        Try
            Atualiza_DataSet()
            Me.Hide()
        Catch
            MessageBox.Show("Problemas na Autlaizacao do Data Set")
        End Try
    End Sub

    
End Class
