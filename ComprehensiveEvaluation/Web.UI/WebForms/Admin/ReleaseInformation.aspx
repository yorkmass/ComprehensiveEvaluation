<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReleaseInformation.aspx.cs" Inherits="WebForms_Admin_ReleaseInformation" %>
<%@ Register Assembly="Infrastructure" Namespace="Infrastructure.Controls" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../../script/GridLineHotTrack.js"></script>
    <script src="../../script/jquery.js"></script>
    <link href="../../css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server">
        </asp:ScriptManager>
        <div>
            <h2>信息发布</h2>
            <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default">
                <ClientSideEvents ItemClick="function(s, e) {
    var itemName = e.item.name;
	switch(itemName){
		case 'Add':
			popupEdit.Show();
            popupEdit.SetHeaderText('添加新闻通知');
			popupEdit.SetContentUrl('EditInformation.aspx?mode=insert');
			e.processOnServer = false;
			break;
	}
}" />
                <Paddings PaddingBottom="5px" PaddingTop="8px" />
                <Items>
                    <dx:MenuItem Text="添加新闻通知" Name="Add">
                        <Image Url="~/images/add.png">
                        </Image>
                    </dx:MenuItem>
                </Items>
                <ItemStyle>
                    <HoverStyle BackColor="#E2F0FF">
                        <Border BorderColor="#A3C0E8" />
                    </HoverStyle>
                </ItemStyle>
                <Border BorderStyle="None" />
            </dx:ASPxMenu>
            <p></p>
            <cc2:MyGridView ID="gvInformation" runat="server" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="InformationID" DataSourceID="sdsInformationList" OnRowCommand="gvSelectedTaskToEnsure_RowCommand" AllowPaging="True" AllowSorting="True" EmptyDataText="没有发布任何新闻消息">
                <AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="InformationID" InsertVisible="False" SortExpression="InformationID"
                        Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="lblInformationID" runat="server" Text='<%# Eval("InformationID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInformationID" runat="server" Text='<%# Bind("InformationID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="InformationID" DataNavigateUrlFormatString="../Common/ShowInformationDetail.aspx?InformationID={0}"
                        DataTextField="Title" DataTextFormatString="{0}" HeaderText="标题" />
                    <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author" />
                    <asp:BoundField DataField="SubmitDate" DataFormatString="{0:[yyyy-MM-dd]}" HeaderText="日期"
                        SortExpression="SubmitDate" />
                    <asp:CheckBoxField DataField="ForTeacher" HeaderText="教师可见" SortExpression="ForTeacher" />
                    <asp:CheckBoxField DataField="ForStudent" HeaderText="学生可见" SortExpression="ForStudent" />
                    <asp:TemplateField HeaderText="编辑">
                        <ItemTemplate>
                            <a href="javascript:void(0)" onclick='javascript:EditInformation(<%# Eval("InformationID")%>)' >编辑</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDeleteItem" runat="server" CausesValidation="false" CommandArgument="<%# Container.DisplayIndex %>"
                                CommandName="DeleteRecord" Text="删除"></asp:LinkButton>
                            <cc1:ConfirmButtonExtender ID="ConfirmDeleteItemExtender" runat="server" TargetControlID="btnDeleteItem"
                                ConfirmText="您真的要删除当前记录吗？">
                            </cc1:ConfirmButtonExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                <HeaderStyle CssClass="headerRow"></HeaderStyle>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                <PagerStyle CssClass="pagerRow"></PagerStyle>
                <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
            </cc2:MyGridView>
            <p></p>
            <dx:ASPxPopupControl ID="popupEdit" runat="server" CloseAction="CloseButton" HeaderText="新建、编辑新闻通知" Height="500px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Theme="Aqua" Width="800px" PopupAnimationType="Fade" ShowCloseButton="False" ClientInstanceName="popupEdit" AllowDragging="True" AllowResize="True">
                <HeaderImage Url="~/images/edit.png">
                </HeaderImage>
                <FooterStyle>
                    <Paddings Padding="5px" />
                </FooterStyle>
                <FooterTemplate>
                    <dx:ASPxMenu ID="mnuToolBar" runat="server" EnableTheming="True" Theme="Aqua" ShowAsToolbar="True">
                        <ClientSideEvents ItemClick="function(s, e) {
	e.processOnServer = false;
    var itemName = e.item.name;
	switch(itemName){
		case 'Cancel':
			popupEdit.GetContentIFrame().contentWindow.Cancel();
			break;
		case 'Save':
			popupEdit.GetContentIFrame().contentWindow.Save();
			break;
	}
}" />
                        <Items>
                            <dx:MenuItem Name="Save" Text="保存">
                                <Image Url="~/images/save.gif">
                                </Image>
                            </dx:MenuItem>
                            <dx:MenuItem Name="Cancel" Text="取消">
                                <Image Url="~/images/close.gif">
                                </Image>
                            </dx:MenuItem>
                        </Items>
                    </dx:ASPxMenu>
                </FooterTemplate>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True"></dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <p style="display: none;">
                <asp:LinkButton ID="btnRefresh" runat="server" OnClick="btnRefresh_Click">更换当前部门</asp:LinkButton>
            </p>
            <asp:SqlDataSource ID="sdsInformationList" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>"
                SelectCommand="SELECT InformationID, Title, Author, SubmitDate, ForTeacher, ForStudent FROM Information ORDER BY SubmitDate DESC"
                DeleteCommand="DELETE FROM Information WHERE (InformationID = @InformationID)">
                <DeleteParameters>
                    <asp:Parameter Name="InformationID" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <script type="text/javascript">
                function ForceRefresh() {
                    __doPostBack('btnRefresh', '');
                }

                function EditInformation(informationID) {
                    popupEdit.SetHeaderText('编辑新闻通知');
                    popupEdit.SetContentUrl("EditInformation.aspx?mode=edit&InformationID=" + informationID);
                    popupEdit.Show();
                }
            </script>
        </div>
    </form>
</body>
</html>
