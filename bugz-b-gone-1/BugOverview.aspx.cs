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

        // Get all information from the bug and load information in the page

        Bug newBug = new Bug();
        BLLbugoverview BLLoverview = new BLLbugoverview();

        newBug.pk_bug_id = Convert.ToInt16(Request.QueryString["pk_bug_id"]);


        try
        {
            var buginfo = BLLoverview.getBug(newBug);

            lblBugOverview.Text = buginfo[0].title;
            lblDescrip.Text = buginfo[0].Project.title + " - " + buginfo[0].description;
            lblOverviewPrior.Text = buginfo[0].Priority.priority_name + " Priority";

            // color of the bugname

            if (buginfo[0].fk_bugstatus == 1)
            {
                lblBugOverview.CssClass = "error";
            }

            else if (buginfo[0].fk_bugstatus == 2)
            {
                lblBugOverview.CssClass = "between";

            }

            else
            {
                lblBugOverview.CssClass = "success";

            }

            // Show / hide placeholder to complete the bugstatus

            if (buginfo[0].fk_bugstatus == 3 && (Session["userID"].ToString() == buginfo[0].fk_creator.ToString() || Session["userID"].ToString() == buginfo[0].fk_responsible.ToString()))
            {
                PlaceholderChange.Visible = true;
            }

            else
            {
                PlaceholderChange.Visible = false;
            }
            

        }

        catch
        {
            lblBugOverview.Text = "Oops, something went wrong!";
            lblBugOverview.CssClass = "error";
        }




    }


    protected void btnResponse_Click(object sender, EventArgs e)
    {

        // place reaction

        Reaction1 newReaction = new Reaction1();
        BLLcomment BLLcomment = new BLLcomment();

        newReaction.date = System.DateTime.Now;
        newReaction.fk_user = Convert.ToInt16(Session["userID"]);
        newReaction.fk_bug = Convert.ToInt16(Request.QueryString["pk_bug_id"]);
        newReaction.reaction = txtComment.Text;

        try
        {
            BLLcomment.insertComment(newReaction);

            txtComment.Text = "";

            ListView1.DataBind();
        }

        catch
        {
            lblFeedbackComment.Text = "Oops, something went wrong";
            lblFeedbackComment.CssClass = "error2";
        }

    }


    protected void btnChangeStatus_Click(object sender, EventArgs e)
    {

        // change bugstatus

        Bug newbug = new Bug();
        BLLchangebugstatus BLLchangestatus = new BLLchangebugstatus();

        newbug.fk_bugstatus = Convert.ToInt16(ddStatus.SelectedValue);
        newbug.pk_bug_id = Convert.ToInt16(Request.QueryString["pk_bug_id"]); 

        try
        {
            BLLchangestatus.changeStatus(newbug);

            lblFeedbackStatus.Text = "Status is changed";
            lblFeedbackStatus.CssClass = "success3";

            if (Convert.ToInt16(ddStatus.SelectedValue) == 1)
            {
                lblBugOverview.CssClass = "error";
            }

            else if (Convert.ToInt16(ddStatus.SelectedValue) == 2)
            {
                lblBugOverview.CssClass = "between";

            }

            else
            {
                lblBugOverview.CssClass = "success";

            }

        }

        catch (Exception error)
        {
            lblFeedbackStatus.Text = error.Message;
            lblFeedbackStatus.CssClass = "error3";
        }


        // SHOW OR HIDE CLOSE BUG 

        Bug newBug2 = new Bug();
        BLLbugoverview BLLoverview = new BLLbugoverview();

        newBug2.pk_bug_id = Convert.ToInt16(Request.QueryString["pk_bug_id"]);


        try
        {
            var buginfo = BLLoverview.getBug(newBug2);

            if (buginfo[0].fk_bugstatus == 3 && (Session["userID"].ToString() == buginfo[0].fk_creator.ToString() || Session["userID"].ToString() == buginfo[0].fk_responsible.ToString()))
            {
                PlaceholderChange.Visible = true;
            }

            else
            {
                PlaceholderChange.Visible = false;
            }
        }

        catch
        {
            lblBugOverview.Text = "Oops, something went wrong!";
            lblBugOverview.CssClass = "error";
        }






    }



    protected void btnSave_Click(object sender, EventArgs e)
    {

        // save buton to close

        Bug closebug = new Bug();
        BLLclose BLLclose = new BLLclose();

        closebug.pk_bug_id = Convert.ToInt16(Request.QueryString["pk_bug_id"]);

        try
        {
            BLLclose.closeBug(closebug);

            lblFeedbackClose.Text = "Bug succesfully closed";
            lblFeedbackClose.CssClass = "success2";
        }

        catch (Exception error)
        {
            lblFeedbackClose.Text = error.Message;
            lblFeedbackClose.CssClass = "error2";
        }
    }
}