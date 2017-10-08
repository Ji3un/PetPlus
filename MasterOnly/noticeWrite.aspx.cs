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

public partial class noticeWrite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"Insert into notice(userID, title, body, wDate) Values (@userID, @title, @body, getDate());";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@userID", User.Identity.Name);
        cmd.Parameters.AddWithValue("@title",nTextBox1.Text);
        cmd.Parameters.AddWithValue("@body", nTextBox2.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        
        ClearData();

        Response.Redirect("/noticeList.aspx");
    }
    
    private void ClearData()
    {
        nTextBox1.Text = "";
        nTextBox2.Text = "";
    }
}