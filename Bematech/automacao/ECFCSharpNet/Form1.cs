


namespace ECFCSharpNet
{
	using System;
	using System.Drawing;
	using System.Collections;
	using System.ComponentModel;
	using System.Windows.Forms;
	using System.Data;
	using System.Reflection.Emit;
	using System.Runtime.InteropServices;
	using System.Data.OleDb;
	using System.Data.SqlClient;

	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		/// <summary>
		/// Required designer variable.
		public int RET;
		public string Operator;		
		
		private System.Timers.Timer timer1;
		public System.Windows.Forms.Label MsgBar;
		private System.Windows.Forms.Button LeituraX;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button Operador;
		private System.Windows.Forms.Button Banco_Dados;
		private System.Windows.Forms.Button Sangria;
		private System.Windows.Forms.Button Suprimento;
		private System.Windows.Forms.Button Reducao;
		private System.Windows.Forms.Button Consultar;
		private System.Windows.Forms.Button Sair;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.MenuItem menuItem5;
		private System.Windows.Forms.MenuItem menuItem6;
		private System.Windows.Forms.MenuItem menuItem7;
		private System.Windows.Forms.MenuItem menuItem8;
		private System.Windows.Forms.MenuItem menuItem9;
		private System.Windows.Forms.MenuItem Leitura;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label CaixaLivre;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.Label MsgCupom;
		private System.Windows.Forms.RichTextBox CopiaCupom;
		private System.Windows.Forms.TextBox Codigo_Produto;
		private System.Windows.Forms.MenuItem menuItem10;
		private System.Windows.Forms.MenuItem menuItem11;
		
