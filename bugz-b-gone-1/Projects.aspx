<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

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

            <li class="active"><a href="Projects.aspx">Projects</a></li>
            <li><a href="Members.aspx">Members</a></li>
           
            <% 
                } 
            %>
            <li id="rightMenu"><a href="LogNewBug.aspx">Log new bug</a></li>
        </ul>
        </div>
    </nav>

    <div class="page-header">
      <h1><small> Create project</small></h1>
    </div>

    <div class="createProject">
            <asp:TextBox ID="txtTitleProject" Class="loginField form-control" runat="server" Height="50px" Width="800px" placeholder="Project title"></asp:TextBox>
            <br />
           
            <asp:TextBox ID="txtDescriptionProject" Class="form-control" runat="server" Height="100px" Width="800px" placeholder="Project description" TextMode="MultiLine"></asp:TextBox>
            <br />
        
            <asp:Button ID="btnCreateProject" Class="btn btn-default btn-fullscreen" runat="server" Text="Create new project" Height="40px" Width="800px" OnClick="btnCreateProject_Click" />
   
            <br />
            
   
            <asp:Label ID="lbl_feedbackCreateProject" Class="lblFeedbackProject" runat="server"></asp:Label>
   
    </div>

    <div class="page-header">
      <h1><small> Active projects</small></h1>
    </div>
    
    <div>


        <asp:GridView ID="GridActiveProjects" runat="server" AutoGenerateColumns="False" CellPadding="25" CellSpacing="10" BorderColor="White" DataSourceID="SqlDataSourceActiveProjects" Width="800px">
            <Columns>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            </Columns>
            <RowStyle Height="35px" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceActiveProjects" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT [title], [description] FROM [Project] WHERE ([fk_projectstatus] = @fk_projectstatus) ORDER BY [title]">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

        <asp:DropDownList ID="ddActiveProjects" Class="ddProjects" runat="server" Height="40px" Width="400px" DataSourceID="sqlActiveProjects" DataTextField="title" DataValueField="pk_project_id"></asp:DropDownList>
        <asp:SqlDataSource ID="sqlActiveProjects" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT * FROM [Project] WHERE ([fk_projectstatus] = @fk_projectstatus) ORDER BY [title]">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="fk_projectstatus" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnActiveProjects" Class="btn btn-default btn-fullscreen" runat="server" Text="Set project to non-active" Height="40px" Width="350px" />
   
        <br />
        <br />
   
        <asp:Label ID="lbl_feedbackActiveProject" Class="lblFeedbackProject" runat="server"></asp:Label>
   
    </div>

    <div class="page-header">
      <h1><small> Non-active Projects</small></h1>
    </div>

    

        
        <asp:Button ID="Button1" Class="btn btn-default btn-fullscreen" runat="server" Text="Set project to active" Height="40px" Width="350px" />
   
        <asp:DropDownList ID="ddNonActiveProjects" CssClass="ddProjects" runat="server" Height="40px" Width="400px" DataSourceID="SqlNonActiveProjectsDropDown" DataTextField="title" DataValueField="pk_project_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlNonActiveProjectsDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT * FROM [Project] WHERE ([fk_projectstatus] = @fk_projectstatus) ORDER BY [title]">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="fk_projectstatus" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
   
        <asp:Label ID="lbl_feedbackNonActiveProject" Class="lblFeedbackProject" runat="server"></asp:Label>
   
         <br />  <br />  <br />
    <div>
    </div>

</asp:Content>

