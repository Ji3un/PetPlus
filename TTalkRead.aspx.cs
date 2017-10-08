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
            string sql = "update TTalk Set hit = hit+1 Where seq = " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);


            //실행
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                reclabel.Text = rd["rec"].ToString();
            }
            rd.Close();
            con.Close();
         }
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
        string sql = @"select * from TTalk where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);

        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("TT_edit.aspx?seq=" + seq);
        con.Close();
    }
    protected void wdelete_btn_Click(object sender, ImageClickEventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from TTalk where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);


        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("TT_delete.aspx?seq=" + seq);
        con.Close();
    }
    protected void rec_btn_Click(object sender, ImageClickEventArgs e)
    {
        
            string seq = Request.QueryString["seq"];

            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(conStr);

            string sql = "Update TTalk Set rec = rec + 1 Where seq = @seq";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@seq", seq);  // itemTemplate 에서 지정했음.

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("TTalkRead.aspx?seq=" + seq);
        
    }
    protected void treply_btn_Click(object sender, ImageClickEventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from TTalk where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", seq);



        //실행
        con.Open();
        cmd.ExecuteReader();
        Response.Redirect("/MemberOnly/TTalkreply.aspx?seq=" + seq);
        con.Close();
    }

    protected string GetContent(object content)
    {// 줄바꿈 문자를 <br/> 태그로 바꿀것이다
        string ss = content.ToString();
        ss = ss.Replace("\n", "<br/>");
        return ss;

    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            LinkButton btn = (LinkButton)e.Item.FindControl("LinkButton1");
            Label lbl = (Label)e.Item.FindControl("Label1");
            string loginUser = Page.User.Identity.Name;

            if (lbl.Text == loginUser)
                btn.Visible = true;
            else
                btn.Visible = false;
        }
    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string ss = e.CommandArgument.ToString();

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = "Delete from Tcomment where seq=@seq";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@seq", ss);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        DataList1.DataBind();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // [저장] 버튼
        string seq = Request.QueryString["seq"];
        string UserID = Page.User.Identity.Name;

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = "insert into Tcomment(tseq,UserID, content) Values (@tseq,@UserID, @content)";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@UserID", UserID);
        cmd.Parameters.AddWithValue("@content", tcomtext.Text);
        cmd.Parameters.AddWithValue("@tseq", seq);

        //실행
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        DataList1.DataBind();
        tcomtext.Text = "";
    }
}