		/// 
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
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
				if (components != null) 
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
			this.LeituraX = new System.Windows.Forms.Button();
			this.timer1 = new System.Timers.Timer();
			this.MsgBar = new System.Windows.Forms.Label();
			this.Operador = new System.Windows.Forms.Button();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.Leitura = new System.Windows.Forms.MenuItem();
			this.menuItem3 = new System.Windows.Forms.MenuItem();
			this.menuItem4 = new System.Windows.Forms.MenuItem();
			this.menuItem5 = new System.Windows.Forms.MenuItem();
			this.menuItem6 = new System.Windows.Forms.MenuItem();
			this.menuItem7 = new System.Windows.Forms.MenuItem();
			this.menuItem8 = new System.Windows.Forms.MenuItem();
			this.menuItem9 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.menuItem10 = new System.Windows.Forms.MenuItem();
			this.Banco_Dados = new System.Windows.Forms.Button();
			this.button3 = new System.Windows.Forms.Button();
			this.Sangria = new System.Windows.Forms.Button();
			this.Suprimento = new System.Windows.Forms.Button();
			this.Reducao = new System.Windows.Forms.Button();
			this.Consultar = new System.Windows.Forms.Button();
			this.Sair = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.Codigo_Produto = new System.Windows.Forms.TextBox();
			this.MsgCupom = new System.Windows.Forms.Label();
			this.CaixaLivre = new System.Windows.Forms.Label();
			this.CopiaCupom = new System.Windows.Forms.RichTextBox();
			this.menuItem11 = new System.Windows.Forms.MenuItem();
			((System.ComponentModel.ISupportInitialize)(this.timer1)).BeginInit();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// LeituraX
			// 
			this.LeituraX.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.LeituraX.ForeColor = System.Drawing.Color.Blue;
			this.LeituraX.Location = new System.Drawing.Point(8, 8);
			this.LeituraX.Name = "LeituraX";
			this.LeituraX.Size = new System.Drawing.Size(112, 48);
			this.LeituraX.TabIndex = 0;
			this.LeituraX.Text = "LeituraX         F5";
			this.LeituraX.Click += new System.EventHandler(this.button1_Click);
			// 
			// timer1
			// 
			this.timer1.Enabled = true;
			this.timer1.Interval = 1000;
			this.timer1.SynchronizingObject = this;
			this.timer1.Elapsed += new System.Timers.ElapsedEventHandler(this.timer1_Elapsed);
			// 
			// MsgBar
			// 
			this.MsgBar.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.MsgBar.ForeColor = System.Drawing.Color.Blue;
			this.MsgBar.Location = new System.Drawing.Point(0, 262);
			this.MsgBar.Name = "MsgBar";
			this.MsgBar.Size = new System.Drawing.Size(584, 24);
			this.MsgBar.TabIndex = 1;
			this.MsgBar.Text = "label1";
			this.MsgBar.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// Operador
			// 
			this.Operador.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Operador.ForeColor = System.Drawing.Color.Green;
			this.Operador.Location = new System.Drawing.Point(456, 8);
			this.Operador.Name = "Operador";
			this.Operador.Size = new System.Drawing.Size(112, 48);
			this.Operador.TabIndex = 2;
			this.Operador.Text = "Operador              F1";
			this.Operador.Click += new System.EventHandler(this.button2_Click_1);
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.menuItem1,
																					  this.menuItem11});
			// 
			// menuItem1
			// 
			this.menuItem1.Index = 0;
			this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					  this.Leitura,
																					  this.menuItem3,
																					  this.menuItem4,
																					  this.menuItem5,
																					  this.menuItem6,
																					  this.menuItem7,
																					  this.menuItem8,
																					  this.menuItem9,
																					  this.menuItem2,
																					  this.menuItem10});
			this.menuItem1.Text = "";
			// 
			// Leitura
			// 
			this.Leitura.Index = 0;
			this.Leitura.Shortcut = System.Windows.Forms.Shortcut.F5;
			this.Leitura.Text = "LeituraX";
			this.Leitura.Click += new System.EventHandler(this.menuItem2_Click);
			// 
			// menuItem3
			// 
			this.menuItem3.Index = 1;
			this.menuItem3.Shortcut = System.Windows.Forms.Shortcut.F6;
			this.menuItem3.Text = "Sangria";
			this.menuItem3.Click += new System.EventHandler(this.menuItem3_Click);
			// 
			// menuItem4
			// 
			this.menuItem4.Index = 2;
			this.menuItem4.Shortcut = System.Windows.Forms.Shortcut.F7;
			this.menuItem4.Text = "Suprimento";
			this.menuItem4.Click += new System.EventHandler(this.menuItem4_Click);
			// 
			// menuItem5
			// 
			this.menuItem5.Index = 3;
			this.menuItem5.Shortcut = System.Windows.Forms.Shortcut.F8;
			this.menuItem5.Text = "ReducaoZ";
			this.menuItem5.Click += new System.EventHandler(this.menuItem5_Click);
			// 
			// menuItem6
			// 
			this.menuItem6.Index = 4;
			this.menuItem6.Shortcut = System.Windows.Forms.Shortcut.F1;
			this.menuItem6.Text = "Operador";
			this.menuItem6.Click += new System.EventHandler(this.menuItem6_Click);
			// 
			// menuItem7
			// 
			this.menuItem7.Index = 5;
			this.menuItem7.Shortcut = System.Windows.Forms.Shortcut.F2;
			this.menuItem7.Text = "Produto";
			this.menuItem7.Click += new System.EventHandler(this.menuItem7_Click);
			// 
			// menuItem8
			// 
			this.menuItem8.Index = 6;
			this.menuItem8.Shortcut = System.Windows.Forms.Shortcut.F3;
			this.menuItem8.Text = "Banco_Dados";
			this.menuItem8.Click += new System.EventHandler(this.menuItem8_Click);
			// 
			// menuItem9
			// 
			this.menuItem9.Index = 7;
			this.menuItem9.Shortcut = System.Windows.Forms.Shortcut.F4;
			this.menuItem9.Text = "Sair";
			this.menuItem9.Click += new System.EventHandler(this.menuItem9_Click);
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 8;
			this.menuItem2.Shortcut = System.Windows.Forms.Shortcut.F9;
			this.menuItem2.Text = "CupomFiscal";
			this.menuItem2.Click += new System.EventHandler(this.menuItem2_Click_1);
			// 
			// menuItem10
			// 
			this.menuItem10.Index = 9;
			this.menuItem10.Shortcut = System.Windows.Forms.Shortcut.F10;
			this.menuItem10.Text = "FechaCupom";
			this.menuItem10.Click += new System.EventHandler(this.menuItem10_Click);
			// 
			// Banco_Dados
			// 
			this.Banco_Dados.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Banco_Dados.ForeColor = System.Drawing.Color.Red;
			this.Banco_Dados.Location = new System.Drawing.Point(456, 120);
			this.Banco_Dados.Name = "Banco_Dados";
			this.Banco_Dados.Size = new System.Drawing.Size(112, 48);
			this.Banco_Dados.TabIndex = 3;
			this.Banco_Dados.Text = "Banco de Dados  F3";
			this.Banco_Dados.Click += new System.EventHandler(this.button1_Click_1);
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(200, 296);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(136, 40);
			this.button3.TabIndex = 4;
			this.button3.Text = "button3";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// Sangria
			// 
			this.Sangria.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Sangria.ForeColor = System.Drawing.Color.Blue;
			this.Sangria.Location = new System.Drawing.Point(8, 64);
			this.Sangria.Name = "Sangria";
			this.Sangria.Size = new System.Drawing.Size(112, 48);
			this.Sangria.TabIndex = 5;
			this.Sangria.Text = "Sangria         F6";
			// 
			// Suprimento
			// 
			this.Suprimento.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Suprimento.ForeColor = System.Drawing.Color.Blue;
			this.Suprimento.Location = new System.Drawing.Point(8, 120);
			this.Suprimento.Name = "Suprimento";
			this.Suprimento.Size = new System.Drawing.Size(112, 48);
			this.Suprimento.TabIndex = 6;
			this.Suprimento.Text = "Suprimento    F7";
			// 
			// Reducao
			// 
			this.Reducao.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Reducao.ForeColor = System.Drawing.Color.Blue;
			this.Reducao.Location = new System.Drawing.Point(8, 176);
			this.Reducao.Name = "Reducao";
			this.Reducao.Size = new System.Drawing.Size(112, 48);
			this.Reducao.TabIndex = 7;
			this.Reducao.Text = "Redução Z         F8";
			// 
			// Consultar
			// 
			this.Consultar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Consultar.ForeColor = System.Drawing.Color.Red;
			this.Consultar.Location = new System.Drawing.Point(456, 64);
			this.Consultar.Name = "Consultar";
			this.Consultar.Size = new System.Drawing.Size(112, 48);
			this.Consultar.TabIndex = 8;
			this.Consultar.Text = "Consultar Produto   F2";
			// 
			// Sair
			// 
			this.Sair.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.Sair.ForeColor = System.Drawing.Color.Blue;
			this.Sair.Location = new System.Drawing.Point(456, 176);
			this.Sair.Name = "Sair";
			this.Sair.Size = new System.Drawing.Size(112, 48);
			this.Sair.TabIndex = 9;
			this.Sair.Text = "Sair               F4";
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.Codigo_Produto,
																					this.MsgCupom,
																					this.CaixaLivre,
																					this.CopiaCupom});
			this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.groupBox1.ForeColor = System.Drawing.Color.FromArgb(((System.Byte)(0)), ((System.Byte)(0)), ((System.Byte)(192)));
			this.groupBox1.Location = new System.Drawing.Point(128, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(320, 224);
			this.groupBox1.TabIndex = 10;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "ECF.NET ";
			// 
			// Codigo_Produto
			// 
			this.Codigo_Produto.Location = new System.Drawing.Point(8, 176);
			this.Codigo_Produto.Name = "Codigo_Produto";
			this.Codigo_Produto.Size = new System.Drawing.Size(304, 20);
			this.Codigo_Produto.TabIndex = 3;
			this.Codigo_Produto.Text = "";
			this.Codigo_Produto.Visible = false;
			this.Codigo_Produto.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Codigo_Produto_KeyPress);
			this.Codigo_Produto.TextChanged += new System.EventHandler(this.Codigo_Produto_TextChanged);
			// 
			// MsgCupom
			// 
			this.MsgCupom.ImageAlign = System.Drawing.ContentAlignment.TopRight;
			this.MsgCupom.Location = new System.Drawing.Point(58, 201);
			this.MsgCupom.Name = "MsgCupom";
			this.MsgCupom.Size = new System.Drawing.Size(184, 12);
			this.MsgCupom.TabIndex = 1;
			this.MsgCupom.Text = "Para Iniciar Venda Pressione F9";
			// 
			// CaixaLivre
			// 
			this.CaixaLivre.Font = new System.Drawing.Font("Microsoft Sans Serif", 40F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.CaixaLivre.Location = new System.Drawing.Point(16, 48);
			this.CaixaLivre.Name = "CaixaLivre";
			this.CaixaLivre.Size = new System.Drawing.Size(296, 120);
			this.CaixaLivre.TabIndex = 0;
			this.CaixaLivre.Text = "Caixa Livre";
			this.CaixaLivre.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// CopiaCupom
			// 
			this.CopiaCupom.Location = new System.Drawing.Point(8, 24);
			this.CopiaCupom.Name = "CopiaCupom";
			this.CopiaCupom.Size = new System.Drawing.Size(304, 144);
			this.CopiaCupom.TabIndex = 2;
			this.CopiaCupom.Text = "";
			this.CopiaCupom.Visible = false;
			// 
			// menuItem11
			// 
			this.menuItem11.Index = 1;
			this.menuItem11.Text = "";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(592, 291);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.groupBox1,
																		  this.Sair,
																		  this.Consultar,
																		  this.Reducao,
																		  this.Suprimento,
																		  this.Sangria,
																		  this.button3,
																		  this.Banco_Dados,
																		  this.Operador,
																		  this.MsgBar,
																		  this.LeituraX});
			this.Menu = this.mainMenu1;
			this.Name = "Form1";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "Form1";
			this.Load += new System.EventHandler(this.Form1_Load);
			((System.ComponentModel.ISupportInitialize)(this.timer1)).EndInit();
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		public void button1_Click(object sender, System.EventArgs e)
		{	
			
			RET = Geral.ECF.Bematech_FI_LeituraX();
			Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
			
		}

		private void timer1_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
		{
			MsgBar.Text="ECF.NET V1.0 - " + DateTime.Now + "   Operador : " +Geral.ECF.Operator;
		}

		

		public void button2_Click(object sender, System.EventArgs e)
		{
		
			
						
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{

			RET = Geral.ECF.Bematech_FITEF_Status("1");
			
			if (RET!=1) 
				MessageBox.Show("TEF Inativo, Nao será Possivel Realizar Operações com Cartão","ECF.NET 1,0",MessageBoxButtons.OK);
			else
				MessageBox.Show("TEF Ativo!!","ECF.NET V1,0",MessageBoxButtons.OK);			

		}

		public void button2_Click_1(object sender, System.EventArgs e)
		{
			Form2 Janela = new Form2();
			
			Janela.Show();
			
		}

		private void button1_Click_1(object sender, System.EventArgs e)
		{
			Form3 BD = new Form3();
			
			BD.Show();
			//Geral.ECF.Carregar_Banco_Dados();
			

		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			//nwindConn = new OleDbConnection();
			int i;
			string myConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\ECFNET.MDB";
			string mySelectText = "Select * From Produto WHERE Codigo ='12345678915'";
			string myInsertQuery = "INSERT INTO Produto (Codigo, Descricao) Values('1111111111111', 'Northwind Traders')";
			string myDeleteQuery = "DELETE FROM Produto WHERE Codigo='"+"1234567890123"+"'";
			
			OleDbDataReader myReader;
			
			OleDbDataAdapter custDA = new OleDbDataAdapter(mySelectText, myConnString);

			OleDbConnection myConnection = new OleDbConnection(myConnString);
			OleDbCommand myCommand = new OleDbCommand(mySelectText,myConnection);

			myConnection.Open();
			
			//Adicionar ao Banco de Dados
			/*OleDbCommand myCommand2 = new OleDbCommand(myInsertQuery);
			myCommand2.Connection = myConnection;
			myConnection.Open();
			myCommand2.ExecuteNonQuery();
			myCommand2.Connection.Close();
			*/

			//Deletar do BD	
			/*OleDbCommand myCommand2 = new OleDbCommand(myDeleteQuery);
			myCommand2.Connection = myConnection;
			myConnection.Open();
			myCommand2.ExecuteNonQuery();
			myCommand2.Connection.Close();
			*/

		
					
			myReader = myCommand.ExecuteReader();

			MessageBox.Show("ServerVersion: " + myConnection.ServerVersion
				+ "\nDataSource: " + myConnection.DataSource.ToString());

			

			while (myReader.Read()) 
			{
				MessageBox.Show("Codigo:" + myReader["Codigo"]);				
			}
		
			
			myReader.Close();
			myReader = myCommand.ExecuteReader();
		
			while (myReader.Read()) 
			{
				MessageBox.Show("Codigo:" + myReader["Descricao"]);				
			}
		
			
			

			//OleDbDataAdapter custDA = new OleDbDataAdapter(mySelectText, myConnString);

			
			
			
			myConnection.Close();

			
		}

		

		private void menuItem2_Click(object sender, System.EventArgs e)
		{
			RET = Geral.ECF.Bematech_FI_LeituraX();
			Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
		}

		private void menuItem3_Click(object sender, System.EventArgs e)
		{
			RET = Geral.ECF.Bematech_FI_Sangria("10,00");
			Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
		}

		private void menuItem4_Click(object sender, System.EventArgs e)
		{
			RET = Geral.ECF.Bematech_FI_Suprimento("10,00","Dinheiro");
			Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
		}

		private void menuItem5_Click(object sender, System.EventArgs e)
		{
			RET = Geral.ECF.Bematech_FI_ReducaoZ("","");
			Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
		}

		private void menuItem8_Click(object sender, System.EventArgs e)
		{
			Form3 BD = new Form3();
			BD.Show();
		}

		private void menuItem9_Click(object sender, System.EventArgs e)
		{
			this.DestroyHandle();
		}

		private void menuItem6_Click(object sender, System.EventArgs e)
		{
			Form2 Janela = new Form2();
			
			Janela.Text= "Operador";
			Janela.Show();
			
		}

		private void menuItem7_Click(object sender, System.EventArgs e)
		{
			Form2 Janela = new Form2();
			
			Janela.Text= "Consulta";
			//.ShowDialog a Janela é Modal
			Janela.ShowDialog();
			RET = Geral.ECF.Consultar_Produto();
			if(RET==0)
			  MessageBox.Show("Produto Nao Encontrado","ECF.NET V1,0");
			else
			  MessageBox.Show("Codigo:  "+ Geral.ECF.myReader["Codigo"].ToString() + "\r\n" +
							  "Produto:  "+Geral.ECF.myReader["Descricao"].ToString() + "\r\n" +
				  			  "Valor:   "+Geral.ECF.myReader["Valor"].ToString(),  
				               "ECF.NET Consulta Produto");

				
			Geral.ECF.myConnection.Close();
		}

		private void menuItem2_Click_1(object sender, System.EventArgs e)
		{
			this.CaixaLivre.Visible=false;
			this.MsgCupom.Text="Para Encerrar Pressione F10";
			this.Codigo_Produto.Visible=true;
			this.CopiaCupom.Visible=true;
			this.Codigo_Produto.Text="";
			this.CopiaCupom.Text="";
			this.Codigo_Produto.Focus();


		}

		private void Codigo_Produto_KeyPress(object sender, System.Windows.Forms.KeyPressEventArgs e)
		{
			if (e.KeyChar==(char)13)
			{
				Geral.ECF.Produto_Consulta=this.Codigo_Produto.Text;
				RET = Geral.ECF.Consultar_Produto();
				if(RET==0)
					MessageBox.Show("Produto Nao Existe");
				else
				{
					if(this.CopiaCupom.Text=="")
					{ RET = Geral.ECF.Bematech_FI_AbreCupom("");
					  Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
					 this.CopiaCupom.Text="Empresa .NET" + "\r\n" + "           C  U  P  O  M      F  I  S  C  A  L" + "\r\n\r\n" +
						                  "Codigo            Descricao                   Valor"+ "\r\n" +
										  "=========================================";

					}
					RET = Geral.ECF.Bematech_FI_VendeItem(Geral.ECF.myReader["Codigo"].ToString(),
													Geral.ECF.myReader["Descricao"].ToString(),
													Geral.ECF.myReader["Aliquota"].ToString(),
													"I","1",2,
													Geral.ECF.myReader["Valor"].ToString(),
													"%","0");
					

					Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
				
					this.CopiaCupom.Text+=Geral.ECF.myReader["Codigo"].ToString() 
										  +"   " + Geral.ECF.myReader["Descricao"].ToString()
								 		  +"   " + Geral.ECF.myReader["Aliquota"].ToString()
										  +"   " + Geral.ECF.myReader["Valor"].ToString()+"\r\n";
												
				}
			}
		}

		private void menuItem10_Click(object sender, System.EventArgs e)
		{
			this.CaixaLivre.Visible=true;
			this.MsgCupom.Text="Para Iniciar Venda Pressione F9";
			this.Codigo_Produto.Visible=false;
			this.CopiaCupom.Visible=false;
					
			//RET = Geral.ECF.Bematech_FI_FechaCupomResumido("Dinheiro","Obrigado Volte Sempre!!");
			RET = Geral.ECF.Bematech_FITEF_VendaCompleta("1","10000","Cartão","Obrigado Volte Sempre");
			Geral.ECF.Analisa_Retorno_Dll(RET);Geral.ECF.Analisa_Retono_ECF();
			
		}

		private void Codigo_Produto_TextChanged(object sender, System.EventArgs e)
		{
		
		}



		

		

	

		

		
	}
}
