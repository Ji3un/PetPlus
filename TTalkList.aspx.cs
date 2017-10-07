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

public partial class TalkList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected string ShowDepth(int depth)
    {
        string result = "";
        for (int i = 0; i < depth; i++)
        {
            result += "&nbsp;&nbsp;&nbsp;";
        }
        return result;
    }
    protected string ShowReplyIcon(int inner_id)
    {
        string result = "";
        if (inner_id != 0)
        {
            result += "<img src ='/Images/reply_icon.gif' />";
        }
        return result;
    }
    protected string ShowTitle(string seq, string title, string deleted)
    {
        string result = "";
        if (deleted == "N")
        {
            result += "<a href='/TTalkRead.aspx?seq=" + seq + "'>" + title + "</a>";
        }
        else
        {
            result += "삭제된 게시물 입니다.";
        }
        return result;
    }

}