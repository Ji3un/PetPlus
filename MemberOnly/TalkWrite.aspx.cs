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

public partial class MemberOnly_TalkWrite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void pnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        //(1) 글을 board 테이블에 insert
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"insert into Talk(userID,title,body,ref_id,inner_id,depth,tDate,fName,fSize)
                                    Values(@userID,@title,@body,0,0,0,getDate(),@fName,@fSize)";
        SqlCommand cmd = new SqlCommand(sql, con);

        string fileName = "";
        int fileSize = 0;

        if(FileUpload1.HasFile)
        {
            fileName = FileUpload1.FileName; //파일의 이름만
            FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
            if(myFile.Exists)
            {
                myFile = NewFileName(myFile);
                fileName = myFile.Name;
            }
            FileUpload1.SaveAs(myFile.FullName);
            fileSize = FileUpload1.PostedFile.ContentLength;
        }
        cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@body", twirte_textbox.Text);
        cmd.Parameters.AddWithValue("@fName", fileName);
        cmd.Parameters.AddWithValue("@fSize", fileSize);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

     //(2) ref_id를 자동생성된 글번호 seq로 update
        string sql2 = @"Update Talk Set ref_id=seq Where ref_id = 0";
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        Response.Redirect("/TalkList.aspx");
    }
    private FileInfo NewFileName(FileInfo myFile)
    {
        int num = 0;
        string fileName = "";
        string fname = myFile.Name.Substring(0, (myFile.Name.Length - myFile.Extension.Length));

        string fExtension = myFile.Extension;  //.포함
        do
        {
            num++;
            fileName = fname + "_" + num + fExtension;
            myFile = new FileInfo(Server.MapPath("~/Uploads/" + fileName));
        } while (myFile.Exists);
        return myFile;
    }
}