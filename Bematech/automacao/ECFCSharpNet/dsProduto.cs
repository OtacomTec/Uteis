﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Runtime Version: 1.0.3328.4
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

namespace ECFCSharpNet {
    using System;
    using System.Data;
    using System.Xml;
    using System.Runtime.Serialization;
    
    
    [Serializable()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Diagnostics.DebuggerStepThrough()]
    [System.ComponentModel.ToolboxItem(true)]
    public class dsProduto : DataSet {
        
        private ProdutoDataTable tableProduto;
        
        public dsProduto() {
            this.InitClass();
            System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler = new System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
            this.Tables.CollectionChanged += schemaChangedHandler;
            this.Relations.CollectionChanged += schemaChangedHandler;
        }
        
        protected dsProduto(SerializationInfo info, StreamingContext context) {
            string strSchema = ((string)(info.GetValue("XmlSchema", typeof(string))));
            if ((strSchema != null)) {
                DataSet ds = new DataSet();
                ds.ReadXmlSchema(new XmlTextReader(new System.IO.StringReader(strSchema)));
                if ((ds.Tables["Produto"] != null)) {
                    this.Tables.Add(new ProdutoDataTable(ds.Tables["Produto"]));
                }
                this.DataSetName = ds.DataSetName;
                this.Prefix = ds.Prefix;
                this.Namespace = ds.Namespace;
                this.Locale = ds.Locale;
                this.CaseSensitive = ds.CaseSensitive;
                this.EnforceConstraints = ds.EnforceConstraints;
                this.Merge(ds, false, System.Data.MissingSchemaAction.Add);
                this.InitVars();
            }
            else {
                this.InitClass();
            }
            this.GetSerializationData(info, context);
            System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler = new System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
            this.Tables.CollectionChanged += schemaChangedHandler;
            this.Relations.CollectionChanged += schemaChangedHandler;
        }
        
