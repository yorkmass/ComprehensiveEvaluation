<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThesisImport.aspx.cs" Inherits="WebForms_CollegeAdmin_ThesisImport" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

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
            <h2>论文导入与查询</h2>
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
                    项目等级：<asp:DropDownList ID="cboLevel" runat="server">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                        <asp:ListItem>国际级</asp:ListItem>
                        <asp:ListItem>国家级</asp:ListItem>
                        <asp:ListItem>省级</asp:ListItem>
                        <asp:ListItem>市级</asp:ListItem>
                        <asp:ListItem>校级</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    项目类型：<asp:DropDownList ID="cboProjectType" runat="server">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                        <asp:ListItem>创新训练项目</asp:ListItem>
                        <asp:ListItem>创业训练项目</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    竞赛名称（使用“%”作通配符）：<asp:TextBox ID="txtProjectName" runat="server" Width="300px">%</asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSearch" runat="server">检索</asp:LinkButton>
                </p>
                <p>
                    &nbsp;</p>
                
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
                    <dx:MenuItem BeginGroup="true" Text="下载模版" Name="DownloadTemplate" NavigateUrl="~/Downloads/论文导入模版.xls">
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
            <br />
            <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" DataSourceID="sdsThesis" KeyFieldName="Sno" Theme="Aqua">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Semester" Caption="学期" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="JournalName" Caption="期刊名称" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ThesisType" Caption="论文类型" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" Caption="论文名称" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="JournalLevel" Caption="论文级别" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="College" Caption="学院" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Class" Caption="班级" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="姓名" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Sno" Caption="学号" ReadOnly="True" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AuditStatus" Caption="审核状态" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Score" Caption="分数" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                </Columns>
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
            <br />
            <asp:SqlDataSource ID="sdsThesis" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Achievement.Semester, Thesis.JournalName, Thesis.ThesisType, Achievement.Title, Thesis.JournalLevel, Student.College, Student.Class, Student.Name, Student.Sno, Achievement.AuditStatus, Rules.Score FROM Thesis INNER JOIN Achievement ON Thesis.AchievementID = Achievement.AchievementID INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno INNER JOIN Rules ON StudentsAchievements.RuleID = Rules.RuleID WHERE (Achievement.Semester LIKE @Semester) AND (Student.College LIKE @College)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboYear" Name="Semester" PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="College" SessionField="BranchName" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
            <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT DISTINCT Semester FROM SemesterStatus"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT DISTINCT Student.College FROM Achievement INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno WHERE (Achievement.AchievementType = '创新创业项目') ORDER BY Student.College"></asp:SqlDataSource>
    </form>
</body>
</html>
