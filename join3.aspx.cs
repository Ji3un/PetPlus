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

public partial class join3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        
        //Hid.Text = System.Security.Principal.WindowsIdentity.GetCurrent().UserID;
    }
    protected void nextb_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}