using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{

    protected void btnOpen_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqOpen";
        lblBugShowName.Text = "Open cases";
    }
    
    protected void btnMine_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqMy";
        lblBugShowName.Text = "My cases";
    }

    protected void btnCLosed_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqClosed";
        lblBugShowName.Text = "Closed cases";
    }

    protected void btnAll_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqAll";
        lblBugShowName.Text = "All cases";
    }
}