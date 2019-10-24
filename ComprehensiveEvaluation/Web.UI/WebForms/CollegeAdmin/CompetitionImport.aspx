<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompetitionImport.aspx.cs" Inherits="WebForms_CollegeAdmin_CompetitionImport" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="../../UserControls/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>

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
            <h2>竞赛信息导入</h2>
            <fieldset>
                <legend>查询条件</legend>
                <p>
                    学期:<asp:DropDownList ID="cboSemester" runat="server" AppendDataBoundItems="True" DataSourceID="sdsSemester" DataTextField="Semester" DataValueField="Semester" AutoPostBack="True">
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
                    获奖级别：<asp:DropDownList ID="cboAwardLevel" runat="server">
                        <asp:ListItem Value="%">【全部】</asp:ListItem>
                        <asp:ListItem>特等奖</asp:ListItem>
                        <asp:ListItem>一等奖</asp:ListItem>
                        <asp:ListItem>二等奖</asp:ListItem>
                        <asp:ListItem>三等奖</asp:ListItem>
                        <asp:ListItem>优胜奖</asp:ListItem>
                        <asp:ListItem>其它奖项</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    竞赛名称(使用"%"作通配符):
                    <asp:TextBox ID="txtCompetitionName" runat="server" Width="300px">%</asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnSearch" runat="server">检索</asp:LinkButton>
                </p>
                <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default" OnItemClick="mnuMain_ItemClick">
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
                        <dx:MenuItem BeginGroup="True" Text="下载模板" Name="DownloadTemplate" NavigateUrl="~/Downloads/竞赛数据导入模板.xls">
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
                            <border bordercolor="#A3C0E8" />
                        </HoverStyle>
                    </ItemStyle>
                </dx:ASPxMenu>
                <p></p>
                <dx:ASPxGridView runat="server" AutoGenerateColumns="False" EnableTheming="True" ClientInstanceName="gvData" Theme="Aqua" DataSourceID="sdsCompetition" ID="gvData">                    
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Semester" Caption="学期" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="College" Caption="学院" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Class" Caption="班级" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Sno" Caption="学号" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Name" Caption="姓名" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Title" Caption="比赛名称" VisibleIndex="5">
                        </dx:GridViewDataTextColumn> 
                        <dx:GridViewDataTextColumn FieldName="AwardRank" Caption="获奖级别" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AwardLevel" Caption="竞赛等级" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="ObtainDate" Caption="获得日期" VisibleIndex="8">
                        </dx:GridViewDataDateColumn>                      
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
            </fieldset>
        </div>
        <asp:SqlDataSource ID="sdsSemester" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Semester FROM SemesterStatus"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Student.College FROM Achievement INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno WHERE (Achievement.AchievementType = '竞赛') ORDER BY Student.College"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsCompetition" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Achievement.Semester, Student.College, Student.Class, Student.Sno, Student.Name, Achievement.Title, Competition.AwardRank, Competition.AwardLevel, Achievement.ObtainDate, Achievement.AuditStatus, StudentsAchievements.AchievementID, Rules.Score FROM Competition INNER JOIN Achievement ON Competition.AchievementID = Achievement.AchievementID INNER JOIN StudentsAchievements ON Achievement.AchievementID = StudentsAchievements.AchievementID INNER JOIN Student ON StudentsAchievements.Sno = Student.Sno INNER JOIN Rules ON StudentsAchievements.RuleID = Rules.RuleID WHERE (Achievement.Semester LIKE @Semester) AND (Student.College LIKE @College) AND (Competition.AwardLevel LIKE @AwardLevel) AND (Achievement.Title LIKE @Title) ORDER BY Achievement.Semester DESC, Student.College, StudentsAchievements.Sno">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboSemester" Name="Semester" PropertyName="SelectedValue" DefaultValue="%" />
                <asp:ControlParameter ControlID="cboCollege" Name="College" PropertyName="SelectedValue" DefaultValue="%" />
                <asp:ControlParameter ControlID="cboLevel" Name="AwardLevel" PropertyName="SelectedValue" DefaultValue="%" />
                <asp:ControlParameter ControlID="txtCompetitionName" Name="Title" PropertyName="Text" DefaultValue="%" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
