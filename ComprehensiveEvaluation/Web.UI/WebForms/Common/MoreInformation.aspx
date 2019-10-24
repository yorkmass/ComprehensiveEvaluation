<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoreInformation.aspx.cs" Inherits="WebForms_Common_MoreInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../css/style.css" rel="stylesheet" />
    <script src="../../script/jquery.js"></script>
    <script type="text/jscript">
        $(function () {
            $("table[class=listTable]").find('tr').not(".listPagerRow").mouseover(function () {
                $(this).addClass("highlightRow");
            });
            $("table[class=listTable]").find('tr').not(".listPagerRow").mouseout(function () {
                $(this).removeClass("highlightRow");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>新闻消息</h2>
            <asp:GridView ID="gvInformation" runat="server" AutoGenerateColumns="False" DataKeyNames="InformationID"
                DataSourceID="sdsInformation" ShowHeader="False" GridLines="None" CellPadding="4" EmptyDataText="没有任何新闻消息"
                PageSize="15" Width="560px" CssClass="listTable" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="InformationID" InsertVisible="False" SortExpression="InformationID"
                        Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("InformationID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("InformationID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            &nbsp;<asp:Image ID="imgPointer" runat="server" ImageUrl="~/images/pointer.png" Width="7px"
                                Height="9px" ImageAlign="AbsMiddle" />
                        </ItemTemplate>
                        <ItemStyle Width="10px" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/new.gif" Visible='<%# Eval("IsNew") %>' />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("InformationID", "ShowInformationDetail.aspx?InformationID={0}") %>'
                                Text='<%# Eval("Title") %>'></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Author" SortExpression="Author" HeaderText="Author">
                        <ItemStyle VerticalAlign="Middle" Width="40px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SubmitDate" DataFormatString="[{0:yyyy-MM-dd}]" ShowHeader="False"
                        SortExpression="SubmitDate">
                        <ItemStyle VerticalAlign="Middle" Width="70px" />
                    </asp:BoundField>
                </Columns>
                <PagerTemplate>
                    <div style="position: relative; float: left; margin: 3px 5px 0px 5px;">
                        <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                            Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">首页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                            CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">上一页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                            Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">下一页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                            Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">尾页</asp:LinkButton>
                    </div>
                    <div style="position: relative; float: right; margin: 0px 5px 0px 5px;">
                        <asp:Label ID="MessageLabel" Text="页码:" runat="server" />
                        <asp:DropDownList ID="PageDropDownList" AutoPostBack="true" runat="server" />
                        &nbsp;&nbsp;(<asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>&nbsp;/&nbsp;
                                <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>)
                    </div>
                </PagerTemplate>
                <PagerStyle CssClass="listPagerRow" HorizontalAlign="Right" VerticalAlign="Middle" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsInformation" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>"
                SelectCommand="SELECT InformationID, Title, Author, SubmitDate, CASE WHEN DATEDIFF(day , Information.SubmitDate , getdate()) &lt;= 7 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS IsNew FROM Information WHERE (ForStudent = 1) ORDER BY SubmitDate DESC"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
