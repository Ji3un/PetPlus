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


public partial class Weekly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    
    protected void allbtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource1";
    }
    protected void illbtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource2";
    }
    protected void prevbtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource3";
    }
    protected void healthbtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource4";
    }
    protected void beautybtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource5";
    }
    protected void newbtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource6";
    }
    protected void bestbtn_Click(object sender, ImageClickEventArgs e)
    {
        wcon1.DataSourceID = "SqlDataSource7";
    }
    protected void recobtn_Click(object sender, ImageClickEventArgs e)
    {
        //wcon1.DataSourceID = "SqlDataSource8";
    }
    
}