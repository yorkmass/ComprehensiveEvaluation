<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicSearch.aspx.cs" Inherits="WebForms_ClassAdmin_BasicSearch" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
            <link href="../../css/style.css" rel="stylesheet" />
        <script src="../../script/GridLineHotTrack.js"></script>
          <script src="../../Scripts/jquery-3.3.1.min.js"></script>
        <script src="../../script/jquery.js"></script> 
    <style type="text/css">
        .highlightRow {
            cursor: pointer;
        }
        .texts{
            margin-left:15px;
        }
        .buju{
            margin-left:10px;
            margin-top:20px;
           
        }
        .topaway{
            margin-top:20px;
        }
    </style>
         <script type="text/javascript">
        $(function () {
            //-- 鼠标移过后亮条效果
            $("table[class=dataTable]").find('tr').not("tr[class=headerRow]").mouseover(function () {
                if ($(this).find('input:radio:checked').length > 0)
                    $(this).removeClass("selectedRow").addClass("highlightRow");
                else
                    $(this).addClass("highlightRow");
            });
            $("table[class=dataTable]").find('tr').not("tr[class=headerRow]").mouseout(function () {
                if ($(this).find('input:radio:checked').length > 0)
                    $(this).removeClass("highlightRow").addClass("selectedRow");
                else
                    $(this).removeClass("highlightRow");
            });           
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
                        <asp:ScriptManager ID="sm" runat="server">
            </asp:ScriptManager> 
                <h2>
            <asp:Label ID="lblTitle" runat="server" Text="基础性素质分数查询"></asp:Label>
        </h2>

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Semester] FROM [SemesterStatus]"></asp:SqlDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByClass" TypeName="DSBasicAddTableAdapters.BasisScoreTableAdapter">
                <InsertParameters>
                    <asp:Parameter Name="Sno" Type="String" />
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="WeightAvgScore" Type="Double" />
                    <asp:Parameter Name="IdeologyMoralityScore" Type="Double" />
                    <asp:Parameter Name="BodyMindQualityScore" Type="Double" />
                    <asp:Parameter Name="Semester" Type="String" />
                    <asp:Parameter Name="Political" Type="Double" />
                    <asp:Parameter Name="SocialMora" Type="Double" />
                    <asp:Parameter Name="Law" Type="Double" />
                    <asp:Parameter Name="Collective" Type="Double" />
                    <asp:Parameter Name="PublicWork" Type="Double" />
                    <asp:Parameter Name="Health" Type="Double" />
                    <asp:Parameter Name="ObeyRule" Type="Double" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="semester" SessionField="Semester" Type="String" />
                    <asp:SessionParameter Name="ClassName" SessionField="ClassName" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByClass" TypeName="DSBasicAddTableAdapters.BasisScoreTableAdapter">
                <InsertParameters>
                    <asp:Parameter Name="Sno" Type="String" />
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="WeightAvgScore" Type="Double" />
                    <asp:Parameter Name="IdeologyMoralityScore" Type="Double" />
                    <asp:Parameter Name="BodyMindQualityScore" Type="Double" />
                    <asp:Parameter Name="Semester" Type="String" />
                    <asp:Parameter Name="Political" Type="Double" />
                    <asp:Parameter Name="SocialMora" Type="Double" />
                    <asp:Parameter Name="Law" Type="Double" />
                    <asp:Parameter Name="Collective" Type="Double" />
                    <asp:Parameter Name="PublicWork" Type="Double" />
                    <asp:Parameter Name="Health" Type="Double" />
                    <asp:Parameter Name="ObeyRule" Type="Double" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="semester" Type="String" DefaultValue="" />
                    <asp:SessionParameter DefaultValue="" Name="ClassName" SessionField="ClassName" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  >
            </asp:DropDownList>
              </div>
            <div class="buju">
            <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="BasicID" DataSourceID="ObjectDataSource1" EmptyDataText="本学期还没有数据哦！" >
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

                <Columns>
                        <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                        <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                        <asp:BoundField DataField="WeightAvgScore" HeaderText="加权成绩" SortExpression="WeightAvgScore" />
                        <asp:BoundField DataField="BodyMindQualityScore" HeaderText="身心素质" SortExpression="BodyMindQualityScore" />
                        <asp:BoundField DataField="IdeologyMoralityScore" HeaderText="思想品德素质：" SortExpression="IdeologyMoralityScore" />
                        <asp:BoundField DataField="Political" HeaderText="思想政治表现" SortExpression="Political" />
                        <asp:BoundField DataField="SocialMora" HeaderText="社会公德" SortExpression="SocialMora" />
                        <asp:BoundField DataField="Law" HeaderText="遵纪守法" SortExpression="Law" />
                        <asp:BoundField DataField="Collective" HeaderText="集体观念" SortExpression="Collective" />
                        <asp:BoundField DataField="PublicWork" HeaderText="公益劳动" SortExpression="PublicWork" />
                        <asp:BoundField DataField="Health" HeaderText="宿舍卫生" SortExpression="Health" />
                        <asp:BoundField DataField="ObeyRule" HeaderText="行为规范" SortExpression="ObeyRule" />                        
                        <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                </Columns>
                        <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                        <HeaderStyle CssClass="headerRow"></HeaderStyle>
                        <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                        <PagerStyle CssClass="pagerRow"></PagerStyle>
                        <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
                        </cc1:MyGridView></div>
                  

        <div class="buju">
         <cc1:MyGridView ID="MyGridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="BasicID" DataSourceID="ObjectDataSource2" Visible="False" EmptyDataText="本学期还没有数据哦！" >
                      <AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
                      <Columns>
                        <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                        <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                        <asp:BoundField DataField="WeightAvgScore" HeaderText="加权成绩" SortExpression="WeightAvgScore" />
                        <asp:BoundField DataField="BodyMindQualityScore" HeaderText="身心素质" SortExpression="BodyMindQualityScore" />
                        <asp:BoundField DataField="IdeologyMoralityScore" HeaderText="思想品德素质：" SortExpression="IdeologyMoralityScore" />
                        <asp:BoundField DataField="Political" HeaderText="思想政治表现" SortExpression="Political" />
                        <asp:BoundField DataField="SocialMora" HeaderText="社会公德" SortExpression="SocialMora" />
                        <asp:BoundField DataField="Law" HeaderText="遵纪守法" SortExpression="Law" />
                        <asp:BoundField DataField="Collective" HeaderText="集体观念" SortExpression="Collective" />
                        <asp:BoundField DataField="PublicWork" HeaderText="公益劳动" SortExpression="PublicWork" />
                        <asp:BoundField DataField="Health" HeaderText="宿舍卫生" SortExpression="Health" />
                        <asp:BoundField DataField="ObeyRule" HeaderText="行为规范" SortExpression="ObeyRule" />                        
                        <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                            </Columns>
                <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                <HeaderStyle CssClass="headerRow"></HeaderStyle>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                <PagerStyle CssClass="pagerRow"></PagerStyle>
                <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
                        </cc1:MyGridView></div>
                 <uc1:MessageBoxControl ID="MsgBox" runat="server" />
    </form>
</body>
</html>
