using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BugOverview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblBugOverview.Text = Request.QueryString["pk_bug_id"];
    }
}