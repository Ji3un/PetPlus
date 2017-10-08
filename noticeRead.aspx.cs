using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.IO;

public partial class noticeRead : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string seq = Request.QueryString["seq"];
            if (seq == null)
                return;

            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //조회수 증가
            string sql = "update notice set hit = hit + 1 where seq= " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void nImageButton3_Click1(object sender, ImageClickEventArgs e)
    {
        //삭제
        string seq = Request.QueryString["seq"];

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"select * from notice where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);

        con.Open();
        cmd.ExecuteReader();
        con.Close();

        Response.Redirect("/noticeDelete.aspx?seq=" + seq);
    }

    protected void nImageButton4_Click1(object sender, ImageClickEventArgs e)
    {
        //수정
        string seq = Request.QueryString["seq"];

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"select * from notice where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);

        con.Open();
        cmd.ExecuteReader();
        con.Close();

        Response.Redirect("/MasterOnly/noticeEdit.aspx?seq=" + seq);
    }

    protected void notice_read_FV_DataBound(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];
        if (seq == null)
            return;
    }
}