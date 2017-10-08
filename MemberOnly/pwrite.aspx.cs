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

public partial class pwrite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void pnext_btm_Click(object sender, ImageClickEventArgs e)
    {
       //글쓰기 버튼
        //(1) 글을 board 테이블에 insert
//연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

 //명령
        string sql = @"insert into petphoto(userID,title,menu,category,body,fName,fSize) values(@userID,@title,@menu,@category,@body,@fName,@fSize)";
        SqlCommand cmd = new SqlCommand(sql, con);

        string fileName = "";
        int fileSize = 0;

        if (FileUpload1.HasFile) //첨부된 파일이 있는경우
        {
            fileName = FileUpload1.FileName;
            FileInfo myFile = new FileInfo(Server.MapPath("~/photos/") + fileName);
            if(myFile.Exists)
            { //이미존재하는 파일명을 첨부하려고 함 : 파일뒤에 1,2,3///을 붙임
                myFile = NewFileName(myFile);
                fileName = myFile.Name; //경로를 제외한 파일이름만
            }
            FileUpload1.SaveAs(myFile.FullName); //파일을 uploads폴더에 저장
            fileSize = FileUpload1.PostedFile.ContentLength; //바이트단위
        }
            cmd.Parameters.AddWithValue("@menu", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@category", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@title", TextBox1.Text);
            cmd.Parameters.AddWithValue("@body", pwirte_textbox.Text);
            cmd.Parameters.AddWithValue("@userID", User.Identity.Name);
            cmd.Parameters.AddWithValue("@fName", fileName);
            cmd.Parameters.AddWithValue("@fSize", fileSize);

            //실행

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("/plist.aspx");
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
            myFile = new FileInfo(Server.MapPath("~/photos/") + fileName);
        } while (myFile.Exists);

        return myFile;
}


}