﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

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

            <li class="active"><a href="Projects.aspx">Projects</a></li>
            <li><a href="Members.aspx">Members</a></li>
           
            <% 
                } 
            %>
            <li id="rightMenu"  <% if ((Session["Status"].ToString() == "1")) { %> class="moreRight" <% } %>><a href="LogNewBug.aspx">Log new bug</a></li>
        </ul>
        </div>
    </nav>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div class="page-header">
      <h1><small> Create project</small></h1>
    </div>

    <div class="createProject">
        <asp:TextBox ID="txtTitleProject" Class="loginField form-control" runat="server" Height="50px" Width="790px" placeholder="Project title" ValidationGroup="createProjet"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldTitleProject" runat="server" ErrorMessage="*" CssClass="error RequiredFieldTitleProject" ControlToValidate="txtTitleProject" ValidationGroup="createProjet"></asp:RequiredFieldValidator>
        <br />
           
        <asp:TextBox ID="txtDescriptionProject" Class="form-control" runat="server" Height="100px" Width="790px" placeholder="Project description" TextMode="MultiLine" ValidationGroup="createProjet"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldtxtDescriptionProject" runat="server" CssClass="error RequiredFieldDescriptionProject" ErrorMessage="*" ControlToValidate="txtDescriptionProject" ValidationGroup="createProjet"></asp:RequiredFieldValidator>
        <br />
        
        <asp:Button ID="btnCreateProject" Class="btn btn-default btn-fullscreen btn-left btn-CreateProject" runat="server" Text="Create new project" Height="40px" Width="790px" OnClick="btnCreateProject_Click" ValidationGroup="createProjet" />
   
        <asp:Label ID="lbl_feedbackCreateProject" Class="lblFeedbackProject" runat="server"></asp:Label>
   
    </div>

    <div class="page-header">
      <h1><small>Projects overview</small></h1>
    </div>
    
    <div>
         
               <asp:GridView ID="GridActiveProjects" runat="server" AutoGenerateColumns="False" CellPadding="25" CellSpacing="10" BorderColor="White" DataSourceID="LinqActiveProjects" Width="790px">
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" ReadOnly="True" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" ReadOnly="True" />
                </Columns>
                <RowStyle Height="35px" />
            </asp:GridView>



        <asp:LinqDataSource ID="LinqActiveProjects" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="title" Select="new (title, description)" TableName="Projects" Where="fk_projectstatus == @fk_projectstatus">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />

        <asp:DropDownList ID="ddActiveProjects" Class="ddProjects" runat="server" Height="40px" Width="400px" DataSourceID="LinqDDActive" DataTextField="title" DataValueField="pk_project_id"></asp:DropDownList>
        <asp:LinqDataSource ID="LinqDDActive" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="title" TableName="Projects" Where="fk_projectstatus == @fk_projectstatus">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:Button ID="btnActiveProjects" Class="btn btn-default btn-fullscreen btn-changeproject" runat="server" Text="Set project to non-active" Height="40px" Width="340px" OnClick="btnActiveProjects_Click1" />
   
        <br />
        <br />
   
        <asp:Label ID="lbl_feedbackActiveProject" Class="lblFeedbackProject" runat="server"></asp:Label>
   
    


        <hr />

    

        
        <asp:Button ID="btnSetProjectToActive" Class="btn btn-default btn-fullscreen btn-changeproject" runat="server" Text="Set project to active" Height="40px" Width="340px" OnClick="Button1_Click" />
   
        <asp:DropDownList ID="ddNonActiveProjects" CssClass="ddProjects" runat="server" Height="40px" Width="400px" DataSourceID="LinqDDNoneActive" DataTextField="title" DataValueField="pk_project_id">
        </asp:DropDownList>
        <asp:LinqDataSource ID="LinqDDNoneActive" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="title" TableName="Projects" Where="fk_projectstatus == @fk_projectstatus">
            <WhereParameters>
                <asp:Parameter DefaultValue="2" Name="fk_projectstatus" Type="Int32" />
            </WhereParameters>
      </asp:LinqDataSource>
        <br />
   
        <asp:Label ID="lbl_feedbackNonActiveProject" Class="lblFeedbackProject lbl_feedbackNonActiveProject" runat="server"></asp:Label>
   
         <br />  <br />  <br />
    </div>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>

