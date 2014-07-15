﻿using System;
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
           // Response.Redirect("Home.aspx");
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
         
            Session["Username"] = productuser.username;
            Session["Status"] = status.ToString();

            Response.Redirect("Home.aspx");
        }
        
        catch
        {
            lbl_feedbackLogin.Text = "mimimi";
        }
    }

    
}