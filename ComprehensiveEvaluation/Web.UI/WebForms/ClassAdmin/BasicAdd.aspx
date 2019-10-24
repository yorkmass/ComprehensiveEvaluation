<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicAdd.aspx.cs" Inherits="WebForms_ClassAdmin_BasicAdd" %>
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
        .longtexts{
            margin-left:35px;
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [Name], [Sno] FROM [BasisScore] WHERE ([Class] = @Class)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Class" SessionField="ClassName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <h2>
            <asp:Label ID="lblTitle" runat="server" Text="基础性素质分数录入"></asp:Label>
        </h2>
        <div>
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




            <dx:ASPxPopupControl ID="popupChangeRule" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="popupChangeRule" CloseAction="CloseButton" CssClass="auto-style3" HeaderText="选择加分项" Height="384px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowFooter="True" ShowPageScrollbarWhenModal="True" Theme="Aqua" Width="537px">
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
		case 'Save':
                    editHide();
                    confirmShow();
                    popupChangeRule.Hide();
                    break;
                      
	                }
}" />
                        <Items>
                            <dx:MenuItem Name="Save" Text="确定">
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
                <contentcollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" SupportsDisabledAttribute="True">
                        <br />
                        <h2>
                            <asp:Label ID="Label1" runat="server" CssClass="texts" Text="给班级所有成员置入默认分值"></asp:Label>
                        </h2>
                        <div class="buju">
                            <asp:Label ID="Label6" runat="server" Text="置入默认分值：" CssClass="texts"></asp:Label><asp:LinkButton ID="ResetDefaultScore" runat="server" Text="初始化" CssClass="texts" OnClick="ResetDefaultScore_Click" />
                        </div>
                       
                        <br /><br />
                        <h2>
                            <asp:Label ID="Label3" runat="server" CssClass="texts" Text="选择班级成员"></asp:Label>
                        </h2>
                       <div class="buju">
                           <asp:Label ID="Label5" runat="server" Text="选择人员：" CssClass="texts"></asp:Label>
                           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Sno" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="texts">
                           </asp:DropDownList>
                       </div>
                        <br />
                        <h2>
                            <asp:Label ID="Label2" runat="server" CssClass="texts" Text="修改个人分值"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" ForeColor="#66CCFF" Text="_____________________________________________________________"></asp:Label>
                        </h2>
                         <div class="buju">
                              <div class="buju">
                            <asp:Label ID="Political" runat="server" CssClass="texts" Text="思想政治表现："></asp:Label>
                            <asp:TextBox ID="PoliticalValue" runat="server" CssClass="auto-style2"  Width="121px"></asp:TextBox>
                            <asp:Label ID="SocialM" runat="server" CssClass="texts" Text="社会公德："></asp:Label>
                                  <asp:TextBox ID="SocialMValue" runat="server"></asp:TextBox>
                        </div>
                        <div class="buju">
                            <asp:Label ID="Law" runat="server" CssClass="texts" Text="遵纪守法："></asp:Label>
                            <asp:TextBox ID="LawValue" runat="server" CssClass="auto-style2"  Width="121px"></asp:TextBox>
                            <asp:Label ID="Collective" runat="server" CssClass="texts" Text="集体观念："></asp:Label>
                            <asp:TextBox ID="CollectiveValue" runat="server"></asp:TextBox>
                        </div>
                             <div class="buju">
                            <asp:Label ID="PublicWork" runat="server" CssClass="texts" Text="公益劳动："></asp:Label>
                            <asp:TextBox ID="PublicWorkValue" runat="server" CssClass="auto-style2" Width="121px"></asp:TextBox>
                            <asp:Label ID="Health" runat="server" CssClass="texts" Text="宿舍卫生："></asp:Label>
                            <asp:TextBox ID="HealthValue" runat="server"></asp:TextBox>
                        </div>
                             <div class="buju">
                            <asp:Label ID="ObeyRule" runat="server" CssClass="texts" Text="行为规范："></asp:Label>
                            <asp:TextBox ID="ObeyRuleValue" runat="server" CssClass="auto-style2"  Width="121px"></asp:TextBox>
                            <asp:Label ID="BodySore" runat="server" CssClass="texts" Text="身心素质测评："></asp:Label>
                            <asp:TextBox ID="BodyScoreValue" runat="server" CssClass="auto-style2"  Width="121px"></asp:TextBox>
                             </div>
                            
                            <div class="buju">
                                 <asp:Label ID="Caculater" runat="server" CssClass="texts" Text="计算总分："></asp:Label>
                                <asp:LinkButton ID="CaculaterBtn" runat="server" CssClass="texts" Text="计算" OnClick="CaculaterBtn_Click"></asp:LinkButton>
                                <asp:Label ID="LabelMor" runat="server" CssClass="longtexts" Text="思想品德素质测评总分：" Visible="False"></asp:Label><asp:Label ID="MoraTotal" runat="server" Text="" ForeColor="#990000"></asp:Label>
                                <asp:Label ID="LabelBody" runat="server" CssClass="longtexts" Text="身心素质测评总分：" Visible="False"></asp:Label><asp:Label ID="BodyTotal" runat="server" Text="" ForeColor="#990000"></asp:Label>
                        </div>
                        </div>
                        <br /><br /><br /><br />
                    </dx:PopupControlContentControl>
                </contentcollection>
            </dx:ASPxPopupControl>





        </div>
         <uc1:MessageBoxControl ID="MsgBox" runat="server" />
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
                <cc1:MyGridView ID="MyGridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="BasicID" DataSourceID="ObjectDataSource1" EmptyDataText="快给大家初始化成绩啦！" >
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
                </cc1:MyGridView>
    </form>
</body>
</html>
