using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Data.OleDb;

namespace Geral 
{
	
	
	/*******************************************************************
	 * Classe ECF para Manipular as Funcoes de Comunicacao
	 * para manipular as funcoes de retorno e satatus do ECF
	 * Claudenir C. Andade
	 * 09/02/2002
	********************************************************************/
	public class ECF
	{
	
		/*******************************************************************
		 * Declaracao das DLL da Impressora Fiscal
		 
		********************************************************************/
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_LeituraX();
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_RetornoImpressora(ref int Ack, ref int St1, ref int St2 );
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_Suprimento(System.String Valor, System.String FormPagamento );
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_Sangria(System.String Valor);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_ReducaoZ(System.String Data, System.String Hora);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_AbreCupom( System.String CGC_CPF);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_VendeItem(System.String Codigo, System.String Descricao, System.String Aliquota,
			                                           System.String TipoQuantidade, System.String Quantidade, int CasasDecimais,
													   System.String Vr_Unitario, System.String TipoDesconto, System.String Desconto);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FI_FechaCupomResumido(System.String FormaPagamento, System.String Mensagem);
		
		
		/*Funções para Comunicação com o TEF*/
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_Status(System.String Identificacao);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_VendaCartao(System.String Identificacao, System.String ValorCompra);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_ConfirmaVenda(System.String Identificacao, System.String ValorCompra, System.String Header);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_NaoConfirmaVendaImpressao(System.String Identificacao, System.String ValorCompra);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_CancelaVendaCartao(System.String Identificacao, System.String ValorCompra, System.String NSU, System.String NumeroCupom,
			                                                       System.String Hora, System.String Data, System.String Rede);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_ImprimeTEF(System.String Identificacao, System.String FormaPagamento, System.String ValorCompra);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_ImprimeRelatorio();
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_ADM(System.String Identificacao);
		[DllImport("BemaFi32.dll")]
		public static extern int Bematech_FITEF_VendaCompleta(System.String Identificacao, System.String ValorCompra,
			                                                  System.String FormaPagamento, System.String Mensagem);
    

    
	
		public static int ACK,ST1,ST2;
		public static string Operator;	
		public static string Produto_Consulta;
		
		public static string myConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\ECFNET.MDB";
		public static string mySelectText = "Select * From Produto ORDER BY Codigo";
		public static OleDbDataAdapter custDA = new OleDbDataAdapter(Geral.ECF.mySelectText, Geral.ECF.myConnString);
		public static System.Data.OleDb.OleDbConnection myConnection = new OleDbConnection(Geral.ECF.myConnString);
		public static System.Data.OleDb.OleDbCommand myCommand = new OleDbCommand(mySelectText,Geral.ECF.myConnection);
		public static System.Data.OleDb.OleDbDataReader myReader;
		

		public static void Carregar_Banco_Dados()
		{
			myConnection.Open();
			myReader = myCommand.ExecuteReader();

			MessageBox.Show("ServerVersion: " + myConnection.ServerVersion
				+ "\nDataSource: " + myConnection.DataSource.ToString());

			

			while (myReader.Read()) 
			{
				MessageBox.Show("Codigo:" + myReader["Codigo"]);				
			}
		}
	
		public static int  Consultar_Produto()
		{
			
			string mySql = "Select * FROM Produto WHERE Codigo='"+Produto_Consulta+"'";
			
			OleDbCommand myCommand2 = new OleDbCommand(mySql);
			myCommand2.Connection=Geral.ECF.myConnection;
			myConnection.Close();
			myConnection.Open();
			myCommand2.ExecuteNonQuery();
			
			myReader = myCommand2.ExecuteReader();
			if(myReader.Read())
			    return 1;
			else
				return 0;
		}
		
		public static void Inserir_Registro(string codigo, string descricao, string valor, string aliquota, string desconto, string estoque)
		{
			string myDeleteQuery = "INSERT INTO Produto (Codigo, Descricao,Valor,Aliquota,Desconto,Estoque) Values("+"'" +codigo+ "','"+descricao +"','"+valor+"','"+aliquota+"','"+desconto+"','"+estoque+"')";

			OleDbCommand myCommand2 = new OleDbCommand(myDeleteQuery);
			myCommand2.Connection=Geral.ECF.myConnection;
			myConnection.Close();
			myConnection.Open();
			myCommand2.ExecuteNonQuery();

			//myReader.Close();
			myConnection.Close();
			
			
		}
		
			
		
