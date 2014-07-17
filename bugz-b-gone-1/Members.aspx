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

            <asp:DropDownList ID="ddStatus" runat="server" Height="40px" Width="800px" DataSourceID="LinqStatus" DataTextField="usertype_name" DataValueField="pk_usertype_id"></asp:DropDownList>
           
            <asp:LinqDataSource ID="LinqStatus" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_usertype_id" TableName="Usertypes">
            </asp:LinqDataSource>
           
            <br />
            <br />
            <asp:Button ID="btnCreateMember" Class="btn btn-default btn-fullscreen btn-margin" runat="server" Text="Create new member" Height="40px" Width="800px" OnClick="btnCreateMember_Click"/>
   
            
             <br />
   
            
             <br />
            <asp:Label ID="lbl_feedbackCreateMember" Class="lblFeedbackProject" runat="server"></asp:Label>
        </div>

        <div class="page-header">
          <h1><small>Add member to project</small></h1>
        </div>
    
        <div>
            <asp:DropDownList ID="ddMember" runat="server" Height="40px" Width="800px" DataSourceID="LinqMembers" DataTextField="username" DataValueField="pk_productuser_id"></asp:DropDownList>
           
            <asp:LinqDataSource ID="LinqMembers" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="username" TableName="ProductUsers">
            </asp:LinqDataSource>
           
            <br />
             <br />
            <asp:DropDownList ID="ddProject" runat="server" Height="40px" Width="800px" DataSourceID="LinqProjects" DataTextField="title" DataValueField="pk_project_id"></asp:DropDownList>
           
            <asp:LinqDataSource ID="LinqProjects" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="title" TableName="Projects" Where="fk_projectstatus == @fk_projectstatus">
                <WhereParameters>
                    <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
           
            <br />
            <br />
            <asp:Button ID="btbAddMemberToProject" Class="btn btn-default btn-fullscreen btn-margin" runat="server" Text="Add member to project" Height="40px" Width="800px" OnClick="btbAddMemberToProject_Click"/>
   
            
             <br />
            <asp:Label ID="lbl_feedbackMemberToProject" Class="lblFeedbackProject" runat="server"></asp:Label>
            <br /><br />
        </div>

</asp:Content>

