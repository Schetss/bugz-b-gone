<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Bugs</a></li>
            <li><a href="#">Projects</a></li>
            <li><a href="#">Members</a></li>
            <li id="rightMenu" ><a href="#">Log new bug</a></li>
        </ul>
        </div>
    </nav>

</asp:Content>

