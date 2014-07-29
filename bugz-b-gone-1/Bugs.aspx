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

    <asp:Button ID="btnMine" Class="btn btn-default" runat="server" Text="My cases" OnClick="btnMine_Click"/>
    <asp:Button ID="btnOpen" Class="btn btn-default" runat="server" Text="Open cases" OnClick="btnOpen_Click"/>
    <asp:Button ID="btnCLosed" Class="btn btn-default" runat="server" Text="Closed cases" OnClick="btnCLosed_Click"/>
    <asp:Button ID="btnAll" Class="btn btn-default" runat="server" Text="All cases" OnClick="btnAll_Click"/>
       
   
   

    <br />
    <br />



    <asp:Label ID="lblBugShowName" Class="lblBugShowName" runat="server" Text="My cases" CssClass="lblBugShowName"></asp:Label>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqMy">
        
        <LayoutTemplate>
            <table id="bugtable" class="bugtable">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Title</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Owner</th>
                        <th>Responsible</th>
                    </tr>
                </thead> 
                <tbody>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </tbody>
            </table>
        </LayoutTemplate>
    
        <ItemTemplate>
            <tr>
                <td>
                  <asp:Label ID="lblBugNr" runat="server" Text='<%# Eval("pk_bug_id") %>'></asp:Label>
                </td>

                <td>
                   <a href="BugOverview.aspx?pk_bug_id=<%# Eval("pk_bug_id") %>"> <%# Eval("title") %></a>
                </td>
                
                <td>
                    <asp:Label ID="lblPriority" runat="server" Text='<%# Bind("Priority.priority_name") %>' ></asp:Label>
                </td>

                <td>
                   <asp:Label ID="lblOpenClosed" runat="server" Text='<%# Bind("Bugstatus.bugstatus_name") %>'></asp:Label>
                </td>

                <td>
                   <asp:Label ID="lblCreator" runat="server" Text='<%# Bind("ProductUser.username") %>'></asp:Label>
                </td>

                <td>
                    <asp:Label ID="lblResponsible" runat="server" Text='<%# Bind("ProductUser1.username") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate> 
    </asp:ListView>







    
    <!-- LINQ ONLY OPEN BUGS -->

    <asp:LinqDataSource ID="LinqOpen" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_bug_id" Select="new (pk_bug_id, title, fk_priority, fk_creator, fk_responsible, Priority, fk_bugstatus, Bugstatus, ProductUser1, ProductUser)" TableName="Bugs" Where="openclosed == @openclosed">
        <WhereParameters>
            <asp:Parameter DefaultValue="1" Name="openclosed" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    


    <!-- LINQ ONLY CLOSED BUGS -->

    <asp:LinqDataSource ID="LinqClosed" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_bug_id" Select="new (pk_bug_id, fk_project, fk_creator, fk_responsible, fk_priority, fk_bugstatus, Bugstatus, Priority, ProductUser, ProductUser1, openclosed, title)" TableName="Bugs" Where="openclosed == @openclosed">
        <WhereParameters>
            <asp:Parameter DefaultValue="0" Name="openclosed" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    


    <!-- LINQ ALL BUGS -->

    <asp:LinqDataSource ID="LinqAll" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_bug_id" Select="new (pk_bug_id, title, fk_project, fk_creator, fk_responsible, fk_priority, fk_bugstatus, openclosed, Bugstatus, Priority, ProductUser, ProductUser1)" TableName="Bugs">
    </asp:LinqDataSource>



    <!-- LINQ ONLY LOGGED IN USER IS RESPONSIBLE -->
    
    <asp:LinqDataSource ID="LinqMy" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="pk_bug_id" Select="new (title, pk_bug_id, fk_creator, fk_responsible, fk_priority, fk_bugstatus, openclosed, Bugstatus, Priority, ProductUser, ProductUser1)" TableName="Bugs" Where="fk_responsible == @fk_responsible">
        <WhereParameters>

            <asp:SessionParameter Name="fk_responsible" SessionField="userID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    

</asp:Content>

