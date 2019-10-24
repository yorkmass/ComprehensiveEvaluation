<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ScoreSetup.aspx.cs" Inherits="WebForms_Admin_ScoreSetup" EnableEventValidation="false" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="Infrastructure" Namespace="Infrastructure.Controls" TagPrefix="cc1" %>

<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .dxmLite {
            font: 12px Tahoma, Geneva, sans-serif;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="专业："></asp:Label>
            <asp:DropDownList ID="dplMajor" runat="server" AppendDataBoundItems="true" Width="120px" DataSourceID="sdsMajor" DataTextField="Major" DataValueField="Major">
                <asp:ListItem Value="%">...请选择...</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="班级："></asp:Label>
            <asp:DropDownList ID="dplClass" runat="server" AppendDataBoundItems="true" Style="margin-bottom: 0px" Width="120px" DataSourceID="sdsClass" DataTextField="Class" DataValueField="Class">
                <asp:ListItem Value="%">...请选择...</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp; 学期：<asp:DropDownList ID="dplSemester" AppendDataBoundItems="true" runat="server" DataSourceID="sdsSemester" DataTextField="Semester" DataValueField="Semester">
                <asp:ListItem Value="%">...请选择...</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:LinkButton ID="btnSearch0" runat="server" OnClick="btnSearch0_Click">检索</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnScore" runat="server" OnClick="btnScore_Click" Text="计算本学期综测成绩(选择专业)" />
            <br />
            <br />
            <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True" ShowAsToolbar="True" Theme="Default" OnItemClick="mnuMain_ItemClick">
                <ClientSideEvents ItemClick="function(s, e) {}" />
                <Paddings PaddingBottom="5px" PaddingTop="8px" />
                <Items>
                    <dx:MenuItem Name="Choose" Text="全选">
                        <Image Url="~/images/spellcheck.png">
                        </Image>
                    </dx:MenuItem>
                    <dx:MenuItem BeginGroup="True" Text="导出" Name="Export">
                        <Image Url="~/images/export.png">
                        </Image>
                    </dx:MenuItem>
                </Items>
                <ItemStyle>
                    <HoverStyle BackColor="#E2F0FF">
                        <border bordercolor="#A3C0E8" />
                    </HoverStyle>
                </ItemStyle>
                <Border BorderStyle="None" />
            </dx:ASPxMenu>
            <br />

            <asp:SqlDataSource ID="sdsCompositveScore" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT CompositveScore.Sno, CompositveScore.Name, BasisScore.Political, BasisScore.SocialMora, BasisScore.Law, BasisScore.Collective, BasisScore.PublicWork, BasisScore.Health, BasisScore.ObeyRule, BasisScore.WeightAvgScore, BasisScore.BodyMindQualityScore, CompositveScore.AchievementTotalScore, CompositveScore.TotalScore FROM CompositveScore INNER JOIN BasisScore ON CompositveScore.Sno = BasisScore.Sno INNER JOIN Student ON CompositveScore.Sno = Student.Sno AND BasisScore.Sno = Student.Sno WHERE (Student.Major LIKE @Major) AND (Student.College LIKE @College) AND (CompositveScore.Semester LIKE @Semester) AND (Student.Class LIKE @Class)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dplMajor" Name="Major" PropertyName="SelectedValue" DefaultValue="%" />
                    <asp:SessionParameter Name="College" SessionField="BranchName" DefaultValue="%" />
                    <asp:ControlParameter ControlID="dplSemester" Name="Semester" PropertyName="SelectedValue" DefaultValue="%" />
                    <asp:ControlParameter ControlID="dplClass" DefaultValue="%" Name="Class" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="False" DataSourceID="sdsCompositveScore" EnableTheming="True" KeyFieldName="Sno" Theme="Aqua">
                <Columns>
                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Sno" Caption="学号" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="姓名" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Political" Caption="政治思想表现" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SocialMora" Caption="社会公德" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Law" Caption="遵纪守法" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Collective" Caption="集体观念" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PublicWork" Caption="公益劳动" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Health" Caption="宿舍卫生" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ObeyRule" Caption="行为规范" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="WeightAvgScore" Caption="科学文化素质" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodyMindQualityScore" Caption="身心素质" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AchievementTotalScore" Caption="发展性素质总分" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalScore" Caption="综合测评总成绩" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="gvExport" runat="server" GridViewID="gvData">
            </dx:ASPxGridViewExporter>
            <br />
            <asp:SqlDataSource ID="sdsClass" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Class FROM Student WHERE (Major LIKE @Major) AND (College = @College)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dplMajor" DefaultValue="%" Name="Major" PropertyName="SelectedValue" />
                    <asp:SessionParameter DefaultValue="" Name="College" SessionField="BranchName" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsSemester" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Semester] FROM [SemesterStatus]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsMajor" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Major FROM Student WHERE (College Like @College)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="College" SessionField="BranchName" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <uc1:MessageBoxControl ID="MessageBox" runat="server" />
        <div><br />
        &nbsp;&nbsp;&nbsp;<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="Class" YValueMembers="Good">                    
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
            <asp:Label runat="server" Text="学院各个班级优秀（综测成绩大于80分)占比情况" ID="GoodChart" Visible="False"></asp:Label>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Student.Class, SUM(CASE WHEN CompositveScore.TotalScore &gt; 80 THEN 1 ELSE 0 END) AS Good FROM CompositveScore INNER JOIN Student ON CompositveScore.Sno = Student.Sno GROUP BY Student.Class"></asp:SqlDataSource>
    </form>
</body>
</html>
