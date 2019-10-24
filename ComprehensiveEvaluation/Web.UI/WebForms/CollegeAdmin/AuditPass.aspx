<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AuditPass.aspx.cs" Inherits="WebForms_CollegeAdmin_AuditPass" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
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
<body>
    <form id="form1" runat="server">
        <h2><asp:Label ID="lblTitle" runat="server" Text="审核通过名单"></asp:Label></h2>
        <div>
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
                    <asp:DropDownList ID="DClassName" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="Class" DataValueField="Class" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Visible="False">
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
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy2" TypeName="DSCollegeAuditTableAdapters.CollegeAuditTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="semester" Type="String" />
                <asp:Parameter Name="ClassName" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Semester] FROM [SemesterStatus]"></asp:SqlDataSource>
        <div class="buju"><div class="left1">
        <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource3" EmptyDataText="本学期还没有数据哦！" OnRowCommand="MyGridView1_RowCommand" >
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

            <Columns>
                <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                <asp:BoundField DataField="RuleID" HeaderText="规则编号" SortExpression="RuleID" />
                <asp:BoundField DataField="Title" HeaderText="成果详情" SortExpression="Title" />
                <asp:BoundField DataField="Mark" HeaderText="分值" SortExpression="Mark" />
                <asp:BoundField DataField="ObtainDate" HeaderText="获得日期" SortExpression="ObtainDate" />
                <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                <asp:BoundField DataField="AchievementType" HeaderText="成果类型" SortExpression="AchievementType" />
                <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                 <asp:TemplateField HeaderText="预览附件" ShowHeader="False">
                        <ItemTemplate>
                               <asp:LinkButton ID="LOOKIT" CausesValidation="false" runat="server"  CommandName="Look" Text="预览附件"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="下载附件" ShowHeader="False">
                        <ItemTemplate>
                               <asp:LinkButton ID="btnDown" CausesValidation="false" runat="server"  CommandName="Down" Text="下载附件"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>

<EditRowStyle CssClass="highlightRow"></EditRowStyle>

<HeaderStyle CssClass="headerRow"></HeaderStyle>

<PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>

<PagerStyle CssClass="pagerRow"></PagerStyle>

<SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
        </cc1:MyGridView></div><div class="buju1"></div></div>

        <dx:ASPxPopupControl ID="popupChangeRuleImg" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="popupChangeRule" CloseAction="CloseButton" CssClass="auto-style3" HeaderText="附件预览" Height="384px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowFooter="True" ShowPageScrollbarWhenModal="True" Theme="Aqua" Width="537px">
                <HeaderImage Url="~/images/edit.png">

                </HeaderImage>
                <FooterStyle>
                <Paddings Padding="5px" />
                </FooterStyle>
                <FooterTemplate>
                    <dx:ASPxMenu ID="mnuToolBar" runat="server" EnableTheming="True" ShowAsToolbar="True" Theme="Aqua">
                        <ClientSideEvents ItemClick="function(s, e) {
	e.processOnServer = false;
    var itemName = e.item.name;
	switch(itemName){
		case 'Cancel':
			popupChangeRule.Hide();
			break;
                            }
}" />
                        <Items>
                            <dx:MenuItem Name="Cancel" Text="取消">
                                <Image Url="~/images/close.gif">
                                </Image>
                            </dx:MenuItem>
                        </Items>
                    </dx:ASPxMenu>
                </FooterTemplate>
                <contentcollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" SupportsDisabledAttribute="True">
                       
                        <asp:Image ID="Image1" runat="server" Height="461px" Width="520px" />
                       
                    </dx:PopupControlContentControl>
                </contentcollection>
            </dx:ASPxPopupControl>
        <uc1:MessageBoxControl ID="MsgBox" runat="server"  />

    </form>
</body>
</html>
