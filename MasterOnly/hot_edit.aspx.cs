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
            string seq = Request.QueryString["seq"];

            //연결
            string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //명령
            string sql = @"select * from pfile where seq=" + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                TextBox1.Text = rd["title1"].ToString();
                TextBox2.Text = rd["title2"].ToString();
                TextBox3.Text = rd["cName"].ToString();
                TextBox4.Text = rd["contents"].ToString();

                Label23.Text = rd["fName"].ToString();
                Label1.Text = "(" + rd["fSize"].ToString() + "bytes)";
                HiddenField1.Value = rd["fSize"].ToString();

                if (Label23.Text == "")
                {
                    Label1.Visible = false;
                    LinkButton1.Visible = false;
                }
                else
                {
                    Label1.Visible = true;
                    LinkButton1.Visible = true;
                }
            }
            rd.Close();
            con.Close();
        }
    }

    protected void hnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"update Hotdeal set UserID= @userID, title1 =@title1,title2 =@title2, cName=@cName,contents=@contents where seq = " + Request.QueryString["seq"];
        SqlCommand cmd = new SqlCommand(sql, con);

        string fileName = Label23.Text;
        int fileSize = int.Parse(HiddenField1.Value);

        if (FileUpload1.HasFile) //첨부된 파일이 있는경우
        {
            fileName = FileUpload1.FileName;
            FileInfo myFile = new FileInfo(Server.MapPath("~/Event/") + fileName);
            if (myFile.Exists)
            { //이미존재하는 파일명을 첨부하려고 함 : 파일뒤에 1,2,3///을 붙임
                myFile = NewFileName(myFile);
                fileName = myFile.Name; //경로를 제외한 파일이름만
            }
            FileUpload1.SaveAs(myFile.FullName); //파일을 uploads폴더에 저장
            fileSize = FileUpload1.PostedFile.ContentLength; //바이트단위
        }
        cmd.Parameters.AddWithValue("@category", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@userID", User.Identity.Name);
        cmd.Parameters.AddWithValue("@title1", TextBox1.Text);
        cmd.Parameters.AddWithValue("@title2", TextBox2.Text);
        cmd.Parameters.AddWithValue("@cName", TextBox3.Text);
        cmd.Parameters.AddWithValue("@contents", TextBox4.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("~/Event.aspx");

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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        //명령
        string sql = @"update pfile set fName='',fSize=0,hitDown=0 where seq = " + seq;
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        //(2) 실제로 업로드 폴더에서 파일 삭제
        FileInfo myFile = new FileInfo(Server.MapPath("~/Event/") + Label23.Text);
        myFile.Delete();

        Response.Redirect("~/hot_edit.aspx?seq=" + seq);
    }
}