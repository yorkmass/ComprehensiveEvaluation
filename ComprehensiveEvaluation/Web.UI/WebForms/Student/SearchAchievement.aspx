<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchAchievement.aspx.cs" Inherits="WebForms_Student_SearchAchievement" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
          <link href="../../css/style.css" rel="stylesheet" />
          <script src="../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../../script/GridLineHotTrack.js"></script>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <h2>
            <asp:Label ID="lblTitle" runat="server" Text="成果查询（按学期）"></asp:Label>
        </h2>
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSSearchAchievementTableAdapters.AchievementAllTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="sno" SessionField="Sno" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
         <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSSearchAchievementTableAdapters.AchievementTableAdapter">
             <SelectParameters>
                 <asp:SessionParameter Name="sno" SessionField="Sno" Type="String" />
                 <asp:Parameter Name="semester" Type="String" />
             </SelectParameters>
         </asp:ObjectDataSource>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Semester] FROM [SemesterStatus]"></asp:SqlDataSource>
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
         </asp:DropDownList>
        <div class="buju">
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource2" CssClass="dataTable"  EmptyDataText="本学期还没有数据哦！" Visible="False" >
             <AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
             <Columns>
                 <asp:BoundField DataField="RuleID" HeaderText="规则编号" SortExpression="RuleID" />
                 <asp:BoundField DataField="Title" HeaderText="成果明细" SortExpression="Title" />
                 <asp:BoundField DataField="Mark" HeaderText="分值" SortExpression="Mark" />
                 <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                 <asp:BoundField DataField="AchievementType" HeaderText="成果类型" SortExpression="AchievementType" />
                 <asp:BoundField DataField="ObtainDate" HeaderText="获得时间" SortExpression="ObtainDate" />
                 <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                 <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
             </Columns>
             <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                <HeaderStyle CssClass="headerRow"></HeaderStyle>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                <PagerStyle CssClass="pagerRow"></PagerStyle>
                <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
         </asp:GridView>
            </div>
        <div class="buju">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource1" CssClass="dataTable" EmptyDataText="本学期还没有数据哦！" >
             <AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
             <Columns>
                 <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                 <asp:BoundField DataField="Title" HeaderText="成果明细" SortExpression="Title" />
                 <asp:BoundField DataField="Mark" HeaderText="分值" SortExpression="Mark" />
                 <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                 <asp:BoundField DataField="AchievementType" HeaderText="成果类型" SortExpression="AchievementType" />
                 <asp:BoundField DataField="ObtainDate" HeaderText="获得时间" SortExpression="ObtainDate" />
                 <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
             </Columns>
             <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                <HeaderStyle CssClass="headerRow"></HeaderStyle>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                <PagerStyle CssClass="pagerRow"></PagerStyle>
                <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
         </asp:GridView>
            <div class="buju">
                <uc1:MessageBoxControl ID="MsgBox" runat="server" />
    </form>
</body>
</html>
