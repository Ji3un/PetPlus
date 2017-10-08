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

public partial class MasterOnly_hot_write : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            //SqlConnection con = new SqlConnection(conStr);

            //string sql = @"insert into Hotdeal(userID,title1,title2,cName,category,hDate) Values(@userID,@title1,@title2,@cName,@category,getDate())";
            //SqlCommand cmd = new SqlCommand(sql, con);

            //cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
            //cmd.Parameters.AddWithValue("@title1", "");
            //cmd.Parameters.AddWithValue("@title2", "");
            //cmd.Parameters.AddWithValue("@cName", "");
            //cmd.Parameters.AddWithValue("@category", "");

            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();
        }
    }

   // protected void hnext_btm_Click(object sender, ImageClickEventArgs e)
  //  {
        //(1) 글을 board 테이블에 insert
        //string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        //SqlConnection con = new SqlConnection(conStr);

        //string sql = @"insert into Hotdeal(title1,title2,cName,category,hDate) Values (@title1,@title2,@cName,@category,getDate())";
        //SqlCommand cmd = new SqlCommand(sql, con);

        //cmd.Parameters.AddWithValue("@title1", TextBox1.Text);
        //cmd.Parameters.AddWithValue("@title2", TextBox2.Text);
        //cmd.Parameters.AddWithValue("@cName", TextBox3.Text);
        //cmd.Parameters.AddWithValue("@category", DropDownList1.SelectedValue);

        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

        //string sql2 = @"Update Hotdeal Set hfile='Y' Where hfile='N'";
        //SqlCommand cmd2 = new SqlCommand(sql2, con);

        //con.Open();
        //cmd2.ExecuteNonQuery();
        //con.Close();        


       // Response.Redirect("/Event.aspx");
   // }

    protected void hnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        HttpFileCollection uploadedFiles = Request.Files;

        for (int i = 0; i < uploadedFiles.Count; i++)
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
                    // 1번
                    string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
                    SqlConnection con = new SqlConnection(conStr);

                    string sql = @"insert into Hotdeal(userID,title1,title2,cName,category,contents,hDate) Values(@userID,@title1,@title2,@cName,@category,@contents,getDate())";
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
                    cmd.Parameters.AddWithValue("@title1", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@title2", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@cName", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@category", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@contents",TextBox4.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    //(2) 이미지를 테이블에 insert
                    sql = @"insert into pfile (tname,tseq,fName,fSize) Values('H',(select seq from Hotdeal where hfile='N'),@fName,@fSize)";
                    cmd = new SqlCommand(sql, con);

                    string fileName = "";
                    int fileSize = 0;

                    if (FileUpload1.HasFile)
                    {
                        fileName = FileUpload1.FileName; //파일의 이름만
                        FileInfo myFile = new FileInfo(Server.MapPath("/Event/") + fileName);
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

                    Label23.Text += "<hr>";
                    Label23.Text += "파일타입 :" + userPostedFile.ContentType + "/";
                    Label23.Text += "파일크기 :" + intFileLength.ToString() + "KB/";
                    Label23.Text += "파일이름 :" + stFileName + "<br>";

                    //3번
                    string sql2 = @"Update Hotdeal Set hfile='Y' Where hfile='N'";
                    SqlCommand cmd2 = new SqlCommand(sql2, con);

                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();


                    Response.Redirect("/Event.aspx");
                }
            }

            catch (Exception Ex)
            {
                Label23.Text += "Error: " + Ex.Message;
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
            myFile = new FileInfo(Server.MapPath("~/Event/" + fileName));
        } while (myFile.Exists);
        return myFile;
    }
    protected void hcancel_btn_Click(object sender, ImageClickEventArgs e)
    {
        //(1) 글을 board 테이블에 insert
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string sql = @"delete Hotdeal where hfile='N' ";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@title1", TextBox1.Text);
        cmd.Parameters.AddWithValue("@title2", TextBox2.Text);
        cmd.Parameters.AddWithValue("@cName", TextBox3.Text);
        cmd.Parameters.AddWithValue("@contents", TextBox4.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("/Event.aspx");
    }

}