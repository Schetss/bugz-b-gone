<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
          <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="Bugs.aspx">Bugs</a></li>
                   <%   
                       if (Session["Status"] == null || Session["Status"].ToString() == "1")
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
                    <li id="rightMenu"  <% if ((Session["Status"].ToString() == "1")) { %> class="moreRight" <% } %>><a href="LogNewBug.aspx">Log new bug</a></li>
                </ul>
            </div>
        </nav>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
         

        <div class="page-header">
          <h1><small> Create member </small></h1>
        </div>

        <div class="createProject">
            <asp:TextBox ID="txtUsername" Class="loginField form-control" runat="server" Height="50px" Width="790px" placeholder="Username" ValidationGroup="create"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="error requiredUsername" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
            <br />
           
            <asp:TextBox ID="txtPassword" Class="form-control" runat="server" Height="50px" Width="790px" placeholder="Password" ValidationGroup="create"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"  CssClass="error requiredPassword" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <br />

            <asp:DropDownList ID="ddStatus"  CssClass="dropdown-right" runat="server" Height="40px" Width="690px" DataSourceID="LinqStatus" DataTextField="usertype_name" DataValueField="pk_usertype_id" ValidationGroup="create"></asp:DropDownList>
           
            <asp:Label CssClass="lblUsertype" ID="Label1" runat="server" Text="Usertype"></asp:Label>
           
            <asp:LinqDataSource ID="LinqStatus" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_usertype_id" TableName="Usertypes">
            </asp:LinqDataSource>
           
            <br />
            <br />
            <asp:Button ID="btnCreateMember" Class="btn btn-default btn-fullscreen btn-margin btn-left" runat="server" Text="Create new member" Height="40px" Width="790px" OnClick="btnCreateMember_Click" ValidationGroup="create"/>
   
            
             <br />
   
            
             <br />
            <asp:Label ID="lbl_feedbackCreateMember" Class="lblFeedbackProject" runat="server"></asp:Label>
        </div>

        <div class="page-header">
          <h1><small>Add member to project</small></h1>
        </div>
    
        <div>
            <asp:Label ID="Label2" CssClass="lblMember" runat="server" Text="Member"></asp:Label>
            <asp:DropDownList ID="ddMember"  CssClass="dropdown-right" runat="server" Height="40px" Width="690px" DataSourceID="LinqMembers" DataTextField="username" DataValueField="pk_productuser_id" ValidationGroup="add"></asp:DropDownList>
           
            <asp:LinqDataSource ID="LinqMembers" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="username" TableName="ProductUsers">
            </asp:LinqDataSource>
           
            <br />
             <br />
            <asp:DropDownList ID="ddProject"  CssClass="dropdown-right" runat="server" Height="40px" Width="690px" DataSourceID="LinqProjects" DataTextField="title" DataValueField="pk_project_id" ValidationGroup="add"></asp:DropDownList>
           
            <asp:Label ID="Label3" runat="server" CssClass="lblProjec" Text="Project"></asp:Label>
           
            <asp:LinqDataSource ID="LinqProjects" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="title" TableName="Projects" Where="fk_projectstatus == @fk_projectstatus">
                <WhereParameters>
                    <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
           
            <br />
            <br />
            <asp:Button ID="btbAddMemberToProject" Class="btn btn-default btn-fullscreen btn-margin btn-left" runat="server" Text="Add member to project" Height="40px" Width="790px" OnClick="btbAddMemberToProject_Click" ValidationGroup="add"/>
   
            
             <br />
            <asp:Label ID="lbl_feedbackMemberToProject" Class="lblFeedbackProject" runat="server"></asp:Label>
            <br /><br />
        </div>
    </ContentTemplate></asp:UpdatePanel>

</asp:Content>

