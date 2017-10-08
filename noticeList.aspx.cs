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


public partial class noticeList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView21.DataBind();

            //Label 게시글 총 수?
            string sql = "SELECT count(*) FROM notice where seq=@seq";
            SqlCommand cmd = new SqlCommand(sql);

            cmd.Parameters.AddWithValue("@seq", Label1.Text);
        }
        
    }

    protected string ShowTitle(string seq, string title, string deleted)
    {
        string result = "";
        if (deleted == "N")
        {
            result += "<a href='noticeRead.aspx?seq=" + seq + "'>" + title + "</a>";
        }
        else
        {
            result += "삭제된 게시물 입니다.";
        }
        return result;
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        //글쓰기버튼 마스터만 보이기?
        string master = Page.User.Identity.Name;

        ImageButton btn = (ImageButton)FindControl("~/Images/write_bun.png");
        Label lbl = (Label)FindControl("userIDLabel");

        if (lbl.Text == master)
        {
            btn.Visible = true;
        }
        else
        {
            btn.Visible = false;
        }
    }
}