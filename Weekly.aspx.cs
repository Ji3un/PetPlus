using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.Security;


public partial class Weekly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

 
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = "select top 1 w.seq from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) order by hit desc;";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        int a = (int)(cmd.ExecuteScalar());
        con.Close();
        Label2.Text = a.ToString();
        string sql2 = "select fname from pfile where tseq = " + a +",tname= 'H'";
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        con.Open();
        string fname = cmd2.ExecuteScalar().ToString();
        con.Close();
        Image1.ImageUrl = "~/Weekly/" + fname;
        Label2.Text += "," + fname;

        //Image1.ImageUrl = "~/photos/weekly1.png";
    }
}