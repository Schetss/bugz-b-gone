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
        //lblBugOverview.Text = Request.QueryString["pk_bug_id"];

        Bug newBug = new Bug();
        BLLbugoverview BLLoverview = new BLLbugoverview();

        newBug.pk_bug_id = Convert.ToInt16(Request.QueryString["pk_bug_id"]);

        try
        {
            var buginfo = BLLoverview.getBug(newBug);

            lblBugOverview.Text = buginfo[0].title;
            lblDescrip.Text = buginfo[0].description;

            

        }

        catch
        {
            lblBugOverview.Text = "Oops, something went wrong!";
            lblBugOverview.CssClass = "error";
        }

    }


    protected void btnResponse_Click(object sender, EventArgs e)
    {
        Reaction1 newReaction = new Reaction1();
        BLLcomment BLLcomment = new BLLcomment();

        newReaction.date = System.DateTime.Now;
        newReaction.fk_user = Convert.ToInt16(Session["userID"]);
        newReaction.fk_bug = Convert.ToInt16(Request.QueryString["pk_bug_id"]);
        newReaction.reaction = txtComment.Text;

        try
        {
            BLLcomment.insertComment(newReaction);

            lblFeedbackComment.Text = "Comment is added";
            lblFeedbackComment.CssClass = "success2";
            txtComment.Text = "";

        }

        catch
        {
            lblFeedbackComment.Text = "Oops, something went wrong";
            lblFeedbackComment.CssClass = "error2";
        }

    }
}