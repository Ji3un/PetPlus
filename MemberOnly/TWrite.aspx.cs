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

            string sql = @"insert into TTalk(category,userID,title,wDate) Values(@category,@userID,@title,getDate())";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
            cmd.Parameters.AddWithValue("@title", "");

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    protected void pnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        //(1) 글을 board 테이블에 insert
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"update Weekly set title=@title,wDate=getDate() where wfile='N' ";
        SqlCommand cmd = new SqlCommand(sql, con);
        
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        //(2) ref_id를 자동생성된 글번호 seq로 update
        string sql2 = @"Update weekly Set wfile='Y' Where wfile='N'";
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();        

        Response.Redirect("/Weeklymain.aspx");


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

                    string sql = @"insert into pfile (tname,tseq,fName,fSize) Values('W',(select seq from Weekly where wfile='N'),@fName,@fSize)";
                    SqlCommand cmd = new SqlCommand(sql, con);

                    string fileName = "";
                    int fileSize = 0;

                    if (FileUpload1.HasFile)
                    {
                        fileName = FileUpload1.FileName; //파일의 이름만
                        FileInfo myFile = new FileInfo(Server.MapPath("/Weekly/") + fileName);
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
            myFile = new FileInfo(Server.MapPath("/Weekly/" + fileName));
        } while (myFile.Exists);
        return myFile;
    }
    protected void pcancel_btn_Click(object sender, ImageClickEventArgs e)
    {
        //(1) 글을 board 테이블에 insert
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"delete Weekly where wfile='N' ";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@title", TextBox1.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();        

        Response.Redirect("/Weeklymain.aspx");
    }
}