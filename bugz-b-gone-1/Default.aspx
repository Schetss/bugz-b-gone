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
          
            <img src="images/logo.jpg" height="60" width="300" />
            <br />
            <asp:Label ID="lbl_feedbackLogin" runat="server"></asp:Label>
          
            <asp:TextBox ID="txtUsername" Class="loginField form-control" runat="server" Height="30px" Width="300px" placeholder="username"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPassword" Class="form-control" runat="server" Height="30px" Width="300px" placeholder="password" TextMode="Password"></asp:TextBox>
            <br />
          
            <asp:Button ID="btnLogin" Class="btn btn-default" runat="server" Text="Login" Height="40px" Width="300px" OnClick="btnLogin_Click" />

        </div>
    </div>
    </form>
</body>
</html>
