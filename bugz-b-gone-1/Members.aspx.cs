using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Members : System.Web.UI.Page
{
    ProductUser newProductUser = new ProductUser();
    UsersOnProject newUsersOnProject = new UsersOnProject();

    BLLmembers BLLMembers = new BLLmembers();

    
    protected void btnCreateMember_Click(object sender, EventArgs e)
    {
        newProductUser.username = txtUsername.Text;
        newProductUser.password = txtPassword.Text;
        newProductUser.fk_usertype = Convert.ToInt16(ddStatus.SelectedValue);

        try
        {
            BLLMembers.insertMember(newProductUser);
            lbl_feedbackCreateMember.Text = "New user has been added!";
            lbl_feedbackCreateMember.CssClass = "success";
            txtPassword.Text = "";
            txtUsername.Text = "";
        }

        catch
        {
            lbl_feedbackCreateMember.Text = "Oops, something went wrong, please try again!";
            lbl_feedbackCreateMember.CssClass = "error"; 
        }

    }


    protected void btbAddMemberToProject_Click(object sender, EventArgs e)
    {
        newUsersOnProject.fk_user = Convert.ToInt16(ddMember.SelectedValue);
        newUsersOnProject.fk_project = Convert.ToInt16(ddProject.SelectedValue);

        try
        {
            BLLMembers.insertUserProject(newUsersOnProject);
            lbl_feedbackMemberToProject.Text = "User has been added to project!";
            lbl_feedbackMemberToProject.CssClass = "success";
           
        }

        catch
        {
            lbl_feedbackMemberToProject.Text = "Oops, something went wrong, please try again!";
            lbl_feedbackMemberToProject.CssClass = "error";
        }
    
    }




  
}