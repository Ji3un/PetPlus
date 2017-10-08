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

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string conStr = ConfigurationManager.ConnectionStrings["myDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        
    }
    protected void beauty_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void hotel_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void cat_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void extra_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void t24_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void emergency_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void prevention_btn_ServerClick(object sender, EventArgs e)
    {

    }
    protected void pregnancy_btn_ServerClick(object sender, EventArgs e)
    {

    }
}