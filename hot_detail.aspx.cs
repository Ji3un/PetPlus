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

public partial class Event_detail : System.Web.UI.Page
{
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!IsPostBack)
    //    {
    //        string imgID = Request.QueryString["seq"]; // 리스트에서 읽어온 글번호
    //        //연결
    //        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
    //        SqlConnection con = new SqlConnection(conStr);

    //        //명령
    //        string sql = @"Update Hotdeal Set hit = hit + 1 Where seq = " + seq;
    //        SqlCommand cmd = new SqlCommand(sql, con);

    //        //실행
    //        con.Open();
    //        cmd.ExecuteNonQuery(); // 진짜 실행
    //        con.Close();
    //    }
    //   }
}