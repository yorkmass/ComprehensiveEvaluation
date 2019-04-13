<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AchievementMng.aspx.cs" Inherits="WebForms_Student_AchievementMng" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Infrastructure" Namespace="Infrastructure.Controls" TagPrefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
       <link href="../../css/style.css" rel="stylesheet" />
          <script src="../../Scripts/jquery-3.3.1.min.js"></script>
        <script src="../../script/jquery.js"></script> 
    <style type="text/css">
        .highlightRow {
            cursor: pointer;
        }
        .auto-style1 {
            margin-left: 5px;
        }
        .auto-style2 {
            margin-left: 4px;
        }
        .texts{
            margin-left:15px;
        }
        .buju{
            margin-left:10px;
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

            //-- 控制单选按钮的活动
            $(":radio").click(function () {
                $(":radio").each(function () {
                    this.checked = false;
                    $(this).closest("tr").removeClass("selectedRow");
                });
                $(this).attr("checked", true);
                $(this).closest("tr").addClass("selectedRow");
            });

            $("table[class=dataTable]").find('tr').not("tr[class=headerRow]").click(function () {
                $(":radio").each(function () {
                    this.checked = false;
                    $(this).closest("tr").removeClass("selectedRow");
                });
                $(this).find('input:radio').attr("checked", true);
            });
        });

        function GetSelectedRule() {
            var chkList = $("input:radio:checked"); //Jquery模糊匹配 [att$=value]结尾是这个值
            var arrayList = new Array();
            for (var i = 0; i < chkList.length; i++) {
                arrayList.push(chkList[i].value);
            }
            if (arrayList.length == 0) {
                alert("请先选择加分项！")
                return "";
            }
            else
                return arrayList[0];
        }
        function editHide() {
            document.getElementById("editID").style.display="none";
        }
        function confirmShow() {
             document.getElementById("confirmID").style.display="";
        }

    </script>
    </head>
