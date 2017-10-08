using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.IO;


public partial class Community : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userID"] = Page.User.Identity.Name;
        Label1.Text = "안녕하세요. <b>" + Session["userID"].ToString() + "</b> 님.";

        CheckMessage();
    }

    private void CheckMessage()
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select count(*) from Message where toUser=@toUser and status = 0";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@toUser", Page.User.Identity.Name);

        //실행
        con.Open();
        int count = (int)cmd.ExecuteScalar(); //첫번째 필드값 하나만 읽어옴
        con.Close();

        if (count > 0)
            Label2.Text = count + "통의 새 메시지가 도착했습니다.";
        else
            Label2.Text = "새로 도착한 메시지가 없습니다.";
    }
}