
        <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
            <dx:ASPxPopupControl ID="LoginPopup" runat="server" AllowDragging="True"
      Theme="Aqua" HeaderText="系统登录" Height="150px" PopupHorizontalAlign="WindowCenter"
      PopupVerticalAlign="WindowCenter" ShowCloseButton="False" ShowOnPageLoad="True"
      Width="360px" CloseAction="None" PopupAction="None" AutoUpdatePosition="True"
      ClientIDMode="AutoID">
                <ContentStyle VerticalAlign="Top">
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                  <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx">
                    <LayoutTemplate>
                      <table style="width: 100%;">
                        <tbody>
                          <tr>
                            <td colspan="2" style="height: 15px;"></td>
                          </tr>
                          <tr>
                            <td style="width: 65px; height: 30px;" class="align-right">
                              <strong>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名：</asp:Label></strong>
                            </td>
                            <td style="width: 238px; height: 30px;">
                              <dx:ASPxTextBox ID="UserName" runat="server" Width="219px" AutoCompleteType="Disabled" BackColor="Transparent" CssClass="txtInline" NullText="工号/学号" Height="24px"></dx:ASPxTextBox>
                              <asp:RequiredFieldValidator
                                ID="UserNameRequired" runat="server" ControlToValidate="UserName" Display="Dynamic"
                                ErrorMessage="用户名必须填写" ToolTip="用户名必须填写" ValidationGroup="Login1" CssClass="red"> *</asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td style="width: 65px; height: 30px;" class="align-right">
                              <strong>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码：</asp:Label></strong>
                            </td>
                            <td style="height: 30px; width: 238px;">
                              <dx:ASPxTextBox ID="Password" Password="true" runat="server" Width="219px" AutoCompleteType="Disabled" BackColor="Transparent" CssClass="txtInline" Height="24px"></dx:ASPxTextBox>
                              <asp:RequiredFieldValidator
                                ID="PasswordRequired" runat="server" ControlToValidate="Password" Display="Dynamic"
                                ErrorMessage="密码必须填写" ToolTip="密码必须填写" ValidationGroup="Login1" CssClass="red"> *</asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td style="width: 65px; height: 25px;" class="align-right"></td>
                            <td style="height: 25px; width: 176px;">
                              <asp:CheckBox ID="RememberMe" runat="server" Text="下次记住我" />
                            </td>
                          </tr>
                          <tr>
                            <td style="height: 25px"></td>
                            <td style="height: 25px; width: 238px; color: Red;">
                              <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                          </tr>
                          <tr>
                            <td></td>
                            <td style="width: 238px;" class="align-right">
                              <%--<asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="登录" ValidationGroup="Login1"
                                Style="width: 63px; height: 26px; display: none;" />--%>

                              <dx:ASPxButton ID="MyLoginButton" runat="server" Text="登录" ValidationGroup="Login1" Width="63" Height="26"
                                Style="margin: 5px 12px 8px auto;" OnClick="MyLoginButton_Click">
                              </dx:ASPxButton>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </LayoutTemplate>
                  </asp:Login>
                </dx:PopupControlContentControl>
            </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </form>
</body>
</html>
