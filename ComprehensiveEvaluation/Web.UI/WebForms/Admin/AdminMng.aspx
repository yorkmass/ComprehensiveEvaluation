<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminMng.aspx.cs" Inherits="WebForms_Admin_AdminMng" %>
<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../css/style.css" rel="stylesheet" />
    <script src="../../script/GridLineHotTrack.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                  <h2><asp:Label ID="lblTitle" runat="server" Text="管理员账户管理"></asp:Label></h2><br />
        </div>
        <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default" >
                    <ClientSideEvents ItemClick="function(s,e){
    var itemName = e.item.name;
	switch(itemName){
		case 'AddCollegeAdmin':
			popupUpload.Show();
			e.processOnServer = false;
			break;		
	}
                        }" />
                    <Paddings Padding="5px" PaddingTop="8px" />
                    <Items>                        
                        <dx:MenuItem Name="AddCollegeAdmin" Text="添加管理员">
                            <Image Url="~/images/import.png">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle>
                        <HoverStyle BackColor="#E2F0FF">
                            <border bordercolor="#A3C0E8" />
                        </HoverStyle>
                    </ItemStyle>
                </dx:ASPxMenu>


        <br /><br />

        <cc1:MyGridView ID="MyGridView1" runat="server" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="UserId" DataSourceID="ObjectDataSource1" OnRowCommand="MyGridView1_RowCommand">
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

            <Columns>
                <asp:BoundField DataField="UserNum" HeaderText="学号" SortExpression="UserNum" />
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" />
                 <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                               <asp:LinkButton ID="btnDelete" CausesValidation="false" runat="server"  CommandName="DeleteRecord" Text="删除"  CommandArgument='<%# Eval("UserId") %>'></asp:LinkButton>                        
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>

<EditRowStyle CssClass="highlightRow"></EditRowStyle>

<HeaderStyle CssClass="headerRow"></HeaderStyle>

<PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>

<PagerStyle CssClass="pagerRow"></PagerStyle>

<SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
        </cc1:MyGridView>




        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSAdminTableAdapters.AdminMangerTableAdapter"></asp:ObjectDataSource>




        <dx:ASPxPopupControl ID="popupUpload" runat="server" AllowDragging="true" CloseAction="CloseButton" HeaderText="导入" Height="130px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" Width="473px">
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="popupControlContenControl1" runat="server" SupportsDisabledAttribute="True">
                            <p>
                                工号：<asp:TextBox ID="txtUserNum" runat="server" MaxLength="4"></asp:TextBox>
                                &nbsp;姓名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </p>
                            <p>
                                密码：<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                &nbsp;</p>
                            <asp:LinkButton ID="btnUpload" runat="server" OnClick="btnUpload_Click">添加</asp:LinkButton>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>

        <uc1:MessageBoxControl ID="MessageBox" runat="server" />
    </form>
</body>
</html>
