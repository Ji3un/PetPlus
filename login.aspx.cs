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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
            Response.Redirect(FormsAuthentication.DefaultUrl); 
    }
    protected void lbtn_Click(object sender, EventArgs e)
    {
        if (IsAuthenticated(UserID.Text, Password.Text)) // 인증된 사용자이면
        {
            // 실제 로그인 실행: (1)인증 쿠기 생성 + (2)요청한 페이지로 이동
            FormsAuthentication.RedirectFromLoginPage(UserID.Text, idsave.Checked);
        }
    }

    private bool IsAuthenticated(string userID, string password)
    {
        bool result = false; // 초기값: 인증안 된 사용자인 걸로
        
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = "Select * from PETMEMBER where UserID = @UserID and  Password = @Password";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);
        cmd.Parameters.AddWithValue("@Password", password);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
            result = true;
        else
            result = false; // 생략 가능 (초기값으로 이미 설정)
        rd.Close();
        con.Close();
        return result; // 참 또는 거짓을 리턴
    }
    
}