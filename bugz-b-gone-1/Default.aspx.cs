using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
     protected void btnLogin_Click(object sender, EventArgs e)
    {
        ProductUser productuser = new ProductUser();
         BLLlogin BLLlogin = new BLLlogin();

        productuser.username = txtUsername.Text;
        productuser.password = txtPassword.Text;

        try
        {
            BLLlogin.checkLogin(productuser);
            lbl_feedbackLogin.Text = "awesome!";

        }
        
        catch
        {
            lbl_feedbackLogin.Text = "mimimi";
        }
    }

     protected void Page_Load(object sender, EventArgs e)
     {

     }
}