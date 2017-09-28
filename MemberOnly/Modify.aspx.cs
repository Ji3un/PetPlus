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
public partial class Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)  // 반드시 필요함!!
        {
            string id = User.Identity.Name;

            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            string sql = "Select * from PETMEMBER where UserID = @UserID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@UserID", id);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Label2.Text = id;
                pwd_input.Text = rd["Password"].ToString();
                name_input.Text = rd["Name"].ToString();
                Label3.Text = rd["Rnumber"].ToString();
                Label4.Text = rd["gender"].ToString();
                email_input.Text = rd["email"].ToString();
                pnumber_input.Text = rd["Pnumber"].ToString();
            }
            rd.Close();
            con.Close();
        }
    }
    protected void nextb_Click1(object sender, EventArgs e)
    {
        string id = User.Identity.Name;
        string pwd = pwd_input.Text;
        string name = name_input.Text;
        string Pnumber = pnumber_input.Text;
        string email = email_input.Text;
        string animal = RadioButtonList1.SelectedItem.Value;
       

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string sql = @"Update PETMEMBER Set Password=@Password, Name=@Name, Pnumber=@Pnumber , email=@email,animal=@animal  
			where UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@UserID", id);
        cmd.Parameters.AddWithValue("@Name", name);
        cmd.Parameters.AddWithValue("@Password", pwd);
        cmd.Parameters.AddWithValue("@Pnumber", Pnumber);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@animal",animal);

        

        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();

        if (a > 0)
        {
            string str = "<script> alert('정보가 변경되었습니다'); ";
            str += "  location.href='../Home.aspx'; ";
            str += "</script>";
            Response.Write(str);
        }
        else
            Label2.Text = "정보변경에 실패했습니다.";
    }

}
