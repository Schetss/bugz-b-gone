<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Bugs.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
        <ul class="nav navbar-nav">
            <li class="active"><a href="Bugs.aspx">Bugs</a></li>
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
            <li id="rightMenu" ><a href="LogNewBug.aspx">Log new bug</a></li>
        </ul>
        </div>
    </nav>

    <asp:Button ID="btnOpen" Class="btn btn-default" runat="server" Text="Open cases"/>
    <asp:Button ID="btnCLosed" Class="btn btn-default" runat="server" Text="Closed cases"/>
    <asp:Button ID="btnMine" Class="btn btn-default" runat="server" Text="My cases"/>
    <asp:Button ID="btnAll" Class="btn btn-default" runat="server" Text="All cases"/>
       
   
   

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqOpenBugs" Width="800px" BorderColor="White">
        <Columns>
            <asp:BoundField DataField="pk_bug_id" HeaderText="Bug" ReadOnly="True" SortExpression="pk_bug_id" />
            <asp:BoundField DataField="title" HeaderText="Title" ReadOnly="True" SortExpression="title" />
            <asp:BoundField DataField="fk_creator" HeaderText="Owner" ReadOnly="True" SortExpression="fk_creator" />
            <asp:BoundField DataField="fk_responsible" HeaderText="Responsible" ReadOnly="True" SortExpression="fk_responsible" />
            <asp:BoundField DataField="fk_priority" HeaderText="Priority" ReadOnly="True" SortExpression="fk_priority" />
            <asp:BoundField DataField="fk_bugstatus" HeaderText="Status" ReadOnly="True" SortExpression="fk_bugstatus" />
        </Columns>
        <HeaderStyle BackColor="#CCCCCC" BorderColor="White" />
        <RowStyle Height="30px" />
        <SelectedRowStyle Height="30px" BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:LinqDataSource ID="LinqOpenBugs" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" Select="new (pk_bug_id, title, fk_creator, fk_responsible, fk_priority, fk_bugstatus)" TableName="Bugs" Where="fk_bugstatus == @fk_bugstatus">
        <WhereParameters>
            <asp:Parameter DefaultValue="1" Name="fk_bugstatus" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
       
   
   

    <br />
           
   
   

</asp:Content>

