<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExaminationImport.aspx.cs" Inherits="WebForms_CollegeAdmin_ExaminationImport" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="Infrastructure" Namespace="Infrastructure.Controls" TagPrefix="cc1" %>

<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">


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
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="专业："></asp:Label>
            <asp:DropDownList ID="dplMajor" runat="server" Width="120px" DataSourceID="sdsMajor" DataTextField="Major" DataValueField="Major" OnSelectedIndexChanged="dplMajor_SelectedIndexChanged" >
                <asp:ListItem Value="%">...请选择...</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="班级："></asp:Label>
            <asp:DropDownList ID="dplClass" runat="server" Style="margin-bottom: 0px" Width="120px" DataSourceID="sdsClass" DataTextField="Class" DataValueField="Class">
                <asp:listitem Value="%">...请选择...</asp:listitem>
            </asp:DropDownList>
            &nbsp;&nbsp&nbsp;&nbsp;

            <asp:Label ID="Label1" runat="server" Text="学号:"></asp:Label>&nbsp;
            <asp:TextBox ID="txtSno" runat="server">%</asp:TextBox>
            &nbsp;&nbsp;以%做匹配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnSearch" runat="server">检索</asp:LinkButton>
            &nbsp;<br /><br /><br />
            <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default"  OnItemClick="mnuMain_ItemClick">
                <ClientSideEvents ItemClick="function(s,e){
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
                <Paddings Padding="5px" PaddingTop="8px" />
                <Items>
                    <dx:MenuItem BeginGroup="true" Text="下载模版" Name="DownloadTemplate" NavigateUrl="~/DDownloads/考试成绩导入模版.xls">
                        <Image Url="~/images/export.png">
                        </Image>
                    </dx:MenuItem>
                    <dx:MenuItem Name="Import" Text="导入">
                        <Image Url="~/images/import.png">
                        </Image>
                    </dx:MenuItem>
                </Items>
            </dx:ASPxMenu>
            <br />
            <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" DataSourceID="sdsExmination" KeyFieldName="BasicID" Theme="Aqua">
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="BasicID" Visible="false" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="学号" FieldName="Sno" VisibleIndex="2" >
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="姓名" FieldName="Name" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="班级" FieldName="Class" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="加权平均分数" FieldName="WeightAvgScore" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <br />
            <asp:SqlDataSource ID="sdsExmination" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT BasisScore.BasicID, BasisScore.Sno, BasisScore.Name, BasisScore.Class, BasisScore.WeightAvgScore FROM BasisScore INNER JOIN Student ON BasisScore.Sno = Student.Sno WHERE (BasisScore.Class LIKE @Class) AND (Student.Major LIKE @Major) AND (Student.Sno LIKE @Sno) ORDER BY BasisScore.Class">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dplClass" Name="Class" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dplMajor" Name="Major" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtSno" Name="Sno" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
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
        </div>
        <br />
                <uc1:MessageBoxControl ID="MessageBox" runat="server" />
            <asp:SqlDataSource ID="sdsClass" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Class FROM Student WHERE (Major LIKE @Major) AND (College = @College)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dplMajor" DefaultValue="%" Name="Major" PropertyName="SelectedValue" />
                    <asp:SessionParameter DefaultValue="" Name="College" SessionField="BranchName" />
                </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsMajor" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Major FROM Student WHERE (College Like @College)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="College" SessionField="BranchName" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
