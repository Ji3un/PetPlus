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
using System.Web.Security;

public partial class Search_Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";

        string title = Request.QueryString["title"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select* from Talk where title like '%' + @title + '%'";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@title", title);

        Label1.Text = title + "(을)를 포함한 검색결과입니다.";
        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;
        //실행
        DataSet ds = new DataSet();
        ad.Fill(ds); // 진짜 실행
        GridView1.DataSource = ds;
        GridView1.DataBind();

        if (ds.Tables[0].Rows.Count == 0)
        {
            Label1.Text = "검색결과가 없습니다.";
        }
    }
}