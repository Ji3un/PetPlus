using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class MemberOnly_Livecha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected string GetContent(object content)
    {// 줄바꿈 문자를 <br/> 태그로 바꿀것이다
        string ss = content.ToString();
        ss = ss.Replace("\n", "<br/>");
        return ss;

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.TextMode == TextBoxMode.SingleLine)
        {
            TextBox1.Rows = 2;
            TextBox1.TextMode = TextBoxMode.MultiLine;
        }
        else
        {
            TextBox1.Rows = 1;
            TextBox1.TextMode = TextBoxMode.SingleLine;
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // [저장] 버튼
        string UserID = Page.User.Identity.Name;

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = "insert into petNote(UserID, content) Values (@UserID, @content)";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@UserID", UserID);
        cmd.Parameters.AddWithValue("@content", TextBox1.Text);

        //실행
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        DataList1.DataBind();
        TextBox1.Text = "";

    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            LinkButton btn = (LinkButton)e.Item.FindControl("LinkButton1");
            Label lbl = (Label)e.Item.FindControl("Label1");
            string loginUser = Page.User.Identity.Name;

            if (lbl.Text == loginUser)
                btn.Visible = true;
            else
                btn.Visible = false;
        }
    }

    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string ss = e.CommandArgument.ToString();

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        
        //명령
        string sql = "Delete from petNote where nID=@nID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@nID", ss);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        DataList1.DataBind();
    }
}