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
          
            <asp:TextBox ID="TextBox1" Class="loginField form-control" runat="server" Height="30px" Width="300px" placeholder="username"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox2" Class="form-control" runat="server" Height="30px" Width="300px" placeholder="password"></asp:TextBox>
            <br />
          
            <asp:Button ID="btnLogin" Class="btn btn-default" runat="server" Text="Login" Height="40px" Width="300px" />

        </div>
    </div>
    </form>
</body>
</html>
