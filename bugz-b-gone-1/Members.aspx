<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Members" %>

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
                    <li class="active"><a href="Members.aspx">Members</a></li>
           
                    <% 
                        } 
                    %>
                    <li id="rightMenu"><a href="LogNewBug.aspx">Log new bug</a></li>
                </ul>
            </div>
        </nav>


        <div class="page-header">
          <h1><small> Create member </small></h1>
        </div>

        <div class="createProject">
            <asp:TextBox ID="txtUsername" Class="loginField form-control" runat="server" Height="50px" Width="800px" placeholder="Username"></asp:TextBox>
            <br />
           
            <asp:TextBox ID="txtPassword" Class="form-control" runat="server" Height="50px" Width="800px" placeholder="Password"></asp:TextBox>
            <br />

            <asp:DropDownList ID="ddStatus" runat="server" Height="40px" Width="800px"></asp:DropDownList>
           
            <br />
            <br />
            <asp:Button ID="btnCreateMember" Class="btn btn-default btn-fullscreen" runat="server" Text="Create new member" Height="40px" Width="800px"/>
   
            
             <br />
            <asp:Label ID="lbl_feedbackCreateMember" Class="lblFeedbackProject" runat="server"></asp:Label>
        </div>

        <div class="page-header">
          <h1><small>Add member to project</small></h1>
        </div>
    
        <div>
            <asp:DropDownList ID="ddMember" runat="server" Height="40px" Width="800px"></asp:DropDownList>
           
            <br />
             <br />
            <asp:DropDownList ID="ddProject" runat="server" Height="40px" Width="800px"></asp:DropDownList>
           
            <br />
            <br />
            <asp:Button ID="btbAddMemberToProject" Class="btn btn-default btn-fullscreen" runat="server" Text="Add member to project" Height="40px" Width="800px"/>
   
            
             <br />
            <asp:Label ID="lbl_feedbackMemberToProject" Class="lblFeedbackProject" runat="server"></asp:Label>
            <br /><br />
        </div>

</asp:Content>

