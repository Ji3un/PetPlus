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

public partial class Weekly_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string seq = Request.QueryString["seq"];
            if (seq == null)
               return;


            //연결
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //명령
            string sql = "update weekly Set hit = hit+1 Where seq = " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);


            //실행
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        rec_btn.ImageUrl = "~/images/b_heart.png";
        
    }
    protected void weeklytxt_form_DataBound(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)weeklytxt_form.FindControl("wedit_btn");
        ImageButton btnn = (ImageButton)weeklytxt_form.FindControl("wdelete_btn");

        Label lbl = (Label)weeklytxt_form.FindControl("userlabel");

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
    }
    protected void wedit_btn_Click(object sender, ImageClickEventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from weekly where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);


        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("w_edit.aspx?seq=" + seq);
        con.Close();
    }
    protected void wdelete_btn_Click(object sender, ImageClickEventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from weekly where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);


        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("w_delete.aspx?seq=" + seq);
        con.Close();
    }
    protected void rec_btn_Click(object sender, ImageClickEventArgs e)
    {
        
            string seq = Request.QueryString["seq"];

            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(conStr);

            string sql = "Update Weekly Set rec = rec + 1 Where seq = @seq";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@seq", seq);  // itemTemplate 에서 지정했음.

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("weekly_detail.aspx?seq=" + seq);
        
    }
}