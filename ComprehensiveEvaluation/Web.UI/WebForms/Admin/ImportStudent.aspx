<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportStudent.aspx.cs" Inherits="WebForms_Admin_ImportStudent" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/UserControls/MessageBoxControl.ascx" TagPrefix="uc1" TagName="MessageBoxControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            学号：<asp:TextBox ID="txtSno" runat="server">%</asp:TextBox>
&nbsp;<asp:Label ID="Label1" runat="server" Text="以%做匹配"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnSearch" runat="server">检索</asp:LinkButton>
&nbsp;<dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default" OnItemClick="mnuMain_ItemClick">
                <ClientSideEvents ItemClick="function(s, e) {
    var itemName = e.item.name;
	switch(itemName){
		case 'Import':
			popupUpload.Show(); 
			e.processOnServer = false;
			break;
		case 'BatchMng':
			popupBatchMng.Show();
			e.processOnServer = false;
			break;
	}
}" />
                <Paddings PaddingBottom="5px" PaddingTop="8px" />
                <Items>
                    <dx:MenuItem BeginGroup="true" Text="下载模版" Name="DownloadTemplate" NavigateUrl="~/Downloads/学生信息导入.xls">
                        <Image Url="~/images/export.png">
                        </Image>
                    </dx:MenuItem>
                    <dx:MenuItem Name="Import" Text="导入">
                        <Image Url="~/images/import.png">
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
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="sdsStudent" EnableTheming="True" KeyFieldName="Sno" Theme="Aqua">
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" Caption="编辑" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Sno" Caption="学号" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="姓名" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Sex" Caption="性别" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="College" Caption="学院" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Major" Caption="专业" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Class" Caption="班级" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="EntranceYear" Caption="入学年份" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Grade" Caption="年级" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SchoolingLength" Caption="学制" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="sdsStudent" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [Sno] = @Sno" InsertCommand="INSERT INTO [Student] ([Sno], [Name], [Sex], [College], [Major], [Class], [EntranceYear], [Grade], [SchoolingLength]) VALUES (@Sno, @Name, @Sex, @College, @Major, @Class, @EntranceYear, @Grade, @SchoolingLength)" SelectCommand="SELECT [Sno], [Name], [Sex], [College], [Major], [Class], [EntranceYear], [Grade], [SchoolingLength] FROM [Student] WHERE ([Sno] LIKE '%' + @Sno + '%')" UpdateCommand="UPDATE [Student] SET [Name] = @Name, [Sex] = @Sex, [College] = @College, [Major] = @Major, [Class] = @Class, [EntranceYear] = @EntranceYear, [Grade] = @Grade, [SchoolingLength] = @SchoolingLength WHERE [Sno] = @Sno">
                <DeleteParameters>
                    <asp:Parameter Name="Sno" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Sno" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Sex" Type="String" />
                    <asp:Parameter Name="College" Type="String" />
                    <asp:Parameter Name="Major" Type="String" />
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="EntranceYear" Type="Int32" />
                    <asp:Parameter Name="Grade" Type="Int32" />
                    <asp:Parameter Name="SchoolingLength" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSno" DefaultValue="%" Name="Sno" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Sex" Type="String" />
                    <asp:Parameter Name="College" Type="String" />
                    <asp:Parameter Name="Major" Type="String" />
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="EntranceYear" Type="Int32" />
                    <asp:Parameter Name="Grade" Type="Int32" />
                    <asp:Parameter Name="SchoolingLength" Type="Int32" />
                    <asp:Parameter Name="Sno" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <dx:ASPxPopupControl ID="popupUpload" runat="server" AllowDragging="true" CloseAction="CloseButton" HeaderText="导入" Height="130px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" Width="410px">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="popupControlContenControl1" runat="server" SupportsDisabledAttribute="True">
                        <p>
                            <asp:FileUpload ID="fileUpload" runat="server" Width="350px" />
                        </p>
                        <asp:LinkButton ID="btnUpload" runat="server" OnClick="btnUpload_Click">导入</asp:LinkButton>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <uc1:MessageBoxControl runat="server" ID="MessageBoxControl" />
        </div>
    </form>
</body>
</html>
