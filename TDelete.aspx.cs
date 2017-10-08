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

public partial class TDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = "Select ref_id,fName from Talk Where seq=" + seq;
        SqlCommand cmd = new SqlCommand(sql, con);

        string fileName = "";
        string refString = "";

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            refString = dr["ref_id"].ToString();
            fileName = dr["fName"].ToString();
        }
        dr.Close();
        con.Close();

        string sql2 = "Select count(*) from Talk Where ref_id=" + refString + "And deleted != 'Y'";
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        con.Open();
        int count = (int)cmd2.ExecuteScalar();
        con.Close();

        if (count == 1)
        {
            string sql3 = "Delete from Talk where ref_id=" + refString;
            SqlCommand cmd3 = new SqlCommand(sql3, con);
            con.Open();
            cmd3.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            string sql4 = "Update Talk set deleted='Y' where seq=" + seq;
            SqlCommand cmd4 = new SqlCommand(sql4, con);
            con.Open();
            cmd4.ExecuteNonQuery();
            con.Close();
        }

        if (fileName != "")
        {
            FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
            myFile.Delete();
        }
        Response.Redirect("/TalkList.aspx");
    }
}