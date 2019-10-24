<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AchievementCompetition.aspx.cs" Inherits="WebForms_Student_AchievementCompetition" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=yes">
    <title></title>   
    <link href="../../css/style.css" rel="stylesheet" />
          <script src="../../Scripts/jquery-3.3.1.min.js"></script>
        <script src="../../script/jquery.js"></script> 
    <script async>
	    function fp_ready(){
	// setting custom defaults
	Flatpickr.l10n.firstDayOfWeek = 1;

	//Regular flatpickr
	document.getElementById("flatpickr-tryme").flatpickr();
	document.getElementsByClassName("calendar").flatpickr();

	var calendars = document.getElementsByClassName("flatpickr").flatpickr();

	var real_selection = document.getElementById("realdate");
	document.getElementById("alt")._flatpickr.config.onChange = function(obj, str){
		real_selection.textContent = str;
	}

	document.getElementById("disableRange").flatpickr({
		disable: [
			{
				from: "2016-08-16",
				to: "2016-08-19"
			},
			"2016-08-24",
			new Date().fp_incr(30) // 30 days from now
		],
		minDate: "today"
	});

	document.getElementById("disableOddDays").flatpickr({
		disable: [
			function(date) { return date.getDate()%2; } // disable odd days
		]
	});
	document.getElementById("enableNextSeven").flatpickr({
		enable: [
			{
				from: "today",
				to: new Date().fp_incr(7)
			}
		]
	});
	document.getElementById("enableCustom").flatpickr({
		enable: [
			function(dateObj){
				return dateObj.getDay() %6 !== 0 && dateObj.getFullYear() === 2016;
			}
		]
	});

	// Event API
	var events = document.getElementById("events");
	document.getElementById("events-api-example").flatpickr({
		minDate: "today",
		enableTime: true,
		onChange: function(dateObj, dateStr, fp) {
			console.log(fp.selectedDateObj);
			events.innerHTML += "<b>onChange</b> (<code>" + dateObj + "</code>, <code>" + dateStr + "</code> )<br>";
			events.scrollTop = events.offsetTop;
		},
		onOpen: function(dateObj, dateStr, fp){
			events.innerHTML += "<b>onOpen</b> (<code>" + dateObj + "</code>, <code>" + dateStr + "</code> )<br>";
			events.scrollTop = events.offsetTop;
		},
		onClose: function(dateObj, dateStr, fp){
			events.innerHTML += "<b>onClose</b> (<code>" + dateObj + "</code>, <code>" + dateStr + "</code> )<br>";
			events.scrollTop = events.offsetTop;
		},
		onReady: function(dateObj, dateStr, fp){
			events.innerHTML += "<b>onReady</b> (<code>" + dateObj + "</code>, <code>" + dateStr + "</code> )<br>";
			events.scrollTop = events.offsetTop;
		}
	});

	// Check in/out example
	var check_in = document.getElementById("check_in_date").flatpickr({
		altInput: true,
		altFormat: "\\C\\h\\e\\c\\k \\i\\n\\: l, F j Y",
		minDate: new Date()
	});
	var check_out = document.getElementById("check_out_date").flatpickr({
		altInput: true,
		altFormat: "\\C\\h\\e\\c\\k \\o\\u\\t: l, F j Y",
		minDate: new Date()
	});

	check_in.config.onChange = function(dateObj) {
		check_out.set("minDate", dateObj.fp_incr(1));
	};
	check_out.config.onChange = function(dateObj) {
		check_in.set("maxDate", dateObj.fp_incr(-1));
	}

	var fiscal = document.getElementById("fiscal").flatpickr({
		weekNumbers: true
	});

	// Fiscal calendar
	fiscal.getWeek = function(givenDate){
		var checkDate = new Date(givenDate.getTime());
		checkDate.setDate(checkDate.getDate() + 4 - (checkDate.getDay() || 7));
		var time = checkDate.getTime();
		checkDate.setMonth(7);
		checkDate.setDate(28);
		var week = (Math.floor(Math.round((time - checkDate) / 86400000) / 7) + 2);
		if (week < 1) {
			week = 52 + week;
		}
		return 'FW' + ("0" + week).slice(-2);
	}

	fiscal.redraw();


	// Date format
	var fpInstance = new Flatpickr(document.createElement("input")),
		formatOutput = document.getElementById("dateFormatOutput"),
		now = new Date();

	document.getElementById("dateFormatComposer").addEventListener("keyup", function(e){
		formatOutput.textContent = fpInstance.formatDate(e.target.value, now);
	});

	}
	</script>
	<script async src="../../script/dist/flatpickr.js" onload="fp_ready()"></script>	
	<script async id="locale_script"></script>
	<link rel="stylesheet" id=cal_style type="text/css" href="../../script/dist/flatpickr.min.css">
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
    
.dxmLite,
.dxmLite .dxm-item a.dx 
{
	color: Black;
}
.dxmLite
{
	font: 12px Tahoma, Geneva, sans-serif;
}
.dxmLite .dxm-main.dxmtb 
{
	padding: 2px;
}
.dxmLite .dxm-main
{
	border: 1px solid #A8A8A8;
	background-color: #F0F0F0;
	padding: 2px;
}

