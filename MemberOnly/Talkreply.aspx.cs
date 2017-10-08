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

public partial class Talkreply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void pnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        int ref_id = 0;
        int inner_id = 0;
        int depth = 0;

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"select ref_id,inner_id,depth from Talk where seq=" + Request.QueryString["seq"];
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            ref_id = (int)rd["ref_id"];
            inner_id = (int)rd["inner_id"];
            depth = (int)rd["depth"];
        }
        rd.Close();
        con.Close();

        // 현 게시물과 같은 그릉ㄹ 참조하는 글 중에서 현 게시물 이후의 inner_id를 1증가
        string sql2 = @"update Talk set inner_id = inner_id + 1 where ref_id = @ref_id and inner_id > @inner_id";
        SqlCommand cmd2 = new SqlCommand(sql2, con);
        cmd2.Parameters.AddWithValue("@ref_id", ref_id);
        cmd2.Parameters.AddWithValue("@inner_id", inner_id);

        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        // inner_id 와 depth를 1씩 증가 시켜서 답변 글 저장
        string sql3 = @"insert into Talk(userID,title,body,ref_id,inner_id,depth,wDate,fName,fSize) values (@userID,@title,@body,@ref_id,@inner_id,@depth,getDate(),@fName,@fSize);";
        cmd = new SqlCommand(sql3, con);

        //이하 write.asqx 와 비슷하므로 복사해서 수정한다.

        string fileName = "";
        int fileSize = 0;

        if (FileUpload1.HasFile) //첨부된 파일이 있는경우
        {
            fileName = FileUpload1.FileName;
            FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
            if (myFile.Exists)
            { //이미존재하는 파일명을 첨부하려고 함 : 파일뒤에 1,2,3///을 붙임
                myFile = NewFileName(myFile);
                fileName = myFile.Name; //경로를 제외한 파일이름만
            }
            FileUpload1.SaveAs(myFile.FullName); //파일을 uploads폴더에 저장
            fileSize = FileUpload1.PostedFile.ContentLength; //바이트단위
        }

        cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@body", twirte_textbox.Text);
        cmd.Parameters.AddWithValue("@ref_id", ref_id);
        cmd.Parameters.AddWithValue("@inner_id", ++inner_id);
        cmd.Parameters.AddWithValue("@depth", ++depth);
        cmd.Parameters.AddWithValue("@fName", fileName);
        cmd.Parameters.AddWithValue("@fSize", fileSize);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/TalkList.aspx");
    }

    private FileInfo NewFileName(FileInfo myFile)
    {
        int num = 0;
        string fileName = "";
        string fName = myFile.Name.Substring(0, (myFile.Name.Length - myFile.Extension.Length));
        string fExtension = myFile.Extension;
        do
        {
            num++;
            fileName = fName + "_" + num + fExtension;
            myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
        } while (myFile.Exists);

        return myFile;
    }
}