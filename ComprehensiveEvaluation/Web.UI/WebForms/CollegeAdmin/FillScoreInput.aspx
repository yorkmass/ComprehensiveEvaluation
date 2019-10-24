<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FillScoreInput.aspx.cs" Inherits="WebForms_CollegeAdmin_FillScoreInput" %>
<%@ Register src="../../UserControls/MessageBoxControl.ascx" tagname="MessageBoxControl" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style type="text/css">

        .buju{
            margin-left:40px;
            margin-top:40px;
           
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="buju">
            给导入成果置入分值：<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">置入</asp:LinkButton>
        </div>
        <uc1:MessageBoxControl ID="MessageBox" runat="server" />
    </form>
</body>
</html>
