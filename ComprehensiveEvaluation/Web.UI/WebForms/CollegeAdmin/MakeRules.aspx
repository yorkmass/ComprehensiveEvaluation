<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MakeRules.aspx.cs" Inherits="WebForms_CollegeAdmin_MakeRules" %>

<%@ Register assembly="DevExpress.Web.ASPxTreeList.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="RuleID" Theme="Aqua" ParentFieldName="ParentRuleID">
            <Columns>
                <dx:TreeListTextColumn FieldName="RuleName" Caption="规则名称" VisibleIndex="0">
                </dx:TreeListTextColumn>
                <dx:TreeListTextColumn FieldName="Description" Caption="描述" VisibleIndex="1">
                </dx:TreeListTextColumn>
                <dx:TreeListTextColumn FieldName="Score" Caption="分数" VisibleIndex="2">
                </dx:TreeListTextColumn>
                <dx:TreeListCommandColumn VisibleIndex="3">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                </dx:TreeListCommandColumn>
            </Columns>
            <SettingsBehavior AllowFocusedNode="True" />
        </dx:ASPxTreeList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>" SelectCommand="SELECT [RuleID], [ParentRuleID], [RuleName], [Description], [Score] FROM [Rules]"></asp:SqlDataSource>
    </form>
</body>
</html>
