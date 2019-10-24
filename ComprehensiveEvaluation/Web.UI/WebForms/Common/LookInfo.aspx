<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookInfo.aspx.cs" Inherits="WebForms_Common_LookInfo" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../../script/GridLineHotTrack.js"></script>
    <link href="../../css/style.css" rel="stylesheet" />
        <style>
.location{
    margin-left:140px;
    margin-top:20px;
}
.left{
    margin-left:70px;
    margin-top:25px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="location"><h2>个人信息查看</h2></div>
            <div class="left">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="dataTable" DataSourceID="SqlDataSource1" Height="35px" Width="250px" BackColor="White"  CellPadding="4"  GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields >
                    <asp:BoundField DataField="UserNum" HeaderText="学号" SortExpression="UserNum" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="邮箱" SortExpression="Email" />
                    <asp:BoundField DataField="Mobile" HeaderText="手机号" SortExpression="Mobile" />
                    <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
                </div>
            <br />

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [UserNum], [Name], [Email], [Mobile], [Password] FROM [Users] WHERE ([UserId] = @UserId)">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserCode" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
