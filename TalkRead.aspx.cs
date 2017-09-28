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

public partial class TalkRead : System.Web.UI.Page
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
            string sql = "update Talk Set hit = hit+1 Where seq = " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);


            //실행
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            
        }
    }

    protected void phoshow_form_DataBound(object sender, EventArgs e)
    {

        ImageButton btn = (ImageButton)Tshow_form.FindControl("tedit_btn");
        ImageButton btnn = (ImageButton)Tshow_form.FindControl("tdelete_btn");

        Label lbl = (Label)Tshow_form.FindControl("userIDLabel");

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


    protected void Button2_Click(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from Talk where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);



        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("/TalkEdit.aspx?seq=" + seq);
        con.Close();
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from Talk where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);


        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("/TDelete.aspx?seq=" + seq);
        con.Close();
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from Talk where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);



        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("/MemberOnly/Talkreply.aspx?seq=" + seq);
        con.Close();
    }
}