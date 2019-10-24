<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CollegeAdminMng.aspx.cs" Inherits="WebForms_Admin_CollegeAdminMng" %>

<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="../../css/style.css" rel="stylesheet" />
    <script src="../../script/GridLineHotTrack.js"></script>
    <title></title>
        <style type="text/css">
        .highlightRow {
            cursor: pointer;
        }
        .auto-style1 {
            margin-left: 5px;
        }
        .auto-style2 {
            margin-left: 4px;
        }
        .texts{
            margin-left:15px;
        }
        .buju{
            margin-left:10px;
            margin-top:20px;
           
        }
        .out{
            clear:both;
        }
        .left{
            float:left;
        }
        .left1{
            float:left;
            margin-left:20px;
        }
        
        </style>
    <style type="text/css">


.dxmLite,
.dxmLite .dxm-item a.dx 
{
	color: Black;
}
.dxmLite
{
	font: 12px Tahoma, Geneva, sans-serif;
}
.dxmLite .dxm-main.dxmtb 
{
	padding: 2px;
}
.dxmLite .dxm-main
{
	border: 1px solid #A8A8A8;
	background-color: #F0F0F0;
	padding: 2px;
}

.dxm-ltr .dxm-main,
.dxm-ltr .dxm-horizontal ul.dx 
{
	float: left;
}
.dxm-main
{
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
.dxm-ltr .dxm-horizontal .dxm-item,
.dxm-ltr .dxm-horizontal .dxm-spacing,
.dxm-ltr .dxm-horizontal .dxm-separator,
.dxm-ltr .dxm-content
{
	float: left;
}
.dxmLite .dxm-item,
.dxmLite .dxm-popOut 
{
	border-color: transparent;
	border-style: solid;
}

.dxmLite .dxm-item 
{
	border-width: 1px;
}

.dxmLite .dxm-item 
{
	cursor: default;
    text-align: left;
}

.dxmLite .dxm-content
{
    display: block;
	white-space: nowrap;
}

.dxm-content.dxm-hasText
{
	line-height: 100%;
}

.dxm-content
{
	line-height: 0;
}

.dxm-content {
	font: 12px Tahoma, Geneva, sans-serif;
	float: none !important;
}

a, a:visited {
	color: #07519A;
	text-decoration: none;
    text-align: left;
}
a > .dx-vam, a > .dx-vat, a > .dx-vab 
{ 
    /* Q556373 */
    line-height: 135%\9!important;
    display: inline\9!important;
    padding: 0\9!important;
    
}

.dxm-image,
.dxm-pImage 
{
	border-width: 0px;
}

.dx-vam, .dx-valm { vertical-align: middle; }
.dx-vam, .dx-vat, .dx-vab { display: inline-block!important; }

.dxmLite .dxmtb.dxm-horizontal .dxm-spacing 
{
	width: 4px;
    min-width: 4px;
	height: 23px;
}
.dxmLite .dxm-horizontal .dxm-spacing 
{
	width: 2px;
    min-width: 2px;
	height: 1px;
}
.dxm-spacing
{
    cursor: default;
}

.dxm-popOut,
.dxm-spacing,
.dxm-separator,
.dxm-separator b 
{
	font-size: 0;
	line-height: 0;
	display: block;
}
.dx-clear
{
	display: block;
	clear: both;
	height: 0;
	width: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	visibility: hidden;
}
        
.dxpcLite_Aqua .dxpc-header.dxpc-withBtn,
.dxdpLite_Aqua .dxpc-header.dxpc-withBtn 
{
	padding-bottom: 4px;
}

.dxpcLite_Aqua .dxpc-header,
.dxdpLite_Aqua .dxpc-header 
{
	color: #283B56;
	background: #E2F0FF;
    
	border-bottom: 1px solid #A3C0E8;
	padding: 5px 2px 7px 12px;
}

p {
	font-size: 12px;
	line-height: 20px;
    text-align: left;
            width: 442px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                  <h2><asp:Label ID="lblTitle" runat="server" Text="学院管理员账户管理"></asp:Label></h2><br />

            <div>
                <div class="left">
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
                        <dx:MenuItem Name="AddCollegeAdmin" Text="添加院级管理员">
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
                    </div>
                <div class="left1">
                    <dx:ASPxMenu ID="ASPxMenu1" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default" OnItemClick="ASPxMenu1_ItemClick" >
  
                    <Paddings Padding="5px" PaddingTop="8px" />
                    <Items>                        
                        <dx:MenuItem Name="AddCollegeAdmin" Text="删除院级管理员">
                            <Image Url="~/images/close.gif">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle>
                        <HoverStyle BackColor="#E2F0FF">
                            <border bordercolor="#A3C0E8" />
                        </HoverStyle>
                    </ItemStyle>
                </dx:ASPxMenu>

                </div>
                <div class="out"></div>
            </div>
                <br />
            <br />
                <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" DataSourceID="sdsCollegeAdmin" Theme="Aqua"  >
                    <SettingsDataSecurity AllowEdit="False" />
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="UserNum" Caption="工号" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Name" Caption="姓名" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RoleName" Caption="角色" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Password" Caption="密码" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="BranchName" Caption="学院名称" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                    </Columns>

                </dx:ASPxGridView>

          

 

            

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSAdminTableAdapters.CollegeAdminTableAdapter"></asp:ObjectDataSource>

            <cc1:MyGridView ID="MyGridView1" runat="server" CssClass="dataTable" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" OnRowCommand="MyGridView1_RowCommand" Visible="False">
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

                <Columns>
                    <asp:BoundField DataField="UserNum" HeaderText="学号" SortExpression="UserNum" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                    <asp:BoundField DataField="RoleName" HeaderText="角色" SortExpression="RoleName" />
                    <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" />
                    <asp:BoundField DataField="BranchName" HeaderText="学院名称" SortExpression="BranchName" />
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


            <asp:SqlDataSource ID="sdsCollegeAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Users.UserNum, Users.Name, Roles.RoleName, Users.Password, Branches.BranchName FROM Users INNER JOIN UsersInRoles ON Users.UserId = UsersInRoles.UserId INNER JOIN Roles ON UsersInRoles.RoleId = Roles.RoleId INNER JOIN BranchUsers ON Users.UserId = BranchUsers.UserId INNER JOIN Branches ON BranchUsers.BranchId = Branches.BranchId WHERE (UsersInRoles.RoleId = '6E902DE1-8934-4695-AB7A-4EDF99B71543')"></asp:SqlDataSource>
                <br />
                <dx:ASPxPopupControl ID="popupUpload" runat="server" AllowDragging="true" CloseAction="CloseButton" HeaderText="导入" Height="130px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" Width="473px">
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="popupControlContenControl1" runat="server" SupportsDisabledAttribute="True">
                            <p>
                                工号：<asp:TextBox ID="txtUserNum" runat="server" MaxLength="4"></asp:TextBox>
                                &nbsp;姓名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </p>
                            <p>
                                密码：<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                &nbsp;学院：<asp:DropDownList ID="dplCollege" runat="server" DataSourceID="sdsCollege" DataTextField="BranchName" DataValueField="BranchId">
                                    <asp:ListItem Value="2">机关</asp:ListItem>
                                    <asp:ListItem Value="3">矿业工程学院</asp:ListItem>
                                    <asp:ListItem Value="3">冶金与能源学院</asp:ListItem>
                                    <asp:ListItem Value="4">机械工程学院</asp:ListItem>
                                    <asp:ListItem Value="5"></asp:ListItem>
                                    <asp:ListItem Value="6"></asp:ListItem>
                                    <asp:ListItem Value="7"></asp:ListItem>
                                    <asp:ListItem Value="8"></asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <asp:LinkButton ID="btnUpload" runat="server" OnClick="btnUpload_Click">添加</asp:LinkButton>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                <uc1:MessageBoxControl ID="MessageBox" runat="server" />
        </div>
        <asp:SqlDataSource ID="sdsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [BranchName], [BranchId] FROM [Branches] WHERE ([ParentBranchId] = @ParentBranchId)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ParentBranchId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
