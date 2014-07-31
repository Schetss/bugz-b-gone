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

    <asp:Label ID="lblDescrip" runat="server" Text=""></asp:Label>

    <div>
        <br />
        <br />
    <div>
       <h4>Comments</h4>
    </div>
    
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="pk_reaction_id" DataSourceID="LinqComments">
                <LayoutTemplate>
                    <ul class="commentList">
                        <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                      <span class="commentInfo"> Comment by <span class="commentuser"><%# Eval("Productuser.username")%></span>  placed on <%# Eval("date") %></span> <br /> <span class="commentText"><%# Eval("reaction") %> </span>  <br /> <hr /> 
                    </li>
                </ItemTemplate>
        </asp:ListView>

    



        <asp:LinqDataSource ID="LinqComments" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" OrderBy="date" TableName="Reaction1s" Where="fk_bug == @fk_bug1">
            <WhereParameters>
                <asp:QueryStringParameter Name="fk_bug1" QueryStringField="pk_bug_id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

    



    </div>



    <div>
        <h4>Add comment</h4>

        <br />

        <asp:TextBox ID="txtComment" Class="form-control" runat="server" Height="100px" Width="790" placeholder="Bug description" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldComment" runat="server" ErrorMessage="*"  CssClass="error requiredDescriptionBug"  ControlToValidate="txtComment" ValidationGroup="Comment"></asp:RequiredFieldValidator>

        <br />

        <asp:Button ID="btnResponse" runat="server" Class="btn btn-default btn-fullscreen btn-margin btn-left" Height="40px" Text="Add comment" Width="790px"  ControlToValidate="txtResponse" ValidationGroup="Comment" OnClick="btnResponse_Click"/>

        <asp:Label ID="lblFeedbackComment" runat="server" Text=""></asp:Label>


        <h4 Class="subheader">Change Bug</h4>
        <br />
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

                <asp:Label ID="lblFeedbackChange" runat="server" Text=""></asp:Label>


    </div>

</asp:Content>

