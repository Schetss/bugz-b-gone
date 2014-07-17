using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null) 
        {
            Response.Redirect("Bugs.aspx");
        }

    }

     protected void btnLogin_Click(object sender, EventArgs e)
    {
        ProductUser productuser = new ProductUser();
         BLLlogin BLLlogin = new BLLlogin();

        productuser.username = txtUsername.Text;
        productuser.password = txtPassword.Text;


        try
        {
            BLLlogin.checkLogin(productuser);

            int status = BLLlogin.getStatus(productuser);

            int userID = BLLlogin.getUserID(productuser);

           


         
            Session["Username"] = productuser.username;
            Session["Status"] = status.ToString();
            Session["userID"] = userID.ToString();
 
            Response.Redirect("Default.aspx");
        }
        
        catch
        {
            lbl_feedbackLogin.Text = "mimimi";
        }
    }

    
}