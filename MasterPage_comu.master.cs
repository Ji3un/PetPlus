using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.IO;


public partial class MasterPage_main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label12.Text = Application["Counter"].ToString();
        Label22.Text = Application["ActiveCounter"].ToString();
        if (Page.User.Identity.IsAuthenticated)  // 로그인 상태인지 확인한다
        {
            LoginID.Text = Page.User.Identity.Name + "님";
            f_LoginID.Text = Page.User.Identity.Name + "님";
            logout.Visible = false;
            login.Visible = true;
            s_logout.Visible = false;
            s_login.Visible = true;
        }
        else
        {
            logout.Visible = true;
            login.Visible = false;
            s_logout.Visible = true;
            s_login.Visible = false;
        }
    }
    protected void sbtn_ServerClick(object sender, EventArgs e)
    {
        if (stxt.Value != "")
        {
            string title = stxt.Value;
            Response.Redirect("/Search_Result.aspx?title=" + title);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('빈칸입니다.')", true);
        }
    }
    protected void out_ServerClick(object sender, EventArgs e)
    {
        //logout 변경
        FormsAuthentication.SignOut();
        Response.Redirect(Request.UrlReferrer.ToString());
    }
    protected void f_out_ServerClick(object sender, EventArgs e)
    {
        //logout 변경
        FormsAuthentication.SignOut();
        Response.Redirect(Request.UrlReferrer.ToString());
    }
}
