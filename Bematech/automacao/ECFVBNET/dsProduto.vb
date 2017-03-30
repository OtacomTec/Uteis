﻿'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version: 1.0.3328.4
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Imports System
Imports System.Data
Imports System.Runtime.Serialization
Imports System.Xml


<Serializable(),  _
 System.ComponentModel.DesignerCategoryAttribute("code"),  _
 System.Diagnostics.DebuggerStepThrough(),  _
 System.ComponentModel.ToolboxItem(true)>  _
Public Class dsProduto
    Inherits DataSet
    
    Private tableProduto As ProdutoDataTable
    
    Public Sub New()
        MyBase.New
        Me.InitClass
        Dim schemaChangedHandler As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
        AddHandler Me.Tables.CollectionChanged, schemaChangedHandler
        AddHandler Me.Relations.CollectionChanged, schemaChangedHandler
    End Sub
    
    Protected Sub New(ByVal info As SerializationInfo, ByVal context As StreamingContext)
        MyBase.New
        Dim strSchema As String = CType(info.GetValue("XmlSchema", GetType(System.String)),String)
        If (Not (strSchema) Is Nothing) Then
            Dim ds As DataSet = New DataSet
            ds.ReadXmlSchema(New XmlTextReader(New System.IO.StringReader(strSchema)))
            If (Not (ds.Tables("Produto")) Is Nothing) Then
                Me.Tables.Add(New ProdutoDataTable(ds.Tables("Produto")))
            End If
            Me.DataSetName = ds.DataSetName
            Me.Prefix = ds.Prefix
            Me.Namespace = ds.Namespace
            Me.Locale = ds.Locale
            Me.CaseSensitive = ds.CaseSensitive
            Me.EnforceConstraints = ds.EnforceConstraints
            Me.Merge(ds, false, System.Data.MissingSchemaAction.Add)
            Me.InitVars
        Else
            Me.InitClass
        End If
        Me.GetSerializationData(info, context)
        Dim schemaChangedHandler As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
        AddHandler Me.Tables.CollectionChanged, schemaChangedHandler
        AddHandler Me.Relations.CollectionChanged, schemaChangedHandler
    End Sub
    
    <System.ComponentModel.Browsable(false),  _
     System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)>  _
    Public ReadOnly Property Produto As ProdutoDataTable
        Get
            Return Me.tableProduto
        End Get
    End Property
    
    Public Overrides Function Clone() As DataSet
        Dim cln As dsProduto = CType(MyBase.Clone,dsProduto)
        cln.InitVars
        Return cln
    End Function
    
    Protected Overrides Function ShouldSerializeTables() As Boolean
        Return false
    End Function
    
    Protected Overrides Function ShouldSerializeRelations() As Boolean
        Return false
    End Function
    
    Protected Overrides Sub ReadXmlSerializable(ByVal reader As XmlReader)
        Me.Reset
        Dim ds As DataSet = New DataSet
        ds.ReadXml(reader)
        If (Not (ds.Tables("Produto")) Is Nothing) Then
            Me.Tables.Add(New ProdutoDataTable(ds.Tables("Produto")))
        End If
        Me.DataSetName = ds.DataSetName
        Me.Prefix = ds.Prefix
        Me.Namespace = ds.Namespace
        Me.Locale = ds.Locale
        Me.CaseSensitive = ds.CaseSensitive
        Me.EnforceConstraints = ds.EnforceConstraints
        Me.Merge(ds, false, System.Data.MissingSchemaAction.Add)
        Me.InitVars
    End Sub
    
    Protected Overrides Function GetSchemaSerializable() As System.Xml.Schema.XmlSchema
        Dim stream As System.IO.MemoryStream = New System.IO.MemoryStream
        Me.WriteXmlSchema(New XmlTextWriter(stream, Nothing))
        stream.Position = 0
        Return System.Xml.Schema.XmlSchema.Read(New XmlTextReader(stream), Nothing)
    End Function
    
    Friend Sub InitVars()
        Me.tableProduto = CType(Me.Tables("Produto"),ProdutoDataTable)
        If (Not (Me.tableProduto) Is Nothing) Then
            Me.tableProduto.InitVars
        End If
    End Sub
    
    Private Sub InitClass()
        Me.DataSetName = "dsProduto"
        Me.Prefix = ""
        Me.Namespace = "http://www.tempuri.org/dsProduto.xsd"
        Me.Locale = New System.Globalization.CultureInfo("pt-BR")
        Me.CaseSensitive = false
        Me.EnforceConstraints = true
        Me.tableProduto = New ProdutoDataTable
        Me.Tables.Add(Me.tableProduto)
    End Sub
    
    Private Function ShouldSerializeProduto() As Boolean
        Return false
    End Function
    
    Private Sub SchemaChanged(ByVal sender As Object, ByVal e As System.ComponentModel.CollectionChangeEventArgs)
        If (e.Action = System.ComponentModel.CollectionChangeAction.Remove) Then
            Me.InitVars
        End If
    End Sub
    
    Public Delegate Sub ProdutoRowChangeEventHandler(ByVal sender As Object, ByVal e As ProdutoRowChangeEvent)
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class ProdutoDataTable
        Inherits DataTable
        Implements System.Collections.IEnumerable
        
        Private columnAliquota As DataColumn
        
        Private columnCodigo As DataColumn
        
        Private columnDesconto As DataColumn
        
        Private columnDescricao As DataColumn
        
        Private columnEstoque As DataColumn
        
        Private columnValor As DataColumn
        
        Friend Sub New()
            MyBase.New("Produto")
            Me.InitClass
        End Sub
        
        Friend Sub New(ByVal table As DataTable)
            MyBase.New(table.TableName)
            If (table.CaseSensitive <> table.DataSet.CaseSensitive) Then
                Me.CaseSensitive = table.CaseSensitive
            End If
            If (table.Locale.ToString <> table.DataSet.Locale.ToString) Then
                Me.Locale = table.Locale
            End If
            If (table.Namespace <> table.DataSet.Namespace) Then
                Me.Namespace = table.Namespace
            End If
            Me.Prefix = table.Prefix
            Me.MinimumCapacity = table.MinimumCapacity
            Me.DisplayExpression = table.DisplayExpression
        End Sub
        
        <System.ComponentModel.Browsable(false)>  _
        Public ReadOnly Property Count As Integer
            Get
                Return Me.Rows.Count
            End Get
        End Property
        
        Friend ReadOnly Property AliquotaColumn As DataColumn
            Get
                Return Me.columnAliquota
            End Get
        End Property
        
        Friend ReadOnly Property CodigoColumn As DataColumn
            Get
                Return Me.columnCodigo
            End Get
        End Property
        
        Friend ReadOnly Property DescontoColumn As DataColumn
            Get
                Return Me.columnDesconto
            End Get
        End Property
        
        Friend ReadOnly Property DescricaoColumn As DataColumn
            Get
                Return Me.columnDescricao
            End Get
        End Property
        
        Friend ReadOnly Property EstoqueColumn As DataColumn
            Get
                Return Me.columnEstoque
            End Get
        End Property
        
        Friend ReadOnly Property ValorColumn As DataColumn
            Get
                Return Me.columnValor
            End Get
        End Property
        
        Public Default ReadOnly Property Item(ByVal index As Integer) As ProdutoRow
            Get
                Return CType(Me.Rows(index),ProdutoRow)
            End Get
        End Property
        
        Public Event ProdutoRowChanged As ProdutoRowChangeEventHandler
        
        Public Event ProdutoRowChanging As ProdutoRowChangeEventHandler
        
        Public Event ProdutoRowDeleted As ProdutoRowChangeEventHandler
        
        Public Event ProdutoRowDeleting As ProdutoRowChangeEventHandler
        
        Public Overloads Sub AddProdutoRow(ByVal row As ProdutoRow)
            Me.Rows.Add(row)
        End Sub
        
        Public Overloads Function AddProdutoRow(ByVal Aliquota As String, ByVal Codigo As String, ByVal Desconto As Boolean, ByVal Descricao As String, ByVal Estoque As Integer, ByVal Valor As String) As ProdutoRow
            Dim rowProdutoRow As ProdutoRow = CType(Me.NewRow,ProdutoRow)
            rowProdutoRow.ItemArray = New Object() {Aliquota, Codigo, Desconto, Descricao, Estoque, Valor}
            Me.Rows.Add(rowProdutoRow)
            Return rowProdutoRow
        End Function
        
        Public Function FindByCodigo(ByVal Codigo As String) As ProdutoRow
            Return CType(Me.Rows.Find(New Object() {Codigo}),ProdutoRow)
        End Function
        
        Public Function GetEnumerator() As System.Collections.IEnumerator Implements System.Collections.IEnumerable.GetEnumerator
            Return Me.Rows.GetEnumerator
        End Function
        
        Public Overrides Function Clone() As DataTable
            Dim cln As ProdutoDataTable = CType(MyBase.Clone,ProdutoDataTable)
            cln.InitVars
            Return cln
        End Function
        
        Friend Sub InitVars()
            Me.columnAliquota = Me.Columns("Aliquota")
            Me.columnCodigo = Me.Columns("Codigo")
            Me.columnDesconto = Me.Columns("Desconto")
            Me.columnDescricao = Me.Columns("Descricao")
            Me.columnEstoque = Me.Columns("Estoque")
            Me.columnValor = Me.Columns("Valor")
        End Sub
        
        Private Sub InitClass()
            Me.columnAliquota = New DataColumn("Aliquota", GetType(System.String), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnAliquota)
            Me.columnCodigo = New DataColumn("Codigo", GetType(System.String), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnCodigo)
            Me.columnDesconto = New DataColumn("Desconto", GetType(System.Boolean), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnDesconto)
            Me.columnDescricao = New DataColumn("Descricao", GetType(System.String), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnDescricao)
            Me.columnEstoque = New DataColumn("Estoque", GetType(System.Int32), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnEstoque)
            Me.columnValor = New DataColumn("Valor", GetType(System.String), Nothing, System.Data.MappingType.Element)
            Me.Columns.Add(Me.columnValor)
            Me.Constraints.Add(New UniqueConstraint("Constraint1", New DataColumn() {Me.columnCodigo}, true))
            Me.columnCodigo.AllowDBNull = false
            Me.columnCodigo.Unique = true
        End Sub
        
        Public Function NewProdutoRow() As ProdutoRow
            Return CType(Me.NewRow,ProdutoRow)
        End Function
        
        Protected Overrides Function NewRowFromBuilder(ByVal builder As DataRowBuilder) As DataRow
            Return New ProdutoRow(builder)
        End Function
        
        Protected Overrides Function GetRowType() As System.Type
            Return GetType(ProdutoRow)
        End Function
        
        Protected Overrides Sub OnRowChanged(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowChanged(e)
            If (Not (Me.ProdutoRowChangedEvent) Is Nothing) Then
                RaiseEvent ProdutoRowChanged(Me, New ProdutoRowChangeEvent(CType(e.Row,ProdutoRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowChanging(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowChanging(e)
            If (Not (Me.ProdutoRowChangingEvent) Is Nothing) Then
                RaiseEvent ProdutoRowChanging(Me, New ProdutoRowChangeEvent(CType(e.Row,ProdutoRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowDeleted(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowDeleted(e)
            If (Not (Me.ProdutoRowDeletedEvent) Is Nothing) Then
                RaiseEvent ProdutoRowDeleted(Me, New ProdutoRowChangeEvent(CType(e.Row,ProdutoRow), e.Action))
            End If
        End Sub
        
        Protected Overrides Sub OnRowDeleting(ByVal e As DataRowChangeEventArgs)
            MyBase.OnRowDeleting(e)
            If (Not (Me.ProdutoRowDeletingEvent) Is Nothing) Then
                RaiseEvent ProdutoRowDeleting(Me, New ProdutoRowChangeEvent(CType(e.Row,ProdutoRow), e.Action))
            End If
        End Sub
        
        Public Sub RemoveProdutoRow(ByVal row As ProdutoRow)
            Me.Rows.Remove(row)
        End Sub
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class ProdutoRow
        Inherits DataRow
        
        Private tableProduto As ProdutoDataTable
        
        Friend Sub New(ByVal rb As DataRowBuilder)
            MyBase.New(rb)
            Me.tableProduto = CType(Me.Table,ProdutoDataTable)
        End Sub
        
        Public Property Aliquota As String
            Get
                Try 
                    Return CType(Me(Me.tableProduto.AliquotaColumn),String)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableProduto.AliquotaColumn) = value
            End Set
        End Property
        
        Public Property Codigo As String
            Get
                Return CType(Me(Me.tableProduto.CodigoColumn),String)
            End Get
            Set
                Me(Me.tableProduto.CodigoColumn) = value
            End Set
        End Property
        
        Public Property Desconto As Boolean
            Get
                Try 
                    Return CType(Me(Me.tableProduto.DescontoColumn),Boolean)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableProduto.DescontoColumn) = value
            End Set
        End Property
        
        Public Property Descricao As String
            Get
                Try 
                    Return CType(Me(Me.tableProduto.DescricaoColumn),String)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableProduto.DescricaoColumn) = value
            End Set
        End Property
        
        Public Property Estoque As Integer
            Get
                Try 
                    Return CType(Me(Me.tableProduto.EstoqueColumn),Integer)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableProduto.EstoqueColumn) = value
            End Set
        End Property
        
        Public Property Valor As String
            Get
                Try 
                    Return CType(Me(Me.tableProduto.ValorColumn),String)
                Catch e As InvalidCastException
                    Throw New StrongTypingException("Cannot get value because it is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableProduto.ValorColumn) = value
            End Set
        End Property
        
        Public Function IsAliquotaNull() As Boolean
            Return Me.IsNull(Me.tableProduto.AliquotaColumn)
        End Function
        
        Public Sub SetAliquotaNull()
            Me(Me.tableProduto.AliquotaColumn) = System.Convert.DBNull
        End Sub
        
        Public Function IsDescontoNull() As Boolean
            Return Me.IsNull(Me.tableProduto.DescontoColumn)
        End Function
        
        Public Sub SetDescontoNull()
            Me(Me.tableProduto.DescontoColumn) = System.Convert.DBNull
        End Sub
        
        Public Function IsDescricaoNull() As Boolean
            Return Me.IsNull(Me.tableProduto.DescricaoColumn)
        End Function
        
        Public Sub SetDescricaoNull()
            Me(Me.tableProduto.DescricaoColumn) = System.Convert.DBNull
        End Sub
        
        Public Function IsEstoqueNull() As Boolean
            Return Me.IsNull(Me.tableProduto.EstoqueColumn)
        End Function
        
        Public Sub SetEstoqueNull()
            Me(Me.tableProduto.EstoqueColumn) = System.Convert.DBNull
        End Sub
        
        Public Function IsValorNull() As Boolean
            Return Me.IsNull(Me.tableProduto.ValorColumn)
        End Function
        
        Public Sub SetValorNull()
            Me(Me.tableProduto.ValorColumn) = System.Convert.DBNull
        End Sub
    End Class
    
    <System.Diagnostics.DebuggerStepThrough()>  _
    Public Class ProdutoRowChangeEvent
        Inherits EventArgs
        
        Private eventRow As ProdutoRow
        
        Private eventAction As DataRowAction
        
        Public Sub New(ByVal row As ProdutoRow, ByVal action As DataRowAction)
            MyBase.New
            Me.eventRow = row
            Me.eventAction = action
        End Sub
        
        Public ReadOnly Property Row As ProdutoRow
            Get
                Return Me.eventRow
            End Get
        End Property
        
        Public ReadOnly Property Action As DataRowAction
            Get
                Return Me.eventAction
            End Get
        End Property
    End Class
End Class
