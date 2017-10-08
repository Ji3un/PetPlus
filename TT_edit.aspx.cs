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
               

                //연결
                string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                //명령
                string sql = @"select * from TTalk t join pfile p on t.seq = p.tseq where t.seq=" + Request.QueryString["seq"];
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    TextBox1.Text = rd["title"].ToString();
                    Label2.Text += rd["fName"].ToString()+' ';
                    Twirte_textbox.Text = rd["body"].ToString();
                }
                rd.Close();
                con.Close();
            }
        
    }
    protected void pnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"update TTalk set title=@title,body=@body where seq = @seq";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@body", Twirte_textbox.Text);
        cmd.Parameters.AddWithValue("@seq", Request.QueryString["seq"]);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        //(2) ref_id를 자동생성된 글번호 seq로 update
        string sql2 = @"Update TTalk Set tfile='Y' Where tfile='N'";
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        con.Open();
        //cmd2.ExecuteNonQuery();
        con.Close();

        Response.Redirect("/TTalkList.aspx");

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

                    string sql = @"insert into pfile (tseq,fName,fSize) Values(@seq,@fName,@fSize)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@seq", Request.QueryString["seq"]);

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

        cmd.Parameters.AddWithValue("@title", TextBox1.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("/TTalkList.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        //명령
        string sql = @"delete pfile where tseq = " + seq;
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        //(2) 실제로 업로드 폴더에서 파일 삭제
        FileInfo myFile = new FileInfo(Server.MapPath("~/Talk/") + Label2.Text);
        myFile.Delete();

        Response.Redirect("~/TT_Edit.aspx?seq=" + seq);
    }
}