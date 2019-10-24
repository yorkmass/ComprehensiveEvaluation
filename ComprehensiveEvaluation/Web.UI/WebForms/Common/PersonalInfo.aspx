<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonalInfo.aspx.cs" Inherits="WebForms_Common_PersonalInfo" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
 .location{
    margin-left:130px;
    margin-top:20px;
}
 .double{
            position:relative;
            width:auto;
            height:160px;
}
.left{
    float:left;
    margin-left:50px;
    margin-top:25px;
}
.right{
    float:left;
    margin-left:20px;
    margin-top:25px;

}
.textline{
    clear:both;
    position:relative;
    margin-left:20px;
}
.button{
    position:relative;
    margin-left:75px;
    margin-top:20px;
}
.buttonClear{
    margin-left:100px;
}
    </style>
<link href="../../css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="location">
            <h2><asp:Label ID="ChangeInfoTitle" runat="server" Font-Underline="False"  Text="个人信息修改" ></asp:Label></h2>
        </div>
        <div class="double">
            <div class="left">
                <p><asp:Label ID="UserNum" runat="server" Text="学号："></asp:Label></p>
                <asp:Label ID="UserName" runat="server" Text="姓名："></asp:Label>
                <p><asp:Label ID="Email" runat="server" Text="电子邮箱："></asp:Label></p>
                <asp:Label ID="Tel" runat="server" Text="联系电话："></asp:Label>
            </div>
            <div class="right">
                <p><asp:Label ID="UserNumValue" runat="server" Text="************"></asp:Label></p>
                <asp:Label ID="UserNameValue" runat="server" Text="***"></asp:Label>
                <p><asp:TextBox ID="EmailBox" type="email" placeholder="请输入正确的邮箱" runat="server"></asp:TextBox></p>
                <asp:TextBox ID="TelBox" onkeyup = "value=value.replace(/[^\d]/g,'')"  placeholder="请输入11位手机号" runat="server" MaxLength="11"></asp:TextBox>
            </div>
        </div>
        <div class="textline">
            <asp:Label ID="Line" runat="server" Text="______________________________________________" ForeColor="#3399FF"></asp:Label>
        </div>
        <div class="button">
        <asp:Button ID="Button1" runat="server" Text="确认修改" OnClick="ConfirmClick" BorderStyle="Groove" />
        <asp:Button ID="Button2" runat="server" CssClass="buttonClear"  width="78px" Text="清空" OnClick="ClearClick" BorderStyle="Groove" />
        </div>
        <uc1:MessageBoxControl ID="MsgBox" runat="server" />
    </form>
</body>
</html>