.dxm-ltr .dxm-main,
.dxm-ltr .dxm-horizontal ul.dx 
{
	float: left;
}
.dxm-main
{
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.dxmDesignMode > tbody > tr > td,
.dxm-item,
.dxm-spacing {
	padding: 0;
}

.dxmDesignMode > tbody > tr > td > table {
	width: 100%;
}

.dxm-ltr .dxm-horizontal .dxm-item,
.dxm-ltr .dxm-horizontal .dxm-spacing,
.dxm-ltr .dxm-horizontal .dxm-separator,
.dxm-ltr .dxm-content
{
	float: left;
}
.dxmLite .dxm-item,
.dxmLite .dxm-popOut 
{
	border-color: transparent;
	border-style: solid;
}

.dxmLite .dxm-item 
{
	border-width: 1px;
}

.dxmLite .dxm-item 
{
	cursor: default;
    text-align: left;
}
.dxmLite .dxm-horizontal.dxmtb .dxm-image-l .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-r .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-l .dxm-subMenu .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-r .dxm-subMenu .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-t .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-b .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-t .dxm-subMenu .dxm-content,
.dxmLite .dxm-horizontal.dxmtb .dxm-image-b .dxm-subMenu .dxm-content
{
	padding: 4px;
}
.dxmLite .dxm-horizontal .dxm-image-l .dxm-content,
.dxmLite .dxm-horizontal .dxm-image-r .dxm-content 
{
	padding: 3px 7px 4px;
}

.dxmLite .dxm-content
{
    display: block;
	white-space: nowrap;
}

.dxm-content.dxm-hasText
{
	line-height: 100%;
}

.dxm-content
{
	line-height: 0;
}

.dxm-content {
	font: 12px Tahoma, Geneva, sans-serif;
	float: none !important;
}

.dxmLite .dxm-horizontal .dxm-image-l .dxm-hasText .dxm-image
{
	margin-right: 5px;
}
.dxm-image,
.dxm-pImage 
{
	border-width: 0px;
}

.dx-vam, .dx-valm { vertical-align: middle; }
.dx-vam, .dx-vat, .dx-vab { display: inline-block!important; }
.dx-clear
{
	display: block;
	clear: both;
	height: 0;
	width: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	visibility: hidden;
}
        .auto-style2 {
            margin-left: 4px;
        }
        .auto-style1 {
            margin-left: 5px;
        }
        .auto-style3 {
            margin-right: 24px;
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


        function editHide() {
            document.getElementById("editID").style.display="none";
        }
        function confirmShow() {
             document.getElementById("confirmID").style.display="";
    }
    function getTimeId() {
        var id = "";
        id=document.getElementById("flatpickr-tryme").value;
        if (id == "") {
            alert("请选择日期!");
            return "";
        }
        else {
            console.log(id);
            return id;
        }                    
    }

    </script>
</head>
<body>
    <form id="form123" runat="server">
        <asp:ScriptManager ID="sm" runat="server">
            </asp:ScriptManager>
        <h2><asp:Label ID="lblTitle" runat="server" Text="文体竞赛加分"></asp:Label></h2>
            
        <div id="editID"><dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="True"  ShowAsToolbar="True" Theme="Default" OnItemClick="mnuMain_ItemClick">
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

        <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="AchievementID" DataSourceID="ObjectDataSource1" OnRowCommand="MyGridView1_RowCommand"  EmptyDataText="没有检索到任何数据。" >
   <AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

            <Columns>               
                <asp:BoundField DataField="Sno" HeaderText="学号" SortExpression="Sno" />
                <asp:BoundField DataField="RuleID" HeaderText="规则编号" SortExpression="RuleID" />
                <asp:BoundField DataField="Mark" HeaderText="分值" SortExpression="Mark" />
                <asp:BoundField DataField="Semester" HeaderText="学期" SortExpression="Semester" />
                <asp:BoundField DataField="Title" HeaderText="成果名称" SortExpression="Title" />
                <asp:BoundField DataField="ObtainDate" HeaderText="获得日期" SortExpression="ObtainDate" />
                <asp:BoundField DataField="AchievementType" HeaderText="成果类型" SortExpression="AchievementType" />
                <asp:BoundField DataField="Year" HeaderText="取得年份" SortExpression="Year" />
                <asp:BoundField DataField="CompetitionName" HeaderText="比赛名称" SortExpression="CompetitionName" />
                <asp:BoundField DataField="AwardType" HeaderText="获奖类别" SortExpression="AwardType" />
                <asp:BoundField DataField="AwardLevel" HeaderText="获奖名次" SortExpression="AwardLevel" />
                <asp:BoundField DataField="LastUpdateTime" HeaderText="提交时间" SortExpression="LastUpdateTime" />
                <asp:BoundField DataField="AuditStatus" HeaderText="审核状态" SortExpression="AuditStatus" />
            <asp:TemplateField HeaderText="提交审核" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="AuditBtn" CausesValidation="false" runat="server" CommandName="AuditRecord" Text="提交审核"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="下载附件" ShowHeader="False">
                        <ItemTemplate>
                               <asp:LinkButton ID="btnDown" CausesValidation="false" runat="server"  CommandName="Down" Text="下载附件"  CommandArgument='<%# Eval("AchievementID") %>'></asp:LinkButton>
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
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DSSportTableAdapters.SportTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="sno" SessionField="Sno" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:HiddenField ID="myHiddenField" runat="server" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT RuleID, RuleName, Score FROM Rules WHERE (ParentRuleID = N'F3') AND (RuleID = @RuleID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="RuleID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [RuleName], [ParentRuleID], [RuleID] FROM [Rules] WHERE ([ParentRuleID] = @ParentRuleID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="F3" Name="ParentRuleID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <dx:ASPxPopupControl ID="popupChangeRule" runat="server" CloseAction="CloseButton" HeaderText="选择加分项" Height="384px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Theme="Aqua" Width="537px" PopupAnimationType="Fade" ShowCloseButton="False" ClientInstanceName="popupChangeRule" AllowDragging="True" AllowResize="True" ShowPageScrollbarWhenModal="True" CssClass="auto-style3">
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
    var id='';  
	switch(itemName){
		case 'Cancel':
			popupChangeRule.Hide();
			break;
		case 'Save':
            id=getTimeId();
            if(id!=''){
                    document.getElementById('myHiddenField').value=id;
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
                        <br />
                         <h2><asp:Label ID="Label6" runat="server" Text="上传材料" CssClass="texts"></asp:Label></h2>
                         <div class="buju">
                             <asp:FileUpload ID="fileUploader" runat="server"  CssClass="auto-style1" BorderStyle="Inset" Height="20px" Width="65px"  AllowMultiple ="True" ToolTip="请上传.jpg\.png格式附件，命名方式：学号+时间（19970917）+编号（自己定义，重复无效）" />
                             <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">上传</asp:LinkButton><asp:Label ID="TextTip" runat="server" Text="请上传.jpg\.png格式附件，命名方式：学号+时间（19970917）+编号（自己定义，重复无效）" CssClass="buju" ForeColor="#990000"></asp:Label>
                             <br />
                         </div>
                        <h2><asp:Label ID="Label1" runat="server" Text="请先选择加分条目" CssClass="texts" ></asp:Label></h2>
                        <div class="buju">
                            <asp:Label ID="AddScore" runat="server" CssClass="texts" Text="加分条目："></asp:Label>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="RuleName" DataValueField="RuleID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                       
                        <br /><br />
                        <h2><asp:Label ID="Label3" runat="server" Text="所选项目分值" CssClass="texts" ></asp:Label></h2>
                        <div class="buju">                            
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RuleID" DataSourceID="SqlDataSource1" CssClass="dataTable" Width="583px" EmptyDataText="没有检索到任何数据。" >
                            <AlternatingRowStyle CssClass="alternateRow" />
                            <Columns>
                                <asp:BoundField DataField="RuleID" HeaderText="规则编号" ReadOnly="True" SortExpression="RuleID" />
                                <asp:BoundField DataField="RuleName" HeaderText="规则名" SortExpression="RuleName" />
                                <asp:BoundField DataField="Score" HeaderText="分值" SortExpression="Score" />
                            </Columns>
                              <EditRowStyle CssClass="highlightRow" />
                                            <HeaderStyle CssClass="headerRow" />
                                             <PagerStyle CssClass="pagerRow" />
                                            <SelectedRowStyle CssClass="selectedRow" />
                        </asp:GridView>
                           </div>
                        <br />
                        <h2><asp:Label ID="Label2" runat="server" Text="完善加分信息" CssClass="texts" ></asp:Label><br />
                            <asp:Label ID="Label4" runat="server" Text="_____________________________________________________________" ForeColor="#66CCFF"></asp:Label>
                        </h2>
                        
                        <div class="buju">
                         <br /><br />
                        <asp:Label ID="ComName" runat="server" Text="比赛名称：" CssClass="texts"></asp:Label>
                        <asp:TextBox ID="ComNameValue" runat="server" placeholder="健美操比赛" CssClass="auto-style2" Width="124px"></asp:TextBox>                       
                        <asp:Label ID="ComType" runat="server" CssClass="texts" Text="比赛类别："></asp:Label>
                        <asp:TextBox ID="ComTypeValue" runat="server" placeholder="校级" CssClass="auto-style1" Width="108px" ></asp:TextBox></div>
                        <div class="buju">
                            <asp:Label ID="ComWard" runat="server" CssClass="texts" Text="比赛名次："></asp:Label>
                            <asp:TextBox ID="ComWardValue" runat="server" CssClass="auto-style2" placeholder="一等奖" Width="121px"></asp:TextBox>
                        <asp:Label ID="Label5" runat="server" CssClass="texts" Text="获奖时间："></asp:Label>
                           <input id="flatpickr-tryme" placeholder="请选择时间.." /></div>
                        <br /><br /><br />
                         
                        
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        <uc1:MessageBoxControl ID="MsgBox" runat="server" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        
    </form>
</body>
</html>
