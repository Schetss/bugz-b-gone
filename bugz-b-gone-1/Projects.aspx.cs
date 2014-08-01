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

            GridActiveProjects.DataBind();

        }

        catch
        {
            lbl_feedbackCreateProject.Text = "Oops, something went wrong, please try again!";
            lbl_feedbackCreateProject.CssClass = "error";
        }

    }

    protected void btnActiveProjects_Click1(object sender, EventArgs e)
    {
        Project project = new Project();
        BLLprojects BLLproject = new BLLprojects();

        project.pk_project_id = Convert.ToInt16(ddActiveProjects.SelectedValue);

        try
        {
            BLLproject.changeToNonActive(project);

            lbl_feedbackActiveProject.Text = "Projet has been set to non-active!";
            lbl_feedbackActiveProject.CssClass = "success2";

            GridActiveProjects.DataBind();
            ddActiveProjects.DataBind();
            ddNonActiveProjects.DataBind();
        }

        catch (Exception error)
        {
            lbl_feedbackActiveProject.Text = error.Message;
            lbl_feedbackActiveProject.CssClass = "error2";
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Project project = new Project();
        BLLprojects BLLproject = new BLLprojects();

        project.pk_project_id = Convert.ToInt16(ddNonActiveProjects.SelectedValue);

        try
        {
            BLLproject.changeToActive(project);

            lbl_feedbackNonActiveProject.Text = "Projet has been set to active!";
            lbl_feedbackNonActiveProject.CssClass = "success2";

            GridActiveProjects.DataBind();
            ddActiveProjects.DataBind();
            ddNonActiveProjects.DataBind();
        }

        catch (Exception error)
        {
            lbl_feedbackNonActiveProject.Text = error.Message;
            lbl_feedbackNonActiveProject.CssClass = "error2";
        }
    }
}