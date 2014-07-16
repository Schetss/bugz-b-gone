<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogNewBug.aspx.cs" Inherits="LogNewBug" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
        <ul class="nav navbar-nav">
            <li><a href="Bugs.aspx">Bugs</a></li>
           <%   
                if (Session["Status"] == null)
                {
                    Session.Abandon();
                    Response.Redirect("Default.aspx");
                }
                else if( (Session["Status"].ToString() == "2")) 
                { 
           %>

            <li><a href="Projects.aspx">Projects</a></li>
            <li><a href="Members.aspx">Members</a></li>
           
            <% 
                } 
            %>
            <li id="rightMenu" class="active"><a href="LogNewBug.aspx">Log new bug</a></li>
        </ul>
        </div>
    </nav>

    <div class="page-header">
        <h1><small> Log new bug </small></h1>
    </div>

    <div class="createProject">
        <asp:TextBox ID="txtTitle" Class="loginField form-control" runat="server" Height="50px" Width="800px" placeholder="Bug title"></asp:TextBox>
        <br />
          

        <asp:TextBox ID="txtDescriptionBug" Class="form-control" runat="server" Height="100px" Width="800px" placeholder="Bug description" TextMode="MultiLine"></asp:TextBox>
        <br />
       

        <asp:DropDownList ID="ddPriority" runat="server" Height="40px" Width="800px"></asp:DropDownList>
           
        <br />
        <br />

        <asp:DropDownList ID="ddAssign" runat="server" Height="40px" Width="800px"></asp:DropDownList>
           
        <br />
        <br />

        <asp:Button ID="btnCreateMember" Class="btn btn-default btn-fullscreen" runat="server" Text="Log new Bug" Height="40px" Width="800px"/>
   
            
        <br />
        <asp:Label ID="lbl_feedbackLogNewBug" Class="lblFeedbackProject" runat="server"></asp:Label>
         <br />
         <br />
    </div>



</asp:Content>

