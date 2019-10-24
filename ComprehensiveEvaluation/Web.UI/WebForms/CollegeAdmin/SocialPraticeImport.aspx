<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SocialPraticeImport.aspx.cs" Inherits="WebForms_CollegeAdmin_SocialPraticeImport" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../css/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>社会实践导入与查询</h2>
            <fieldset>
                <legend>查询条件</legend>
                <p>
                    学期：<asp:DropDownList ID="cboYear" runat="server" AppendDataBoundItems="True" DataSourceID="sdsYear" DataTextField="Semester" DataValueField="Semester" AutoPostBack="True">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                       </asp:DropDownList>
                    &nbsp;
                </p>
                <p>
                    实践名称（使用“%”作通配符）：<asp:TextBox ID="txtSocialName" runat="server" Width="300px">%</asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click">检索</asp:LinkButton>
                </p>
            </fieldset>
            <p>
                <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" OnItemClick="mnuMain_ItemClick" ShowAsToolbar="True" Theme="Default">
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
                        <dx:MenuItem BeginGroup="true" Name="DownloadTemplate" NavigateUrl="~/Downloads/社会实践导入模版.xls" Text="下载模版">
                            <image url="~/images/export.png">
                            </image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="Import" Text="导入">
                            <image url="~/images/import.png">
                            </image>
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle>
                    <hoverstyle backcolor="#E2F0FF">
                        <Border BorderColor="#A3C0E8" />
                    </hoverstyle>
                    </ItemStyle>
                <Border BorderStyle="None" />
                </dx:ASPxMenu>
            </p>
            <p>
            <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" EnableTheming="True" ClientInstanceName="gvData" Theme="Aqua" DataSourceID="sdsSocialParticel" KeyFieldName="Sno">
                <Columns>
                    <dx:gridviewdatatextcolumn FieldName="Title" Caption="名称" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>                   
                    <dx:gridviewdatatextcolumn FieldName="Semester" Caption="学期" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:gridviewdatatextcolumn FieldName="PraticeDate" Caption="实习时间" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:gridviewdatatextcolumn FieldName="PraticeLevel" Caption="实习级别" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:gridviewdatatextcolumn FieldName="Sno" Caption="学号" VisibleIndex="4" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:gridviewdatatextcolumn FieldName="Name" Caption="姓名" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:gridviewdatatextcolumn FieldName="AuditStatus" Caption="审核状态" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:gridviewdatatextcolumn FieldName="Score" Caption="分数" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            </dx:ASPxGridView>

                <asp:SqlDataSource ID="sdsSocialParticel" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Achievement.Title, Achievement.Semester, SocialPratice.PraticeDate, SocialPratice.PraticeLevel, Student.Sno, Student.Name, Achievement.AuditStatus, Rules.Score FROM SocialPratice INNER JOIN StudentsAchievements ON SocialPratice.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno INNER JOIN Achievement ON StudentsAchievements.AchievementID = Achievement.AchievementID INNER JOIN Rules ON StudentsAchievements.RuleID = Rules.RuleID WHERE (Achievement.Semester LIKE @Semester) AND (Student.College LIKE @College)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboYear" DefaultValue="%" Name="Semester" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="College" SessionField="BranchName" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </p>
            <p>

            </p>

            <dx:ASPxPopupControl ID="popupUpload" runat="server" AllowDragging="true" CloseAction="CloseButton" HeaderText="导入" Height="130px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" Width="410px">
                <ContentCollection>
                    <dx:popupcontrolcontentcontrol ID="popupControlContenControl1" runat="server" SupportsDisabledAttribute="True">
                        <p>
                            <asp:FileUpload ID="fileUpload" runat="server" Width="350px" />
                        </p>
                        <asp:LinkButton ID="btnUpload" runat="server" OnClick="btnUpload_Click">导入</asp:LinkButton>
                    </dx:popupcontrolcontentcontrol>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <uc1:MessageBoxControl ID="MessageBox" runat="server" />

            <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT DISTINCT Semester FROM SemesterStatus"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT DISTINCT Student.College FROM Achievement INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno WHERE (Achievement.AchievementType = '社会实践') ORDER BY Student.College"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsSocialPratice" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" OnSelecting="sdsSocialPratice_Selecting" SelectCommand="SELECT StudentsAchievements.Sno, Achievement.Title, SocialPratice.PraticeDate, SocialPratice.PraticeLevel, SocialPratice.PraticeType, Achievement.AuditStatus, Achievement.Semester FROM SocialPratice INNER JOIN Achievement ON SocialPratice.AchievementID = Achievement.AchievementID INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID WHERE (Achievement.Title LIKE @Title) AND (Achievement.Semester LIKE @Semester)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSocialName" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="cboYear" Name="Semester" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
