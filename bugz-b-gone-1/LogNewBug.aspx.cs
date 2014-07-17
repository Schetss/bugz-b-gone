using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogNewBug : System.Web.UI.Page
{

    Bug newBug = new Bug();
    BLLnewbug BLLnewbug = new BLLnewbug();
    
    protected void btnCreateMember_Click(object sender, EventArgs e)
    {
        newBug.title = txtTitle.Text;
        newBug.description = txtDescriptionBug.Text;
        newBug.fk_responsible = Convert.ToInt16(ddAssign.SelectedValue);
        newBug.fk_project = Convert.ToInt16(ddProject.SelectedValue);
        newBug.fk_priority = Convert.ToInt16(ddPriority.SelectedValue);
        newBug.fk_bugstatus = 1;
        newBug.openclosed = 1;
        newBug.fk_creator = Convert.ToInt16(Session["userID"]);
        newBug.date = System.DateTime.Now;

        try
        {
            BLLnewbug.insertNewBug(newBug);
            lbl_feedbackLogNewBug.Text = "New bug has been successfully added!";
            lbl_feedbackLogNewBug.CssClass = "success";
        }

        catch
        { 
            lbl_feedbackLogNewBug.Text = "ERROR!";
            lbl_feedbackLogNewBug.CssClass = "error";
        }


    }
   
}