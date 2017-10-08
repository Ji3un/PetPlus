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
        if (!IsPostBack)
        {
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"insert into TTalk(userID,title,body,tDate) Values(@userID,@title,@body,getDate())";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
            cmd.Parameters.AddWithValue("@title", "");
            cmd.Parameters.AddWithValue("@body", "");

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
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

         //현 게시물과 같은 그릉ㄹ 참조하는 글 중에서 현 게시물 이후의 inner_id를 1증가
        string sql2 = @"update TTalk set inner_id = inner_id + 1 where ref_id = @ref_id and inner_id > @inner_id";
        SqlCommand cmd2 = new SqlCommand(sql2, con);
        cmd2.Parameters.AddWithValue("@ref_id", ref_id);
        cmd2.Parameters.AddWithValue("@inner_id", inner_id);

        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        // inner_id 와 depth를 1씩 증가 시켜서 답변 글 저장
        string sql3 = @"update TTalk set title=@title,ref_id=@ref_id,inner_id=@inner_id,depth=@depth,body=@body,tDate=getDate(),ref_id=0,inner_id=0,depth=0 where tfile='N'";
        cmd = new SqlCommand(sql3, con);

        cmd.Parameters.AddWithValue("@title", Ttit_textbox.Text);
        cmd.Parameters.AddWithValue("@body", Twirte_textbox.Text);
        cmd.Parameters.AddWithValue("@ref_id", ref_id);
        cmd.Parameters.AddWithValue("@inner_id", ++inner_id);
        cmd.Parameters.AddWithValue("@depth", ++depth);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        

        string sql4 = @"Update TTalk Set tfile='Y' Where tfile='N'";
        SqlCommand cmd3 = new SqlCommand(sql4, con);

        con.Open();
        cmd3.ExecuteNonQuery();
        con.Close();        

        
       Response.Redirect("~/TTalkList.aspx");

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpFileCollection uploadedFiles = Request.Files;

         

        for(int i = 0; i<uploadedFiles.Count; i++)
        {
            HttpPostedFile userPostedFile = uploadedFiles[i];
            Stream fs = userPostedFile.InputStream;

            //파일 사이즈
            int intFileLength = System.Convert.ToInt32(userPostedFile.ContentLength);

            //파일 명
            string stFileName = Path.GetFileName(userPostedFile.FileName);            

            try
            {
                if (userPostedFile.ContentLength > 0)
                {
                    //(1) 글을 테이블에 insert
                    string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
                    SqlConnection con = new SqlConnection(conStr);

                    string sql = @"insert into pfile (tname,tseq,fName,fSize) Values('T',(select seq from TTalk where tfile='N'),@fName,@fSize)";
                    SqlCommand cmd = new SqlCommand(sql, con);

                    string fileName = "";
                    int fileSize = 0;

                    if (FileUpload1.HasFile)
                    {
                        fileName = FileUpload1.FileName; //파일의 이름만
                        FileInfo myFile = new FileInfo(Server.MapPath("/Talk/") + fileName);
                        if (myFile.Exists)
                        {
                            myFile = NewFileName(myFile);
                            fileName = myFile.Name;
                        }
                        FileUpload1.SaveAs(myFile.FullName);
                        fileSize = FileUpload1.PostedFile.ContentLength;
                    }

                    cmd.Parameters.AddWithValue("@fName", stFileName);
                    cmd.Parameters.AddWithValue("@fSize", intFileLength);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Label2.Text += "<hr>";
                    Label2.Text += "파일타입 :" + userPostedFile.ContentType + "/";
                    Label2.Text += "파일크기 :" + intFileLength.ToString() + "KB/";
                    Label2.Text += "파일이름 :" + stFileName + "<br>";
                }
            }

            catch (Exception Ex)
            {
                Label2.Text += "Error: " + Ex.Message;
            }
                     
        }
        

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
            myFile = new FileInfo(Server.MapPath("/Talk/" + fileName));
        } while (myFile.Exists);
        return myFile;
    }
    protected void pcancel_btn_Click(object sender, ImageClickEventArgs e)
    {
        //(1) 글을 board 테이블에 insert
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"delete Talk where tfile='N' ";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@title", Ttit_textbox.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("/TTalkList.aspx");
    }
}