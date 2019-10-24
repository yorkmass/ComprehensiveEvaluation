<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="WebForms_Common_ChangePassword" %>
<%@ Register Src="../../script/MessageBoxControl.ascx" TagName="MessageBoxControl" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
.location{
    margin-left:140px;
    margin-top:20px;
}
.left{
    float:left;
    margin-left:20px;
    margin-top:25px;
}
.right{
    float:left;
    margin-left:20px;
    margin-top:25px;

}
.click{
    margin-left:90px;
    margin-top:20px;
}
    </style>
     
 <link href="../../css/style.css" rel="stylesheet" /> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="location">
            <h2><asp:Label ID="Label1" runat="server"  Text="修改密码"></asp:Label></h2>
        </div>
        <div>
            <div class="left">
        <p><asp:Label ID="Label2" runat="server" Text="原密码："></asp:Label></p>
        <asp:Label ID="Label3" runat="server" Text="新密码："></asp:Label>      
        <p><asp:Label ID="Label4" runat="server" Text="确认新密码："></asp:Label></p>    
            </div>
            <div class="right">
        <p><asp:TextBox ID="TextBox1"  type="password" placeholder="请输入密码" runat="server" MaxLength="15"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                </p>
         <asp:TextBox ID="TextBox2"  type="password" placeholder="请输入新密码" runat="server" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
        <p><asp:TextBox ID="TextBox3"  type="password" placeholder="请确认新密码" runat="server" MaxLength="15"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
            <span style="color:Red;"><asp:Literal ID="checkNew" runat="server"  EnableViewState="False"></asp:Literal></span>
                </p>
                
            <div class="click">
                <asp:Button ID="Button1" runat="server" OnClick="ChangeButton_click" Text="确认修改" BorderStyle="Groove" />
                </div>
            </div>
        </div>
       
      <uc1:MessageBoxControl ID="MsgBox" runat="server" />      
       
    </form>
</body>
</html>