        [System.ComponentModel.Browsable(false)]
        [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
        public ProdutoDataTable Produto {
            get {
                return this.tableProduto;
            }
        }
        
        public override DataSet Clone() {
            dsProduto cln = ((dsProduto)(base.Clone()));
            cln.InitVars();
            return cln;
        }
        
        protected override bool ShouldSerializeTables() {
            return false;
        }
        
        protected override bool ShouldSerializeRelations() {
            return false;
        }
        
        protected override void ReadXmlSerializable(XmlReader reader) {
            this.Reset();
            DataSet ds = new DataSet();
            ds.ReadXml(reader);
            if ((ds.Tables["Produto"] != null)) {
                this.Tables.Add(new ProdutoDataTable(ds.Tables["Produto"]));
            }
            this.DataSetName = ds.DataSetName;
            this.Prefix = ds.Prefix;
            this.Namespace = ds.Namespace;
            this.Locale = ds.Locale;
            this.CaseSensitive = ds.CaseSensitive;
            this.EnforceConstraints = ds.EnforceConstraints;
            this.Merge(ds, false, System.Data.MissingSchemaAction.Add);
            this.InitVars();
        }
        
        protected override System.Xml.Schema.XmlSchema GetSchemaSerializable() {
            System.IO.MemoryStream stream = new System.IO.MemoryStream();
            this.WriteXmlSchema(new XmlTextWriter(stream, null));
            stream.Position = 0;
            return System.Xml.Schema.XmlSchema.Read(new XmlTextReader(stream), null);
        }
        
        internal void InitVars() {
            this.tableProduto = ((ProdutoDataTable)(this.Tables["Produto"]));
            if ((this.tableProduto != null)) {
                this.tableProduto.InitVars();
            }
        }
        
        private void InitClass() {
            this.DataSetName = "dsProduto";
            this.Prefix = "";
            this.Namespace = "http://www.tempuri.org/dsProduto.xsd";
            this.Locale = new System.Globalization.CultureInfo("pt-BR");
            this.CaseSensitive = false;
            this.EnforceConstraints = true;
            this.tableProduto = new ProdutoDataTable();
            this.Tables.Add(this.tableProduto);
        }
        
        private bool ShouldSerializeProduto() {
            return false;
        }
        
        private void SchemaChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e) {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove)) {
                this.InitVars();
            }
        }
        
        public delegate void ProdutoRowChangeEventHandler(object sender, ProdutoRowChangeEvent e);
        
        [System.Diagnostics.DebuggerStepThrough()]
        public class ProdutoDataTable : DataTable, System.Collections.IEnumerable {
            
            private DataColumn columnAliquota;
            
            private DataColumn columnCodigo;
            
            private DataColumn columnDesconto;
            
            private DataColumn columnDescricao;
            
            private DataColumn columnEstoque;
            
            private DataColumn columnValor;
            
            internal ProdutoDataTable() : 
                    base("Produto") {
                this.InitClass();
            }
            
            internal ProdutoDataTable(DataTable table) : 
                    base(table.TableName) {
                if ((table.CaseSensitive != table.DataSet.CaseSensitive)) {
                    this.CaseSensitive = table.CaseSensitive;
                }
                if ((table.Locale.ToString() != table.DataSet.Locale.ToString())) {
                    this.Locale = table.Locale;
                }
                if ((table.Namespace != table.DataSet.Namespace)) {
                    this.Namespace = table.Namespace;
                }
                this.Prefix = table.Prefix;
                this.MinimumCapacity = table.MinimumCapacity;
                this.DisplayExpression = table.DisplayExpression;
            }
            
            [System.ComponentModel.Browsable(false)]
            public int Count {
                get {
                    return this.Rows.Count;
                }
            }
            
            internal DataColumn AliquotaColumn {
                get {
                    return this.columnAliquota;
                }
            }
            
            internal DataColumn CodigoColumn {
                get {
                    return this.columnCodigo;
                }
            }
            
            internal DataColumn DescontoColumn {
                get {
                    return this.columnDesconto;
                }
            }
            
            internal DataColumn DescricaoColumn {
                get {
                    return this.columnDescricao;
                }
            }
            
            internal DataColumn EstoqueColumn {
                get {
                    return this.columnEstoque;
                }
            }
            
            internal DataColumn ValorColumn {
                get {
                    return this.columnValor;
                }
            }
            
            public ProdutoRow this[int index] {
                get {
                    return ((ProdutoRow)(this.Rows[index]));
                }
            }
            
            public event ProdutoRowChangeEventHandler ProdutoRowChanged;
            
            public event ProdutoRowChangeEventHandler ProdutoRowChanging;
            
            public event ProdutoRowChangeEventHandler ProdutoRowDeleted;
            
            public event ProdutoRowChangeEventHandler ProdutoRowDeleting;
            
            public void AddProdutoRow(ProdutoRow row) {
                this.Rows.Add(row);
            }
            
            public ProdutoRow AddProdutoRow(string Aliquota, string Codigo, bool Desconto, string Descricao, int Estoque, string Valor) {
                ProdutoRow rowProdutoRow = ((ProdutoRow)(this.NewRow()));
                rowProdutoRow.ItemArray = new object[] {
                        Aliquota,
                        Codigo,
                        Desconto,
                        Descricao,
                        Estoque,
                        Valor};
                this.Rows.Add(rowProdutoRow);
                return rowProdutoRow;
            }
            
            public ProdutoRow FindByCodigo(string Codigo) {
                return ((ProdutoRow)(this.Rows.Find(new object[] {
                            Codigo})));
            }
            
            public System.Collections.IEnumerator GetEnumerator() {
                return this.Rows.GetEnumerator();
            }
            
            public override DataTable Clone() {
                ProdutoDataTable cln = ((ProdutoDataTable)(base.Clone()));
                cln.InitVars();
                return cln;
            }
            
            internal void InitVars() {
                this.columnAliquota = this.Columns["Aliquota"];
                this.columnCodigo = this.Columns["Codigo"];
                this.columnDesconto = this.Columns["Desconto"];
                this.columnDescricao = this.Columns["Descricao"];
                this.columnEstoque = this.Columns["Estoque"];
                this.columnValor = this.Columns["Valor"];
            }
            
            private void InitClass() {
                this.columnAliquota = new DataColumn("Aliquota", typeof(string), null, System.Data.MappingType.Element);
                this.Columns.Add(this.columnAliquota);
                this.columnCodigo = new DataColumn("Codigo", typeof(string), null, System.Data.MappingType.Element);
                this.Columns.Add(this.columnCodigo);
                this.columnDesconto = new DataColumn("Desconto", typeof(bool), null, System.Data.MappingType.Element);
                this.Columns.Add(this.columnDesconto);
                this.columnDescricao = new DataColumn("Descricao", typeof(string), null, System.Data.MappingType.Element);
                this.Columns.Add(this.columnDescricao);
                this.columnEstoque = new DataColumn("Estoque", typeof(int), null, System.Data.MappingType.Element);
                this.Columns.Add(this.columnEstoque);
                this.columnValor = new DataColumn("Valor", typeof(string), null, System.Data.MappingType.Element);
                this.Columns.Add(this.columnValor);
                this.Constraints.Add(new UniqueConstraint("Constraint1", new DataColumn[] {
                                this.columnCodigo}, true));
                this.columnCodigo.AllowDBNull = false;
                this.columnCodigo.Unique = true;
            }
            
            public ProdutoRow NewProdutoRow() {
                return ((ProdutoRow)(this.NewRow()));
            }
            
            protected override DataRow NewRowFromBuilder(DataRowBuilder builder) {
                return new ProdutoRow(builder);
            }
            
            protected override System.Type GetRowType() {
                return typeof(ProdutoRow);
            }
            
            protected override void OnRowChanged(DataRowChangeEventArgs e) {
                base.OnRowChanged(e);
                if ((this.ProdutoRowChanged != null)) {
                    this.ProdutoRowChanged(this, new ProdutoRowChangeEvent(((ProdutoRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowChanging(DataRowChangeEventArgs e) {
                base.OnRowChanging(e);
                if ((this.ProdutoRowChanging != null)) {
                    this.ProdutoRowChanging(this, new ProdutoRowChangeEvent(((ProdutoRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowDeleted(DataRowChangeEventArgs e) {
                base.OnRowDeleted(e);
                if ((this.ProdutoRowDeleted != null)) {
                    this.ProdutoRowDeleted(this, new ProdutoRowChangeEvent(((ProdutoRow)(e.Row)), e.Action));
                }
            }
            
            protected override void OnRowDeleting(DataRowChangeEventArgs e) {
                base.OnRowDeleting(e);
                if ((this.ProdutoRowDeleting != null)) {
                    this.ProdutoRowDeleting(this, new ProdutoRowChangeEvent(((ProdutoRow)(e.Row)), e.Action));
                }
            }
            
            public void RemoveProdutoRow(ProdutoRow row) {
                this.Rows.Remove(row);
            }
        }
        
        [System.Diagnostics.DebuggerStepThrough()]
        public class ProdutoRow : DataRow {
            
            private ProdutoDataTable tableProduto;
            
            internal ProdutoRow(DataRowBuilder rb) : 
                    base(rb) {
                this.tableProduto = ((ProdutoDataTable)(this.Table));
            }
            
            public string Aliquota {
                get {
                    try {
                        return ((string)(this[this.tableProduto.AliquotaColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableProduto.AliquotaColumn] = value;
                }
            }
            
            public string Codigo {
                get {
                    return ((string)(this[this.tableProduto.CodigoColumn]));
                }
                set {
                    this[this.tableProduto.CodigoColumn] = value;
                }
            }
            
            public bool Desconto {
                get {
                    try {
                        return ((bool)(this[this.tableProduto.DescontoColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableProduto.DescontoColumn] = value;
                }
            }
            
            public string Descricao {
                get {
                    try {
                        return ((string)(this[this.tableProduto.DescricaoColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableProduto.DescricaoColumn] = value;
                }
            }
            
            public int Estoque {
                get {
                    try {
                        return ((int)(this[this.tableProduto.EstoqueColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableProduto.EstoqueColumn] = value;
                }
            }
            
            public string Valor {
                get {
                    try {
                        return ((string)(this[this.tableProduto.ValorColumn]));
                    }
                    catch (InvalidCastException e) {
                        throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                    }
                }
                set {
                    this[this.tableProduto.ValorColumn] = value;
                }
            }
            
            public bool IsAliquotaNull() {
                return this.IsNull(this.tableProduto.AliquotaColumn);
            }
            
            public void SetAliquotaNull() {
                this[this.tableProduto.AliquotaColumn] = System.Convert.DBNull;
            }
            
            public bool IsDescontoNull() {
                return this.IsNull(this.tableProduto.DescontoColumn);
            }
            
            public void SetDescontoNull() {
                this[this.tableProduto.DescontoColumn] = System.Convert.DBNull;
            }
            
            public bool IsDescricaoNull() {
                return this.IsNull(this.tableProduto.DescricaoColumn);
            }
            
            public void SetDescricaoNull() {
                this[this.tableProduto.DescricaoColumn] = System.Convert.DBNull;
            }
            
            public bool IsEstoqueNull() {
                return this.IsNull(this.tableProduto.EstoqueColumn);
            }
            
            public void SetEstoqueNull() {
                this[this.tableProduto.EstoqueColumn] = System.Convert.DBNull;
            }
            
            public bool IsValorNull() {
                return this.IsNull(this.tableProduto.ValorColumn);
            }
            
            public void SetValorNull() {
                this[this.tableProduto.ValorColumn] = System.Convert.DBNull;
            }
        }
        
        [System.Diagnostics.DebuggerStepThrough()]
        public class ProdutoRowChangeEvent : EventArgs {
            
            private ProdutoRow eventRow;
            
            private DataRowAction eventAction;
            
            public ProdutoRowChangeEvent(ProdutoRow row, DataRowAction action) {
                this.eventRow = row;
                this.eventAction = action;
            }
            
            public ProdutoRow Row {
                get {
                    return this.eventRow;
                }
            }
            
            public DataRowAction Action {
                get {
                    return this.eventAction;
                }
            }
        }
    }
}
