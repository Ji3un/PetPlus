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
public partial class w_delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        //첨부파일이 있으면 같이 삭제하려고 파일명 읽어오기
        string sql = "select seq,fName from pfile where tseq=" + seq;
        SqlDataAdapter adt = new SqlDataAdapter(sql, con);
        SqlCommand cmd = adt.SelectCommand;

        DataSet ds = new DataSet();
        adt.Fill(ds);

        //해당 글 레코드 삭제

        string sql2 = @"delete from TTalk where seq=" + seq;
        SqlCommand cmd2 = new SqlCommand(sql2, con);


        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        //해당 파일도 삭제

        DataTable dt = ds.Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            String fName = dt.Rows[i]["fname"].ToString();
            int num = (int)dt.Rows[i]["seq"];
            if (fName != null)
            {
                FileInfo myFile = new FileInfo(Server.MapPath("~/Talk/") + fName); //파일전체경로
                myFile.Delete();

            }

            //레코드삭제
            pfileDelete(num);
        }


        Response.Redirect("/TTalkList.aspx");
    }

    private void pfileDelete(int num)
    {
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = "delete from pfile where seq = " + num;
        SqlCommand cmd = new SqlCommand(sql, con);


        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}