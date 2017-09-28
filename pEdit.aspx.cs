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

public partial class fEdit : System.Web.UI.Page
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
            string sql = @"select * from petphoto where seq=" + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                TextBox1.Text = rd["title"].ToString();
                pwirte_textbox.Text = rd["body"].ToString();

                Label2.Text = rd["fName"].ToString();
                Label3.Text = "(" + rd["fSize"].ToString() + "bytes)";
                HiddenField1.Value = rd["fSize"].ToString();

                if (Label2.Text == "")
                {
                    Label3.Visible = false;
                    LinkButton1.Visible = false;
                }
                else
                {
                    Label3.Visible = true;
                    LinkButton1.Visible = true;
                }



            }
            rd.Close();
            con.Close();
        }
    }
    protected void pnext_btm_Click(object sender, ImageClickEventArgs e)
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"update petphoto set UserID= @userID, title =@title, body=@body, fName=@fName,fSize=@fSize where seq = " + Request.QueryString["seq"];
        SqlCommand cmd = new SqlCommand(sql, con);

        string fileName = Label2.Text;
        int fileSize = int.Parse(HiddenField1.Value);

        if (FileUpload1.HasFile) //첨부된 파일이 있는경우
        {
            fileName = FileUpload1.FileName;
            FileInfo myFile = new FileInfo(Server.MapPath("~/photos/") + fileName);
            if (myFile.Exists)
            { //이미존재하는 파일명을 첨부하려고 함 : 파일뒤에 1,2,3///을 붙임
                myFile = NewFileName(myFile);
                fileName = myFile.Name; //경로를 제외한 파일이름만
            }
            FileUpload1.SaveAs(myFile.FullName); //파일을 uploads폴더에 저장
            fileSize = FileUpload1.PostedFile.ContentLength; //바이트단위
        }
        cmd.Parameters.AddWithValue("@menu", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@category", DropDownList2.SelectedValue);
        cmd.Parameters.AddWithValue("@userID", User.Identity.Name);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text);
        cmd.Parameters.AddWithValue("@body", pwirte_textbox.Text);
        cmd.Parameters.AddWithValue("@fName", fileName);
        cmd.Parameters.AddWithValue("@fSize", fileSize);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("~/plist.aspx");
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
    protected void plist_btn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/plist.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string seq = Request.QueryString["seq"];

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        //명령
        string sql = @"update petphoto set fName='',fSize=0,hitDown=0 where seq = " + seq;
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        //(2) 실제로 업로드 폴더에서 파일 삭제
        FileInfo myFile = new FileInfo(Server.MapPath("~/photos/") + Label2.Text);
        myFile.Delete();

        Response.Redirect("~/pEdit.aspx?seq=" + seq);
    }
}