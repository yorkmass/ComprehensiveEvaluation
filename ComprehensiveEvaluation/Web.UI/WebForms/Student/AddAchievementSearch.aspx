<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAchievementSearch.aspx.cs" Inherits="WebForms_Student_AddAchievementSearch" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>

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
          <h2>
            <asp:Label ID="lblTitle" runat="server" Text="个人录入成果查询（按学期）"></asp:Label>
        </h2>
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByAuditAchi" TypeName="DSSearchAchievementTableAdapters.AchievementTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="sno" SessionField="Sno" Type="String" />
                    <asp:Parameter Name="semester" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Semester] FROM [SemesterStatus]"></asp:SqlDataSource>
        </div>
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
          </asp:DropDownList>
        <div class="buju">
          <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource1" EmptyDataText="本学期还没有数据哦！" OnRowCommand="MyGridView1_RowCommand">
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

              <Columns>                  
                  <asp:BoundField DataField="RuleID" HeaderText="规则编号" SortExpression="RuleID" />
                  <asp:BoundField DataField="Title" HeaderText="成果明细" SortExpression="Title" />
                  <asp:BoundField DataField="Mark" HeaderText="分值" SortExpression="Mark" />
                  <asp:BoundField DataField="AchievementType" HeaderText="成果类型" SortExpression="AchievementType" />
                  <asp:BoundField DataField="ObtainDate" HeaderText="获得时间" SortExpression="ObtainDate" />
                   <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                  <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
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
        <uc1:MessageBoxControl ID="MsgBox" runat="server" />

        <dx:aspxpopupcontrol ID="popupChangeRuleImg" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="popupChangeRule" CloseAction="CloseButton" CssClass="auto-style3" HeaderText="选择加分项" Height="384px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowFooter="True" ShowPageScrollbarWhenModal="True" Theme="Aqua" Width="537px">
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
            </dx:aspxpopupcontrol>
    </form>
</body>
</html>
