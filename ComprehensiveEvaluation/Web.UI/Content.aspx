<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Content" %>
<%@ Register Assembly="Infrastructure" Namespace="Infrastructure.Controls" TagPrefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
    <script src="script/jquery.js"></script>
    <script src="script/GridLineHotTrack.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>欢迎使用</h2>
            <p>欢迎使用华北理工大学学生综合测评管理系统！</p>
      <asp:Label ID="Label1" runat="server"  ForeColor="#993300"></asp:Label></span><asp:Label ID="Label2" runat="server" ForeColor="#993300"></asp:Label></p>
        </div>


            <h2><a href="WebForms/Common/MoreInformation.aspx">新闻消息</a></h2>
            <cc1:MyGridView ID="gvInformation" runat="server" AutoGenerateColumns="False" DataKeyNames="InformationID"
                DataSourceID="sdsInformation" ShowHeader="False" GridLines="None" CellPadding="4" Width="560px" CssClass="listTable" AllowPaging="True" EmptyDataText="没有任何新闻消息">
                <AlternatingRowStyle CssClass="itemRow" />
                <Columns>
                    <asp:TemplateField HeaderText="InformationID" InsertVisible="False" SortExpression="InformationID"
                        Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("InformationID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("InformationID") %>'></asp:Label>
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
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("InformationID", "WebForms/Common/ShowInformationDetail.aspx?InformationID={0}") %>'
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
                <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                <HeaderStyle CssClass="headerRow"></HeaderStyle>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                <PagerStyle CssClass="listPagerRow" HorizontalAlign="Right" VerticalAlign="Middle" />
                <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
            </cc1:MyGridView>


    
    <asp:SqlDataSource ID="sdsInformation" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>"
                SelectCommand="SELECT InformationID, Title, Author, SubmitDate, CASE WHEN DATEDIFF(day , Information.SubmitDate , getdate()) &lt;= 7 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS IsNew FROM Information WHERE (ForStudent = 1) ORDER BY SubmitDate DESC"></asp:SqlDataSource>
    </form>
</body>
</html>