		public static void Deletar_Registro(System.String Codigo)
		{
			string myDeleteQuery = "DELETE FROM Produto WHERE Codigo='"+Codigo+"'";

			OleDbCommand myCommand2 = new OleDbCommand(myDeleteQuery);
			myCommand2.Connection=Geral.ECF.myConnection;
			myConnection.Close();
			myConnection.Open();
			myCommand2.ExecuteNonQuery();
			//Geral.ECF.myReader = Geral.ECF.myCommand.ExecuteReader();
		
			
			
			/*OleDbCommand myCommand2 = new OleDbCommand(myDeleteQuery);
						myCommand2.Connection = myConnection;
						myConnection.Open();
						myCommand2.ExecuteNonQuery();
						myCommand2.Connection.Close();
*/
			myReader.Close();
			myConnection.Close();
			
			
		}

	
		public static void  Analisa_Retorno_Dll(int RET)
		{
			
			
			if(RET!=1)
			{
				MessageBox.Show("Problemas Ao Enviar o Comando para o ECF",
					"ECF.NET V1.0",MessageBoxButtons.OK);
			}	 
		
		}

	
		public static void Analisa_Retono_ECF()
		{
			ACK=ST1=ST2=0;
			Bematech_FI_RetornoImpressora(ref ACK, ref ST1, ref ST2);
		
			if(ACK!=6)
			{
				MessageBox.Show("Problemas ao Enviar Comando","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);
			}
		
			if  (ST1>=128)
			{MessageBox.Show("FIM E PAPEL - FAVOR TROCAR A BOBINA","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=128;}
			else if(ST1>=64)
			{MessageBox.Show("O PAPEL ESTÁ TERMINANDO - FAVOR VERIFICAR.","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=64;}
			else if(ST1>=32)
			{MessageBox.Show("ERRO NO RELOGIO INTERNO DO ECF - CHAMAR ASSISTENCIA TECNICA!!","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=32;}
			else if(ST1>=16)
			{MessageBox.Show("IMPRESSORA EM ERRO - DESLIGUE E LIGUE O ECF","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=16;}
			else if(ST1>=8)
			{MessageBox.Show("ERRO NO ENVIO DO COMANDO - FAVOR REPETIR A OPERACÃO","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=8;}
			else if(ST1>=4)
			{MessageBox.Show("COMANDO INEXISTENTE - FAVOR ABRIR CHAMADO SUPORTE","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=4;}
			else if(ST1>=2)
			{MessageBox.Show("CUPOM FISCAL ABERTO - CANCELE O CUPOM OU TERMINE A VENDA","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=2;}
			else if (ST1>=1)
			{MessageBox.Show("PARAMETRO INVALIDO - FAVOR ABRIR CHAMADO SUPORTE","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST1-=1;}		
		

			if  (ST2>=128)
			{MessageBox.Show("TIPO DE CMD INVALIDO - FAVOR ABRIR CHAMADO SUPORTE","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=128;}
			else if(ST2>=64)
			{MessageBox.Show("MEMORIA FISCAL CHEIA - CHAMAR ASSISTENCIA TECNICA!!","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=64;}
			else if(ST2>=32)
			{MessageBox.Show("ERRO DE CMOS DO ECF - CHAMAR ASSISTENCIA TECNICA!!","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=32;}
			else if(ST2>=16)
			{MessageBox.Show("ALIQUOTA NAO PROGRAMADA - FAVOR CANCELE O CUPOM E CADASTRE A ALIQUOTA","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=16;}
			else if(ST2>=8)
			{MessageBox.Show("CAPACIDADE ALIQUOTA LOTADA - FAVOR ABRIR CHAMADO SUPORTE","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=8;}
			else if(ST2>=4)
			{MessageBox.Show("CANCELAMENTO NAO PERMITIDO PELO ECF","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=4;}
			else if(ST2>=2)
			{MessageBox.Show("CGC/IE NAO PROGRAMDOS  - CHAMAR ASSISTENCIA TECNICA!!","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=2;}
			else if(ST2>=1)
			{MessageBox.Show("COMANDO NAO EXECUTADO - VERIFIQUE O STATUS DA IMPRESSORA","ECF.NET V1.0",MessageBoxButtons.OK,MessageBoxIcon.Error);ST2-=1;}

		}

	}
}