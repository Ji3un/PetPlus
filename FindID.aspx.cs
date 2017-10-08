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
public partial class FindID : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox1.Text = Request.QueryString["UserID"];
            Button6.Visible = false;   // [사용] 버튼은 안보이게 함
            Page.Validate();  // 페이지의 유효성검사 컨트롤을 검사시킴

        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        CheckUserIdExists();
    }

    private void CheckUserIdExists()
    {
        if (IsValid)  // 이 페이지가 유효하면
        {
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(conStr);
            string sql = "Select * from PETMEMBER where UserID = @UserID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);

            conn.Open();
            if (cmd.ExecuteScalar() == null) // select 결과로 넘어오는 첫 번째 필드 값을 받아옴
            {
                Label2.Text = "신청하신 아이디는 사용가능합니다.";
                Button6.Visible = true;
            }
            else
            {
                Label2.Text = "사용 중인 아이디입니다..";
                Button6.Visible = false;
            }
            conn.Close();
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        string str = "<script>" + "opener.document.getElementById('TextBox1').value='" + TextBox1.Text + "';" + "self.close(); </script>";
        Response.Write(str);
    }
}