<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookBasicScore.aspx.cs" Inherits="WebForms_CollegeAdmin_LookBasicScore" %>

<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>

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
        .buju1{
            clear:both;
        }
        .topaway{
            margin-top:20px;
        }
        #clicka{
            width:100px;
            margin-left:15px;
            float:left;
        }
        .left1{
            float:left;
            margin-left:15px;
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
         function clicka() {
             alert("请选择专业");
         }
    </script>
</head>
</head>
<body>
    <form id="form1" runat="server">
        <h2><asp:Label ID="lblTitle" runat="server" Text="基础性素质分查看"></asp:Label></h2>
        <div class="buju">
                <div class="left1">
                    <asp:DropDownList ID="DMarjor" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Major" DataValueField="Major" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div id="clicka" onclick="clicka()">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Selected="True">请选择班级</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="left1">
                    <asp:DropDownList ID="DClassName" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="Class" DataValueField="Class" OnSelectedIndexChanged="DClassName_Change" Visible="False">
                    </asp:DropDownList>
                </div>
                <div class="left1">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1"></asp:DropDownList>
                </div>
            <div class="left1">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">检索</asp:LinkButton>
                </div>
                <div class="buju1">
                </div>
            </div>
        <div>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSCollegeAuditTableAdapters.CollegeGetMajorTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="college" SessionField="College" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSCollegeAuditTableAdapters.MajorGetClassTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="major" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Semester] FROM [SemesterStatus]"></asp:SqlDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSLookBasicScoreTableAdapters.BasisScoreTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_BasicID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Sno" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
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
                <asp:Parameter Name="ClassName" Type="String" />
                <asp:Parameter Name="semester" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sno" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
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
                <asp:Parameter Name="Original_BasicID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <div class="buju"><div class="left1">
        <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="BasicID" DataSourceID="ObjectDataSource3" EmptyDataText="本学期还没有数据哦！" >
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

            <Columns>
                <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                <asp:BoundField DataField="WeightAvgScore" HeaderText="加权成绩" SortExpression="WeightAvgScore" />
                <asp:BoundField DataField="BodyMindQualityScore" HeaderText="身心素质" SortExpression="BodyMindQualityScore" />
                <asp:BoundField DataField="IdeologyMoralityScore" HeaderText="思想品德素质" SortExpression="IdeologyMoralityScore" />
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
        </cc1:MyGridView></div><div class="buju1"></div>
    </form>
</body>
</html>
