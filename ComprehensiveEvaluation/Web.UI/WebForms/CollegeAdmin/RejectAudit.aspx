<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RejectAudit.aspx.cs" Inherits="WebForms_CollegeAdmin_RejectAudit" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
         <h2><asp:Label ID="lblTitle" runat="server" Text="复审未通过名单"></asp:Label></h2>
        <div>
            <div class="buju">
            <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource1" EmptyDataText="本学期还没有数据哦！" OnRowCommand="MyGridView1_RowCommand">
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
            </cc1:MyGridView></div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy1" TypeName="DSCollegeAuditTableAdapters.CollegeAuditTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="semester" SessionField="Semester" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <dx:ASPxPopupControl ID="popupChangeRuleImg" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="popupChangeRule" CloseAction="CloseButton" CssClass="auto-style3" HeaderText="选择加分项" Height="384px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowFooter="True" ShowPageScrollbarWhenModal="True" Theme="Aqua" Width="537px">
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
