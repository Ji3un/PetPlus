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


public partial class join2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void overlap_Click(object sender, EventArgs e)
    {
        string str = "<script> window.open('FindID.aspx?UserID=" + TextBox1.Text + "' , 'myWindow' , 'top=200, left=200, width=400, height=200' )</script>";
        Response.Write(str);
    }
    protected void nextb_Click1(object sender, EventArgs e)
    {
        if (IsMemberExists())
            Label1.Text = "이미 사용 중인 아이디입니다<br>다른 아이디를 사용해주세요";
        else
            AddMember();
    }

    private bool IsMemberExists()
    {
        bool result = false;


        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = "select * from PETMEMBER where UserID=@UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
            result = true;
        else
            result = false;
        rd.Close();
        con.Close();
        return result;
    }

    private void AddMember()
    {
        string conStr = ConfigurationManager.ConnectionStrings["mydb"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"insert into PETMEMBER(UserID,Password,Name,Pnumber,Rnumber,gender,email,smsagree,emailagree,animal) values(@UserID,@Password,@Name,@Pnumber,@Rnumber,@gender,@email,@smsagree,@emailagree,@animal)";
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;
        cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Password", pwd_input.Text);
        cmd.Parameters.AddWithValue("@Name", name_input.Text);
        cmd.Parameters.AddWithValue("@Pnumber", phon_select.SelectedValue + pnumber_input.Text);
        cmd.Parameters.AddWithValue("@Rnumber", rnumber_input.Text);
        cmd.Parameters.AddWithValue("@gender", gender_input.Text);
        cmd.Parameters.AddWithValue("@email", email_input.Text + "@" + email_select.SelectedValue);
        cmd.Parameters.AddWithValue("@smsagree", CheckBox1.Checked);
        cmd.Parameters.AddWithValue("@emailagree", CheckBox2.Checked);
        cmd.Parameters.AddWithValue("@animal", RadioButtonList1.SelectedValue);




        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();

        if (a > 0)
        {


            string str = "<script> alert('회원에 가입되셨습니다');";
            str += "  location.href='join3.aspx';";   // Home.asxp 페이지로 이동함
            str += "</script>";
            Response.Write(str);
        }
    }
}