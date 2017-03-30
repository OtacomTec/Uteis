using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;


namespace ECFCSharpNet
{
	/// <summary>
	/// Summary description for Form3.
	/// </summary>
	public class Form3 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.ListBox ListCodigo;
		private System.Windows.Forms.ListBox ListDescricao;
		private System.Windows.Forms.ListBox ListValor;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Button Carrega_Tabela;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form3()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Carrega_Tabela = new System.Windows.Forms.Button();
			this.ListCodigo = new System.Windows.Forms.ListBox();
			this.ListDescricao = new System.Windows.Forms.ListBox();
			this.ListValor = new System.Windows.Forms.ListBox();
			this.button2 = new System.Windows.Forms.Button();
			this.button3 = new System.Windows.Forms.Button();
			this.button4 = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// Carrega_Tabela
			// 
			this.Carrega_Tabela.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Carrega_Tabela.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(0)), ((System.Byte)(0)), ((System.Byte)(192)));
			this.Carrega_Tabela.Location = new System.Drawing.Point(544, 24);
			this.Carrega_Tabela.Name = "Carrega_Tabela";
			this.Carrega_Tabela.Size = new System.Drawing.Size(120, 48);
			this.Carrega_Tabela.TabIndex = 1;
			this.Carrega_Tabela.Text = "Carregar Tabela ";
			this.Carrega_Tabela.Click += new System.EventHandler(this.button1_Click);
			// 
			// ListCodigo
			// 
			this.ListCodigo.Location = new System.Drawing.Point(8, 32);
			this.ListCodigo.Name = "ListCodigo";
			this.ListCodigo.Size = new System.Drawing.Size(144, 225);
			this.ListCodigo.TabIndex = 2;
			this.ListCodigo.MouseDown += new System.Windows.Forms.MouseEventHandler(this.ListCodigo_MouseDown);
			// 
			// ListDescricao
			// 
			this.ListDescricao.Location = new System.Drawing.Point(152, 32);
			this.ListDescricao.Name = "ListDescricao";
			this.ListDescricao.Size = new System.Drawing.Size(240, 225);
			this.ListDescricao.TabIndex = 3;
			this.ListDescricao.MouseDown += new System.Windows.Forms.MouseEventHandler(this.ListDescricao_MouseDown);
			// 
			// ListValor
			// 
			this.ListValor.Location = new System.Drawing.Point(392, 32);
			this.ListValor.Name = "ListValor";
			this.ListValor.Size = new System.Drawing.Size(128, 225);
			this.ListValor.TabIndex = 4;
			this.ListValor.MouseDown += new System.Windows.Forms.MouseEventHandler(this.ListValor_MouseDown);
			// 
			// button2
			// 
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.button2.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(192)), ((System.Byte)(0)), ((System.Byte)(0)));
			this.button2.Location = new System.Drawing.Point(544, 88);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(120, 48);
			this.button2.TabIndex = 5;
			this.button2.Text = "Eliminar Produto";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// button3
			// 
			this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.button3.Location = new System.Drawing.Point(544, 224);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(120, 32);
			this.button3.TabIndex = 6;
			this.button3.Text = "Sair";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// button4
			// 
			this.button4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.button4.ForeColor = System.Drawing.Color.Lime;
			this.button4.Location = new System.Drawing.Point(544, 152);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(120, 48);
			this.button4.TabIndex = 7;
			this.button4.Text = "Adicionar Produto";
			this.button4.Click += new System.EventHandler(this.button4_Click);
			// 
			// Form3
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(680, 273);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.button4,
																		  this.button3,
																		  this.button2,
																		  this.ListValor,
																		  this.ListDescricao,
																		  this.ListCodigo,
																		  this.Carrega_Tabela});
			this.Name = "Form3";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Formulario de Dados em C#";
			this.Load += new System.EventHandler(this.Form3_Load);
			this.ResumeLayout(false);

		}
		#endregion



		public void button1_Click_1(object sender, System.EventArgs e)
		{	//int i;
			
			//this.BindingContext(dsProduto,"Produto").Position+=1;
			
		}

		private void Form3_Load(object sender, System.EventArgs e)
		{
			/*this.cnnProduto.Open();
			this.dsProduto.EnforceConstraints=false;
			this.daProduto.Fill(this.dsProduto);
			this.dsProduto.EnforceConstraints=true;
			this.cnnProduto.Close();
*/
			


		}

		private void textBox2_TextChanged(object sender, System.EventArgs e)
		{
			
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			ListCodigo.Items.Clear();
			ListDescricao.Items.Clear();
			ListValor.Items.Clear();

			Geral.ECF.myConnection.Open();
			Geral.ECF.myReader = Geral.ECF.myCommand.ExecuteReader();
		
						
			for(;Geral.ECF.myReader.Read();)
			{
				//Codigo = Geral.ECF.myReader["Codigo"].ToString();
				//Tamanho = Codigo.Length;
				
				ListCodigo.Items.Add(Geral.ECF.myReader["Codigo"]);
				ListDescricao.Items.Add(Geral.ECF.myReader["Descricao"]);
				ListValor.Items.Add(Geral.ECF.myReader["Valor"]);				
				
			}

			ListDescricao.Select();
			ListValor.Select();
			ListCodigo.Select();

			Geral.ECF.myReader.Close();
			Geral.ECF.myConnection.Close();
			


		}

		private void ListCodigo_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			
			ListDescricao.SetSelected(ListCodigo.SelectedIndex,true);
			ListValor.SetSelected(ListCodigo.SelectedIndex,true);
			
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			

			Geral.ECF.Deletar_Registro(ListCodigo.GetItemText(ListCodigo.SelectedItem));
		
			
		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			this.DestroyHandle();
		}

		private void button4_Click(object sender, System.EventArgs e)
		{
		  int Produto=0;
		  string descricao="";
		  string codigo="";
	
			for(;Produto<50;Produto++)
			{
				Geral.ECF.Inserir_Registro("1234567891"+Produto,"Produto Numero"+Produto,"100,00","II","1","100");
			}
			/*Geral.ECF.Inserir_Registro("123456789123","Produto Numero 1","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789124","Produto Numero 2","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789125","Produto Numero 3","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789123","Produto Numero 4","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789124","Produto Numero 5","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789125","Produto Numero 6","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789123","Produto Numero 7","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789124","Produto Numero 8","100,00","II","1","100");
			Geral.ECF.Inserir_Registro("123456789125","Produto Numero 9","100,00","II","1","100");
			*/
		}

		private void ListDescricao_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			ListCodigo.SetSelected(ListDescricao.SelectedIndex,true);
			ListValor.SetSelected(ListDescricao.SelectedIndex,true);
		}

		private void ListValor_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			ListCodigo.SetSelected(ListValor.SelectedIndex,true);
			ListDescricao.SetSelected(ListValor.SelectedIndex,true);
		}

		

		

		

		
	}
}
