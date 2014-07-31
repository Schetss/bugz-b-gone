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

    protected void lblsortonprior_Click(object sender, EventArgs e)
    {
        lblBugShowName.Text = "test";
    }


    protected void btn_sortprior_Click(object sender, EventArgs e)
    {
        LinqAll.OrderBy = "fk_priority desc";
        LinqClosed.OrderBy = "fk_priority desc";
        LinqOpen.OrderBy = "fk_priority desc";
        LinqMy.OrderBy = "fk_priority desc";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       // UsersOnProject newUsersonProject = new UsersOnProject();
       // newUsersonProject.fk_user = (int)Session["UserID"];

       
        
    }

}