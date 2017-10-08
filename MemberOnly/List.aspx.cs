using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.IO;

public partial class MemberOnly_List : System.Web.UI.Page
{
    protected string GetStatusImage(object obj)
    {
        int status = (int)obj;
        string url = "<img src = '/Images/clip.jpg'>";
        if (status == 0)
            url = "<img src = '/Images/new.gif'>";
        return url;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Page.User.Identity.IsAuthenticated)//(Session["userID"] != null)
            {
                string userID = Page.User.Identity.Name; //Session["userID"].ToString();
                BindMessageList(userID);

                //읽은 메시지에 대해서 status = 1 로 변경
                //연결
                string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                //명령
                string sql = @"update Message set status = 1 where status = 0 and toUser=@toUser";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@toUser", userID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindMessageList(userID);

            }
        }

    }

    private void BindMessageList(string userID)
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select * from Message where toUser=@toUser order by sDate desc";
        SqlDataAdapter adt = new SqlDataAdapter(sql, con);
        adt.SelectCommand.Parameters.AddWithValue("@toUser", userID);

        DataSet ds = new DataSet();
        adt.Fill(ds);

        DataList1.DataSource = ds.Tables[0];
        DataList1.DataBind();

        Label1.Text = ds.Tables[0].Rows.Count + "통의 메시지가 있습니다.";
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string userID = Session["userID"].ToString();

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"Delete Message where toUser=@toUser and status = 1";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@toUser", userID);


        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        BindMessageList(userID);
    }
}