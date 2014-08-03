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
        newBug.fk_responsible = Convert.ToInt16(ddResponsible.SelectedValue);
        newBug.fk_project = Convert.ToInt16(ddProject.SelectedValue);
        newBug.fk_priority = Convert.ToInt16(ddPrior.SelectedValue); 
        newBug.fk_bugstatus = 1;
        newBug.openclosed = 1;
        newBug.fk_creator = Convert.ToInt16(Session["userID"]);
        newBug.date = System.DateTime.Now;

        try
        {
            BLLnewbug.insertNewBug(newBug);
            lbl_feedbackLogNewBug.Text = "New bug has been successfully added!";
            lbl_feedbackLogNewBug.CssClass = "success2";
        }

        catch
        { 
            lbl_feedbackLogNewBug.Text = "Oops, something went wrong, please try again!";
            lbl_feedbackLogNewBug.CssClass = "error2";
        }


    }



    protected void ddProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        UsersOnProject usersonprojects = new UsersOnProject();
        BLLresponsible BLLresponsible = new BLLresponsible();

        usersonprojects.fk_project = Convert.ToInt16(ddProject.SelectedValue);

        try
        {
            var users = BLLresponsible.getAllUsers(usersonprojects);

            if (users.Count > 0)
            {
                String test = "";

                for (int i = 0; i < users.Count; i++)
                {
                    test += "pk_productuser_id = " + users[i].fk_user + " || ";
                }

                String test2 = test.Substring(0, test.Length - 3);

                LinqMembers.Where = test2;

            }

            else
            {
                int test3 = Convert.ToInt16(Session["userID"]);
                LinqMembers.Where = "pk_productuser_id = " + test3.ToString();
            }

            ddResponsible.DataBind();

        }

        catch (Exception error)
        {
            Console.WriteLine(error);
        }

    }




    protected void Page_Load(object sender, EventArgs e)
    {
        int test3 = Convert.ToInt16(Session["userID"]);
        LinqMembers.Where = "pk_productuser_id = " + test3.ToString();
    }
}