<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClassAdminMng.aspx.cs" Inherits="WebForms_CollegeAdmin_ClassAdminMng" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="Infrastructure" namespace="Infrastructure.Controls" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../css/style.css" rel="stylesheet" />
    <style type="text/css">



.dxpcLite_Aqua .dxpc-header.dxpc-withBtn,
.dxdpLite_Aqua .dxpc-header.dxpc-withBtn 
{
	padding-bottom: 4px;
}

.dxpcLite_Aqua .dxpc-header,
.dxdpLite_Aqua .dxpc-header 
{
	color: #283B56;
	background: #E2F0FF;
	border-bottom: 1px solid #A3C0E8;
	padding: 5px 2px 7px 12px;
}

p {
	font-size: 12px;
	line-height: 20px;
    text-align: left;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="专业："></asp:Label>
            <asp:DropDownList ID="dplMajor" runat="server" Width="120px" DataSourceID="sdsMajor" DataTextField="Major" DataValueField="Major" >
                <asp:ListItem Value="%">...请选择...</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="班级："></asp:Label>
            <asp:DropDownList ID="dplClass" runat="server" Style="margin-bottom: 0px" Width="120px" DataSourceID="sdsClass" DataTextField="Class" DataValueField="Class">
                <asp:listitem Value="%">...请选择...</asp:listitem>
            </asp:DropDownList>
            &nbsp;&nbsp&nbsp;&nbsp;

            <asp:Label ID="Label1" runat="server" Text="学号:"></asp:Label>&nbsp;
            <asp:TextBox ID="txtSno" runat="server">%</asp:TextBox>
            &nbsp;&nbsp;以%做匹配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnSearch" runat="server">检索</asp:LinkButton>
            &nbsp;<br />
            <br />
            <cc1:MyGridView ID="gvData" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="dataTable" DataKeyNames="Sno" DataSourceID="sdsStudentInfo" OnRowCommand="gvData_RowCommand">
<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>

                <Columns>
                    <asp:BoundField DataField="Sno" HeaderText="学号" ReadOnly="True" SortExpression="Sno" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                    <asp:BoundField DataField="Major" HeaderText="专业" SortExpression="Major" />
                    <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                  <asp:TemplateField HeaderText="设置班级管理员" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="AuditBtn" CausesValidation="false" runat="server" CommandName="Pass" Text="设置班级管理员"  CommandArgument='<%# Eval("UserId") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="取消班级管理员" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="BackBtn" CausesValidation="false" runat="server" CommandName="Back" Text="取消班级管理员"  CommandArgument='<%# Eval("UserId") %>'></asp:LinkButton>
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
            <asp:SqlDataSource ID="sdsStudentInfo" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT Sno, UserId, Major, Class, Name FROM Student WHERE (Major LIKE @Major) AND (Class LIKE @Class) AND (Sno LIKE @Sno) AND (College LIKE @College)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dplMajor" DefaultValue="%" Name="Major" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dplClass" DefaultValue="%" Name="Class" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtSno" DefaultValue="" Name="Sno" PropertyName="Text" />
                    <asp:SessionParameter Name="College" SessionField="BranchName" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="sdsClass" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Class FROM Student WHERE (Major LIKE @Major) AND (College = @College)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dplMajor" DefaultValue="%" Name="Major" PropertyName="SelectedValue" />
                    <asp:SessionParameter DefaultValue="" Name="College" SessionField="BranchName" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsMajor" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT DISTINCT Major FROM Student WHERE (College Like @College)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="College" SessionField="BranchName" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <uc1:MessageBoxControl ID="MsgBox" runat="server" />
    </form>
</body>
</html>
