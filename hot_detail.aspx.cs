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

public partial class Event_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormView1.DataSourceID = "SqlDataSource1";
        if (!IsPostBack)
        {
            string seq = Request.QueryString["seq"]; // 리스트에서 읽어온 글번호
            if (seq == null)
                return;
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //명령
            string sql = @"Update Hotdeal Set hit = hit + 1 Where seq = " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            //실행
            con.Open();
            cmd.ExecuteNonQuery(); // 진짜 실행
            con.Close();

        }
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
    protected void Event_FormView1_DataBound(object sender, EventArgs e)
    {

        ImageButton btn = (ImageButton)Event_FormView1.FindControl("modi_btn");

        Label lbl = (Label)Event_FormView1.FindControl("usrID");

        string loginUser = Page.User.Identity.Name;

        if (lbl.Text == loginUser)
        {
            btn.Visible = true;
            btnn.Visible = true;
        }
        else
        {
            btn.Visible = false;
            btnn.Visible = false;
        }

        string seq = Request.QueryString["seq"];
        if (seq == null)
            return;

        
    }
}