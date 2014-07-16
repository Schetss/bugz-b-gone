using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Projects : System.Web.UI.Page
{
    
    protected void btnCreateProject_Click(object sender, EventArgs e)
    {
        Project project = new Project();
        BLLprojects BLLproject = new BLLprojects();

        project.title = txtTitleProject.Text;
        project.description = txtDescriptionProject.Text;
        project.fk_projectstatus = 1;

        try
        {
            BLLproject.insertProject(project);

            lbl_feedbackCreateProject.Text = "Project had been added";
            lbl_feedbackCreateProject.CssClass = "success";

            txtDescriptionProject.Text = "";
            txtTitleProject.Text = "";
        }

        catch
        {
            lbl_feedbackCreateProject.Text = "Project could not be added";
            lbl_feedbackCreateProject.CssClass = "error";
        }

    }

    protected void btnActiveProjects_Click(object sender, EventArgs e)
    {
        Project project = new Project();
        BLLprojects BLLproject = new BLLprojects();

        project.pk_project_id = ddActiveProjects.SelectedIndex;

        try
        {

        }

        catch { 
        
        }

    }
}