<body>
    <form id="form1" runat="server">
             <asp:ScriptManager ID="sm" runat="server">
            </asp:ScriptManager> 
        <h2>
            <asp:Label ID="lblTitle" runat="server" Text="社会工作加分"></asp:Label>
        </h2>

        <div id="editID">
        <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True"  ShowAsToolbar="True" Theme="Default" OnItemClick="mnuMain_ItemClick">
            <Paddings PaddingBottom="5px" PaddingTop="8px" />
            <Items>
                <dx:MenuItem Name="Add" Text="添加">
                    <Image Url="~/images/add.png">
                    </Image>
                </dx:MenuItem>
            </Items>
            <ItemStyle>
            <HoverStyle BackColor="#E2F0FF">
                        <Border BorderColor="#A3C0E8" />
                    </HoverStyle>
            </ItemStyle>
            <Border BorderStyle="None" />
        </dx:ASPxMenu></div>



        <div id="confirmID"  style="display:none">
        <dx:ASPxMenu ID="mnuMain0" runat="server" BackColor="White" EnableTheming="True"  ShowAsToolbar="True" Theme="Default" OnItemClick="ItemClick" >
            <Paddings PaddingBottom="5px" PaddingTop="8px" />
            <Items>
                <dx:MenuItem Name="Save" Text="保存">
                    <Image Url="~/images/save.gif">
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
            </div>




        <cc1:MyGridView ID="MyGridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource1" EmptyDataText="没有检索到任何数据。" OnRowCommand="MyGridView1_RowCommand" CssClass="dataTable" ValidateRequestMode="Enabled" ViewStateMode="Enabled" >
             <AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="AchievementID" HeaderText="成果编号" ReadOnly="True" SortExpression="AchievementID" />
                <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                <asp:BoundField DataField="RuleID" HeaderText="规则编号" SortExpression="RuleID" />
                <asp:BoundField DataField="Mark" HeaderText="分值" SortExpression="Mark" />
                <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                <asp:BoundField DataField="ObtainDate" HeaderText="获得日期" SortExpression="ObtainDate" />
                <asp:BoundField DataField="AchievementType" HeaderText="成果类型" SortExpression="AchievementType" />
                <asp:BoundField DataField="Title" HeaderText="成果名称" SortExpression="Title" />
                <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
                <asp:TemplateField HeaderText="提交审核" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="AuditBtn" CausesValidation="false" runat="server" CommandName="AuditRecord" Text="提交审核"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                               <asp:LinkButton ID="btnDelete" CausesValidation="false" runat="server"  CommandName="DeleteRecord" Text="删除"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                         <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnDelete" ConfirmText="删除无法恢复，您真的要删除当前记录吗？" runat="server"></asp:ConfirmButtonExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="highlightRow"></EditRowStyle>
                <HeaderStyle CssClass="headerRow"></HeaderStyle>
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PreviousPageText="上一页"></PagerSettings>
                <PagerStyle CssClass="pagerRow"></PagerStyle>
                <SelectedRowStyle CssClass="selectedRow"></SelectedRowStyle>
       </cc1:MyGridView>
        
        <br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="Sno" SessionField="Sno" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="myHiddenField" runat="server" />
        <dx:ASPxPopupControl ID="popupChangeRule" runat="server" CloseAction="CloseButton" HeaderText="选择加分项" Height="384px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Theme="Aqua" Width="537px" PopupAnimationType="Fade" ShowCloseButton="False" ClientInstanceName="popupChangeRule" AllowDragging="True" AllowResize="True" ShowPageScrollbarWhenModal="True">
                <HeaderImage Url="~/images/edit.png">
                </HeaderImage>
                <FooterStyle>
                    <Paddings Padding="5px" />
                </FooterStyle>
                <FooterTemplate> 
                    <dx:ASPxMenu ID="mnuToolBar" runat="server" EnableTheming="True" Theme="Aqua" ShowAsToolbar="True" >
                        <ClientSideEvents ItemClick="function(s, e) {
	e.processOnServer = false;
    var itemName = e.item.name;
	switch(itemName){
		case 'Cancel':
			popupChangeRule.Hide();
			break;
		case 'Save':
			var ruleID = GetSelectedRule();
            if(ruleID != '')
            {
                document.getElementById('myHiddenField').value=ruleID;
                editHide();
                confirmShow();
                popupChangeRule.Hide();              
            }
            break;
	}
}" />
                        <Items>
                            <dx:MenuItem Name="Save" Text="确定" >
                                <Image Url="~/images/accept.png">                                    
                                </Image>
                            </dx:MenuItem>
                            <dx:MenuItem Name="Cancel" Text="取消">
                                <Image Url="~/images/close.gif">
                                </Image>
                            </dx:MenuItem>
                            
                        </Items>
                    </dx:ASPxMenu>
                </FooterTemplate>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" SupportsDisabledAttribute="True">
                        <div class="buju">
                        <asp:Label ID="Label1" runat="server" Text="所属组织：" CssClass="texts"></asp:Label>
                        <asp:TextBox ID="Organization" runat="server" placeholder="管理学院" CssClass="auto-style2" Width="140px"></asp:TextBox>
                       
                        <asp:Label ID="Label2" runat="server" CssClass="texts" Text="职位："></asp:Label>
                        <asp:TextBox ID="PositionType" runat="server" placeholder="学生会主席" CssClass="auto-style1" ></asp:TextBox>
                        
                        </div>
                        <div class="buju"><asp:Label ID="Label3" runat="server" Text="项目分值" CssClass="texts"></asp:Label></div>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RuleID" DataSourceID="SqlDataSourceRules" OnSelectedIndexChanged="Page_Load" CssClass="dataTable" Width="583px">
                            <AlternatingRowStyle CssClass="alternateRow" />
                            <Columns>
                                                <asp:TemplateField HeaderText="RuleID" SortExpression="RuleID" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RuleID") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRuleID" runat="server" Text='<%# Bind("RuleID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParentRuleID" runat="server" Text='<%# Bind("ParentRuleID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                     <ItemTemplate>
                                                        <asp:Label ID="lblRuleName" runat="server" Text='<%# Bind("RuleName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                     <ItemTemplate>
                                                        <asp:Label ID="lblScore" runat="server" Text='<%# Bind("Score") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <input id="optItem" value='<%# Eval("RuleID") %>' runat="server" type="radio" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               <asp:BoundField DataField="RuleID" HeaderText="项目编号" SortExpression="OrderID">
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ParentRuleID" HeaderText="项目大类" SortExpression="RuleName">
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="RuleName" HeaderText="加分项" SortExpression="Score">
                                                    <ItemStyle Width="380px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Score" HeaderText="分值" SortExpression="OrderID">
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                            </Columns>
                            <EditRowStyle CssClass="highlightRow" />
                                            <HeaderStyle CssClass="headerRow" />
                                             <PagerStyle CssClass="pagerRow" />
                                            <SelectedRowStyle CssClass="selectedRow" />
                        </asp:GridView>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

        <asp:SqlDataSource ID="SqlDataSourceRules" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [RuleID], [ParentRuleID], [RuleName], [Score] FROM [Rules] WHERE ([ParentRuleID] = @ParentRuleID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="F4" Name="ParentRuleID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
             <br />
             <uc1:MessageBoxControl ID="MsgBox" runat="server" />
    </form>
   
</body>
</html>
