<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AchievementToAudit.aspx.cs" Inherits="WebForms_ClassAdmin_AchievementToAudit" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
         <h2><asp:Label ID="lblTitle" runat="server" Text="学生成果审核"></asp:Label></h2>
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="DSClassAuditTableAdapters.ClassAuditTableAdapter">
                <SelectParameters>
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="semester" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
         <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSClassAuditTableAdapters.ClassAuditTableAdapter">
             <SelectParameters>
                 <asp:Parameter Name="Class" Type="String" />
                 <asp:Parameter Name="semester" Type="String" />
             </SelectParameters>
         </asp:ObjectDataSource>
         <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"  CssClass="dataTable" DataSourceID="ObjectDataSource1" OnRowCommand="MyGridView1_RowCommand" EmptyDataText="嘤嘤嘤！大家都没有提交审核啦！"  >
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
             <Columns>
                 <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                 <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                 <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                 <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                 <asp:BoundField DataField="Title" HeaderText="成果明细" SortExpression="Title" />
                 <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                 <asp:BoundField DataField="ObtainDate" HeaderText="获得时间" SortExpression="ObtainDate" />
                 <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                 <asp:BoundField DataField="AchievementType" HeaderText="成果类别" SortExpression="AchievementType" />
                  <asp:TemplateField HeaderText="初审通过" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="AuditBtn" CausesValidation="false" runat="server" CommandName="Pass" Text="确认通过"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="退回待审" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="BackBtn" CausesValidation="false" runat="server" CommandName="Back" Text="退回待审"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                <asp:TemplateField HeaderText="初审未过" ShowHeader="False">
                        <ItemTemplate>
                               <asp:LinkButton ID="btnDelete" CausesValidation="false" runat="server"  CommandName="Reject" Text="驳回"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                         <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnDelete" ConfirmText="确认驳回该条申请？" runat="server"></asp:ConfirmButtonExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
             </Columns>
<EditRowStyle CssClass="highlightRow"></EditRowStyle>
<HeaderStyle CssClass="headerRow"></HeaderStyle>
<PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
<PagerStyle CssClass="pagerRow"></PagerStyle>
<SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
         </cc1:MyGridView>
        <div class="topaway"><h2><asp:Label ID="Label1" runat="server" Text="已驳回申请"></asp:Label></h2></div>
        <div class="buju">
            您本学期已经驳回<asp:Label ID="Nums" runat="server" ForeColor="#CC3300" Font-Size="Medium"></asp:Label>条申请，记得安慰人家哦！名单如下： </div>
<div class="topaway">    </div>

<cc1:MyGridView ID="MyGridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataSourceID="ObjectDataSource2" EmptyDataText="大家提交的信息都没有问题咯！" OnRowCommand="MyGridView2_RowCommand" >
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

                <Columns>
                    <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                    <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                    <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                    <asp:BoundField DataField="Title" HeaderText="成果明细" SortExpression="Title" />
                    <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                    <asp:BoundField DataField="ObtainDate" HeaderText="获得日期" SortExpression="ObtainDate" />
                    <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                    <asp:BoundField DataField="AchievementType" HeaderText="成果类别" SortExpression="AchievementType" />
                     <asp:TemplateField HeaderText="取消驳回" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="BackBtnB" CausesValidation="false" runat="server" CommandName="Back" Text="取消驳回"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
<EditRowStyle CssClass="highlightRow"></EditRowStyle>
<HeaderStyle CssClass="headerRow"></HeaderStyle>
<PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
<PagerStyle CssClass="pagerRow"></PagerStyle>
<SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
            </cc1:MyGridView>

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
        <uc1:MessageBoxControl ID="MsgBox" runat="server" />
    </form>
</body>
</html>
