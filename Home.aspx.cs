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

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            DataList1.DataSourceID = "SqlDataSource1";
            DataList2.DataSourceID = "SqlDataSource7";

            //명령
            string sql = "select top 1 w.seq from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category='질병' order by hit desc";
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            int a = (int)(cmd.ExecuteScalar());
            con.Close();
            string sql2 = "select top 1 fname from pfile where tseq = " + a + " and tname='h'";
            wcon1.HRef = "Weekly_detail.aspx?seq=" + a;

            SqlCommand cmd2 = new SqlCommand(sql2, con);

            con.Open();
            string fname = cmd2.ExecuteScalar().ToString();
            con.Close();
            Image2.ImageUrl = "/Weekly/" + fname;


            string sql3 = "select top 1 w.title from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category='질병' order by hit desc";
            SqlCommand cmd3 = new SqlCommand(sql3, con);

            con.Open();
            string title = cmd3.ExecuteScalar().ToString();
            con.Close();
            Label2.Text += title;
        }
        
    }
    protected void beauty_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void hotel_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void cat_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void extra_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void t24_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void emergency_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void prevention_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void pregnancy_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource2";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource3";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource4";
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource5";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource1";
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        DataList2.DataSourceID = "SqlDataSource7";
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        DataList2.DataSourceID = "SqlDataSource8";
    }
}