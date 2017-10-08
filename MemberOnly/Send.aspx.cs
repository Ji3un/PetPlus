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
        if (Request.QueryString["userID"] != null)
            TextBox2.Text = Request.QueryString["userID"];
        if (Page.User.Identity.IsAuthenticated)
            TextBox1.Text = Page.User.Identity.Name;
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"insert into Message(fromUser, toUser, content) values(@fromUser,@toUser,@content)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@fromUser", TextBox1.Text);
        cmd.Parameters.AddWithValue("@toUser", TextBox2.Text);
        cmd.Parameters.AddWithValue("@content", TextBox3.Text);

        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();

        if (count != 0)
            Label1.Text = "메시지를 보냈습니다.";
        else
            Label1.Text = "메시지를 보내는데 실패했습니다.";
    }
}