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

public partial class Album_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        //첨부파일이 있으면 같이 삭제하려고 파일명 읽어오기
        string sql = "select fName from petphoto where seq=" + seq;
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        string fName = cmd.ExecuteScalar().ToString();
        con.Close();

        //해당 글 레코드 삭제

        string sql2 = @"delete from petphoto where seq=" + seq;
        SqlCommand cmd2 = new SqlCommand(sql2, con);


        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        //해당 파일도 삭제
        if (fName != null)
        {
            FileInfo myFile = new FileInfo(Server.MapPath("~/photos/") + fName); //파일전체경로
            myFile.Delete();

        }

        Response.Redirect("/plist.aspx");
    }
}