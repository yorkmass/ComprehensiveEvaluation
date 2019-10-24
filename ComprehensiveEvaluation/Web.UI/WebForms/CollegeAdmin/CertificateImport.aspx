<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CertificateImport.aspx.cs" Inherits="WebForms_CollegeAdmin_CertificateImport" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

h2 {
	font-size: 16px;
	font-weight: 700;
	color: Navy;
	margin-top: 15px;
	margin-bottom: 15px;
}
fieldset {
    padding: 10px;
    margin-bottom: 15px;
	color: #333;
    border: #a3c0e8 solid 1px;
}
legend {
    color: #07519A;
    font-weight:800;
} 
p {
	font-size: 12px;
	line-height: 20px;
    text-align: left;
}
a, a:visited {
	color: #07519A;
	text-decoration: none;
    text-align: left;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>认证考试导入与查询</h2>
            <fieldset>
                <legend>查询条件</legend>
                <p>
                    学期：<asp:DropDownList ID="cboYear" runat="server" AppendDataBoundItems="True" DataSourceID="sdsYear" DataTextField="Semester" DataValueField="Semester" AutoPostBack="True">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                       </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    学院：<asp:DropDownList ID="cboCollege" runat="server" AppendDataBoundItems="True" DataSourceID="sdsCollege" DataTextField="College" DataValueField="College">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                        </asp:DropDownList>
                     &nbsp;&nbsp;&nbsp;
                    考试类型：<asp:DropDownList ID="cboLevel" runat="server">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                        <asp:ListItem>国际级</asp:ListItem>
                        <asp:ListItem>国家级</asp:ListItem>
                        <asp:ListItem>省级</asp:ListItem>
                        <asp:ListItem>市级</asp:ListItem>
                        <asp:ListItem>校级</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click">检索</asp:LinkButton>
                    </p>
            </fieldset>
            <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default" OnItemClick="mnuMain_ItemClick">
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
                    <dx:MenuItem BeginGroup="true" Text="下载模版" Name="DownloadTemplate" NavigateUrl="~/Downloads/认证考试成绩导入模板.xls">
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
            <p></p>
            <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" EnableTheming="True" ClientInstanceName="gvData" Theme="Aqua" DataSourceID="sdsCertificate" KeyFieldName="Sno">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Title" Caption="认证考试名称" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>                   
                    <dx:GridViewDataTextColumn FieldName="TestDate" Caption="获得时间" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ExaminationCardNumber" Caption="准考证号" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" Caption="描述" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Semester" Caption="学期" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Sno" Caption="学号" VisibleIndex="5" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="姓名" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AuditStatus" Caption="审核状态" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mark" Caption="考试分数" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Score" Caption="综测分数" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            </dx:ASPxGridView>
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
            <uc1:MessageBoxControl ID="MessageBox" runat="server" />
            <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT DISTINCT Semester FROM SemesterStatus"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT DISTINCT Student.College FROM Achievement INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno WHERE (Achievement.AchievementType = '创新创业项目') ORDER BY Student.College"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsCertificate" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Achievement.Title, Certificate.TestDate, Certificate.ExaminationCardNumber, Certificate.Description, Achievement.Semester, Student.Sno, Student.Name, Achievement.AuditStatus, Certificate.Mark, Rules.Score FROM Certificate INNER JOIN Achievement ON Certificate.AchievementID = Achievement.AchievementID INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno INNER JOIN Rules ON StudentsAchievements.RuleID = Rules.RuleID WHERE (Achievement.Title LIKE @Title) AND (Achievement.Semester LIKE @Semester)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboLevel" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cboYear" Name="Semester" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <!-- 证书 -->
        </div>
    </form>
</body>
</html>
