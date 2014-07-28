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
        <asp:TextBox ID="txtTitle" Class="loginField form-control" runat="server" Height="50px" Width="790px" placeholder="Bug title"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldTitle" runat="server" ErrorMessage="*" CssClass="error requiredTitleBug" Display="Static" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
        <br />
          

        <asp:TextBox ID="txtDescriptionBug" Class="form-control" runat="server" Height="100px" Width="790px" placeholder="Bug description" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldDescription" runat="server" ErrorMessage="*"  CssClass="error requiredDescriptionBug"  ControlToValidate="txtDescriptionBug"></asp:RequiredFieldValidator>
        <br />
       

        <asp:DropDownList ID="ddProject" CssClass="dropdown-right" runat="server" Height="40px" Width="690px" DataSourceID="LinqProject" DataTextField="title" DataValueField="pk_project_id" ></asp:DropDownList>
       
        <asp:Label ID="Label1" runat="server" Text="Project" CssClass="lblProject"></asp:Label>
       
        <asp:LinqDataSource ID="LinqProject" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="title" TableName="Projects" Where="fk_projectstatus == @fk_projectstatus">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
       
        <br />
        <br />

        <asp:DropDownList ID="ddPriority" CssClass="dropdown-right" runat="server" Height="40px" Width="690px" DataSourceID="LinqMembers" DataTextField="username" DataValueField="pk_productuser_id"></asp:DropDownList>
           
        <asp:Label ID="Label2"  runat="server" Text="Responsible" CssClass="lblResponsible"></asp:Label>
           
        <asp:LinqDataSource ID="LinqMembers" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="username" Select="new (pk_productuser_id, username)" TableName="ProductUsers">
        </asp:LinqDataSource>
           
        <br />
        <br />

        <asp:DropDownList ID="ddAssign" CssClass="dropdown-right" runat="server" Height="40px" Width="690px" DataSourceID="LinqPriority" DataTextField="priority_name" DataValueField="pk_priority_id"></asp:DropDownList>
           
        <asp:Label ID="Label3" runat="server" Text="Priority" CssClass="lblPriority"></asp:Label>
           
        <asp:LinqDataSource ID="LinqPriority" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_priority_id" Select="new (pk_priority_id, priority_name)" TableName="Priorities">
        </asp:LinqDataSource>
           
        <br />
        <br />

        <asp:Button ID="btnCreateMember" Class="btn btn-default btn-fullscreen btn-margin btn-left" runat="server" Text="Log new Bug" Height="40px" Width="790px" OnClick="btnCreateMember_Click"/>
   
            
        <br />
        <asp:Label ID="lbl_feedbackLogNewBug" Class="lblFeedbackProject" runat="server"></asp:Label>
         <br />
         <br />
    </div>



</asp:Content>

