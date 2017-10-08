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

public partial class Event : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource1";
    }

    //protected void Tab0_Click(object sender, EventArgs e)
    //{
    //    DataList1.DataSourceID = "SqlDataSource1";
    //}
    //protected void Tab1_Click(object sender, EventArgs e)
    //{
    //    DataList1.DataSourceID = "SqlDataSource2";
    //}
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    DataList1.DataSourceID = "SqlDataSource2";
    //}
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    DataList1.DataSourceID = "SqlDataSource1";
    //}
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource1";
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource2";
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource3";
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource4";
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        DataList1.DataSourceID = "SqlDataSource5";
    }
    protected void rec_btnClick(object sender, ImageClickEventArgs e)
    {
        string seq = Request.QueryString["seq"];

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(conStr);

        string sql = "Update Hotdeal Set rec = rec +1 Where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@seq", seq);

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("hot_detail.aspx?seq=" + seq);
    }
}