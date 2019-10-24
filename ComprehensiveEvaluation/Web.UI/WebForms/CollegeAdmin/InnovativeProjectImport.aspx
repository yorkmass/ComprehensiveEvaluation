<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InnovativeProjectImport.aspx.cs" Inherits="WebForms_CollegeAdmin_InnovativeProjectImport" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>创新创业项目导入与查询</h2>
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
                    项目名称（使用“%”作通配符）：<asp:TextBox ID="txtProjectName" runat="server" Width="300px">%</asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
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
                    <dx:MenuItem BeginGroup="true" Text="下载模版" Name="DownloadTemplate" NavigateUrl="~/Downloads/创新创业项目导入模板.xls">
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
            <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" EnableTheming="True" ClientInstanceName="gvData" Theme="Aqua" DataSourceID="sdsInovativeProject" KeyFieldName="AchievementID">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Semester" VisibleIndex="0" Caption="学期">
                    </dx:GridViewDataTextColumn>                   
                    <dx:GridViewDataTextColumn FieldName="InnovativeProjectLevel" VisibleIndex="1" Caption="项目级别">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="InnovativeProjectNo" VisibleIndex="2" Caption="项目编号">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3" Caption="项目名称">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="InnovativeProjectType" VisibleIndex="4" Caption="项目类型">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="College" VisibleIndex="5" Caption="学院">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Class" VisibleIndex="6" Caption="班级">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="7" Caption="姓名">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Sno" VisibleIndex="8" Caption="学号">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="10" Caption="审核状态">
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
            <asp:SqlDataSource ID="sdsInovativeProject" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnStr %>" SelectCommand="SELECT Achievement.Semester, InnovativeProject.InnovativeProjectLevel, InnovativeProject.InnovativeProjectNo, Achievement.Title, InnovativeProject.InnovativeProjectType, Student.College, Student.Class, Student.Name, StudentsAchievements.Sno, Achievement.AuditStatus, StudentsAchievements.AchievementID FROM Achievement INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno INNER JOIN InnovativeProject ON Achievement.AchievementID = InnovativeProject.AchievementID WHERE (Achievement.Semester LIKE @Semester) AND (Student.College LIKE @College) AND (Achievement.Title LIKE @Title) AND (InnovativeProject.InnovativeProjectLevel LIKE @ProjectLevel) AND (InnovativeProject.InnovativeProjectType LIKE @ProjectType) ORDER BY Achievement.Semester DESC, InnovativeProject.InnovativeProjectNo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboYear" Name="Semester" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cboCollege" Name="College" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtProjectName" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="cboLevel" Name="ProjectLevel" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cboProjectType" Name="ProjectType" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
