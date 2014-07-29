<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BugOverview.aspx.cs" Inherits="BugOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
        <ul class="nav navbar-nav">
            <li  class="active"><a href="Bugs.aspx">Bugs</a></li>
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
            <li id="rightMenu"><a href="LogNewBug.aspx">Log new bug</a></li>
        </ul>
        </div>
    </nav>

    <div class="page-header">
        <h1><small> <asp:Label ID="lblBugOverview" runat="server" Text=""></asp:Label></small></h1>



    </div>

    <div>
       <h4>Description</h4>
    </div>


    <div>
        Comments





    </div>



    <div>
        <h4>Add response</h4>


        <asp:TextBox ID="txtResponse" Class="form-control" runat="server" Height="100px" Width="800px" placeholder="Bug description" TextMode="MultiLine"></asp:TextBox>
        <br />

        <asp:Button ID="btnResponse" runat="server" Class="btn btn-default btn-fullscreen btn-margin" Height="40px" Text="Save Bug" Width="800px" />


        <h4>Change Bug</h4>
 
        <asp:DropDownList ID="ddOpenSolved" runat="server" Height="40px" Width="800px" DataSourceID="LinqPriority" DataTextField="priority_name" DataValueField="pk_priority_id"></asp:DropDownList>
        
        <asp:LinqDataSource ID="LinqPriority" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" Select="new (pk_priority_id, priority_name)" TableName="Priorities">
        </asp:LinqDataSource>
        
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="800px" DataSourceID="LinqStatus" DataTextField="bugstatus_name" DataValueField="pk_bugstatus_id"></asp:DropDownList>


        <asp:LinqDataSource ID="LinqStatus" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" Select="new (bugstatus_name, pk_bugstatus_id)" TableName="Bugstatus">
        </asp:LinqDataSource>
        <br />
        <br />
        <asp:Button ID="btnSave" runat="server" Class="btn btn-default btn-fullscreen btn-margin" Height="40px" Text="Save Bug" Width="800px" />


    </div>

</asp:Content>

