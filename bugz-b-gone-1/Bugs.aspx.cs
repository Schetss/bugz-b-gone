using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{

    // change content by swapping datasource

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

    protected void btnOnHold_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqOnHold";
        lblBugShowName.Text = "On hold";
    }

    protected void btnFixed_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqFixed";
        lblBugShowName.Text = "Fixed - not closed";
    }

    protected void btnProjects_Click(object sender, EventArgs e)
    {
        ListView1.DataSourceID = "LinqProject";
        lblBugShowName.Text = "My projects";
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

        // load my projects

       BLLmyproject BLLmyproject = new BLLmyproject();

       UsersOnProject newUsersonProject = new UsersOnProject();
       newUsersonProject.fk_user = Convert.ToInt16(Session["userID"]);

       try
       {
           // get my projects by defining linqProject.Where

           var projects = BLLmyproject.getAllKeys(newUsersonProject);

           String test = "";

               for(int i = 0 ; i < projects.Count ; i++ )
               {
                   test += "fk_project = " + projects[i].fk_project + " || ";
               }

               String test2 = test.Substring(0, test.Length - 3);

                LinqProject.Where = test2;
       }

       catch
       {
           Console.WriteLine("problems");
       }

    
    
    }



}