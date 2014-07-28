<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="bootstrap/css/screen.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   
    <title>Login Bugz-B-Gone</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="loginBox">
          
            <img src="images/logo.jpg" class="loginLogo" height="60" width="300" />
          
            <br />
            <asp:Label ID="lbl_feedbackLogin" Class="lblFeedback" runat="server"></asp:Label>
     
            <asp:TextBox ID="txtUsername" Class="loginField form-control txtbox" runat="server" Height="30px" Width="300px" placeholder="username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ControlToValidate="txtUsername" CssClass="error required1" EnableTheming="False" ErrorMessage="*"></asp:RequiredFieldValidator>      

            <br />
            <asp:TextBox ID="txtPassword" Class="form-control txtbox loginField2" runat="server" Height="30px" Width="300px" placeholder="password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="error required2" ErrorMessage="*"></asp:RequiredFieldValidator>

             <br />
          
            <asp:Button ID="btnLogin" Class="btn btn-default loginField2" runat="server" Text="Login" Height="40px" Width="300px" OnClick="btnLogin_Click" />

        </div>
    </div>
    </form>
</body>
</html>
