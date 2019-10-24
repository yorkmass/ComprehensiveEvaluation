<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SemesterStatus.aspx.cs" Inherits="WebForms_Admin_SemesterStatus" %>

<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../css/style.css" rel="stylesheet" />
    <script src="../../script/GridLineHotTrack.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <h2>学期管理</h2></p>
        <p>
                        <dx:ASPxMenu ID="mnuSemester" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default"  OnItemClick="mnuSemester_ItemClick">
                <ClientSideEvents ItemClick="function(s,e){
    var itemName = e.item.name;
	switch(itemName){
		case 'Add':
			popupUpadd.Show(); 
			e.processOnServer = false;
			break;
	}
                    }" />
                <Paddings Padding="5px" PaddingTop="8px" />
                <Items>
                    <dx:MenuItem Name="Add" Text="添加新学期">
                        <Image Url="~/images/import.png">
                        </Image>
                    </dx:MenuItem>
                </Items>
            </dx:ASPxMenu>                         
        </p>
        <p>
            <cc1:MyGridView ID="mgvSemester" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="Semester" DataSourceID="sdsSemester">
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

                <Columns>
                    <asp:BoundField DataField="Semester" HeaderText="学期" ReadOnly="True" SortExpression="Semester" />
                    <asp:CheckBoxField DataField="SStatus" HeaderText="状态" SortExpression="SStatus" />
                    <asp:CheckBoxField DataField="IsCalculateScore" HeaderText="是否可以计算综测成绩" SortExpression="IsCalculateScore" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>

<EditRowStyle CssClass="highlightRow"></EditRowStyle>

<HeaderStyle CssClass="headerRow"></HeaderStyle>

<PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>

<PagerStyle CssClass="pagerRow"></PagerStyle>

<SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
            </cc1:MyGridView>
            <asp:SqlDataSource ID="sdsSemester" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" DeleteCommand="DELETE FROM [SemesterStatus] WHERE [Semester] = @Semester" InsertCommand="INSERT INTO [SemesterStatus] ([Semester], [SStatus], [IsCalculateScore]) VALUES (@Semester, @SStatus, @IsCalculateScore)" SelectCommand="SELECT * FROM [SemesterStatus]" UpdateCommand="UPDATE [SemesterStatus] SET [SStatus] = @SStatus, [IsCalculateScore] = @IsCalculateScore WHERE [Semester] = @Semester">
                <DeleteParameters>
                    <asp:Parameter Name="Semester" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Semester" Type="String" />
                    <asp:Parameter Name="SStatus" Type="Boolean" />
                    <asp:Parameter Name="IsCalculateScore" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SStatus" Type="Boolean" />
                    <asp:Parameter Name="IsCalculateScore" Type="Boolean" />
                    <asp:Parameter Name="Semester" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <dx:ASPxPopupControl ID="popupUpadd" runat="server" AllowDragging="true" CloseAction="CloseButton" HeaderText="添加" Height="130px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" Width="410px">
            <contentcollection>
                <dx:PopupControlContentControl ID="popupControlContenControl2" runat="server" SupportsDisabledAttribute="True">
                    <p>
                        <dx:ASPxTextBox ID="txtSemester" runat="server" Theme="Aqua" Width="170px">
                        </dx:ASPxTextBox>
                    </p>
                    <asp:LinkButton ID="btnUpadd0" runat="server" OnClick="btnUpadd_Click">添加</asp:LinkButton>
                </dx:PopupControlContentControl>
            </contentcollection>
        </dx:ASPxPopupControl>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
