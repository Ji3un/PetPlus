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
        string sql = "select top 1 seq from weekly order by hit desc";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        int a = (int)(cmd.ExecuteScalar());
        con.Close();
        Label2.Text = a.ToString();
        string sql2 = "select fname from pfile where tseq = " + a;
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        con.Open();
        string fname = cmd2.ExecuteScalar().ToString();
        con.Close();
        Image1.ImageUrl = "~/Weekly/" + fname;
        Label2.Text += "," + fname;

        //Image1.ImageUrl = "~/photos/weekly1.png";
        Image2.ImageUrl = "~/photos/week1.jpg";
        Image3.ImageUrl = "~/photos/week2.jpg";
        Image4.ImageUrl = "~/photos/week3.jpg";
        Image5.ImageUrl = "~/photos/week4.jpg";
        Image6.ImageUrl = "~/photos/week5.jpg";
        Image7.ImageUrl = "~/photos/week6.jpg";
        Image8.ImageUrl = "~/photos/week7.jpg";
        Image9.ImageUrl = "~/photos/week8.jpg";
        Image10.ImageUrl = "~/photos/week9.jpg";
        Image11.ImageUrl = "~/photos/week10.jpg";
        Image12.ImageUrl = "~/photos/week11.jpg";
        Image13.ImageUrl = "~/photos/week12.jpg";
        Image14.ImageUrl = "~/photos/week1.jpg";
    }
}