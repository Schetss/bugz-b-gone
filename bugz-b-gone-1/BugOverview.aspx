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
            <li id="rightMenu"  <% if ((Session["Status"].ToString() == "1")) { %> class="moreRight" <% } %>><a href="LogNewBug.aspx">Log new bug</a></li>
        </ul>
        </div>
    </nav>
    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div class="page-header">
        <h1><small> <asp:Label ID="lblBugOverview" runat="server" Text=""></asp:Label>&nbsp;-&nbsp;<asp:Label ID="lblOverviewPrior" runat="server" Text=""></asp:Label> </small></h1>

      <asp:Label ID="lblStat" CssClass="lblRight" runat="server" Text=""></asp:Label>

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


        <div>
            <h4>Change bugstatus</h4>
              <br />
            <asp:DropDownList ID="ddStatus" CssClass="btn-left dd" runat="server" Height="40px" Width="370px" DataSourceID="LinqStatus" DataTextField="bugstatus_name" DataValueField="pk_bugstatus_id"></asp:DropDownList>
            <asp:Button ID="btnChangeStatus" runat="server" Class="btn btn-default btn-fullscreen btn-margin btn-right" Height="40px" Text="Change bug status" Width="370px" OnClick="btnChangeStatus_Click" />
            <asp:Label ID="lblFeedbackStatus" runat="server" Text=""></asp:Label>
        </div>
        
            <asp:LinqDataSource ID="LinqStatus" runat="server" ContextTypeName="BugzDataContext" EntityTypeName="" Select="new (bugstatus_name, pk_bugstatus_id)" TableName="Bugstatus">
            </asp:LinqDataSource>

        <asp:PlaceHolder ID="PlaceholderChange" runat="server">
            <h4>Close bug</h4>
            <br />
            <asp:Button ID="btnSave" runat="server" Class="btn btn-default btn-fullscreen btn-margin btn-left" Height="40px" Text="Close Bug" Width="790px" OnClick="btnSave_Click" />

            <asp:Label ID="lblFeedbackClose" runat="server" Text=""></asp:Label>
        </asp:PlaceHolder>

        </div>
  </ContentTemplate></asp:UpdatePanel>


</asp:Content>

