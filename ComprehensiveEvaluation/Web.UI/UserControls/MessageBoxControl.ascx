<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MessageBoxControl.ascx.cs" Inherits="UserControls_MessageBoxControl" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<dx:ASPxPopupControl ID="MessageBoxPopupControl" runat="server" AllowDragging="true" CloseAction="CloseButton" Theme="Aqua" HeaderText="消息" Height="98px" Left="30"
  Modal="True" Top="50" Width="330px">
    <ContentStyle>        
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
            <table style="width: 100%">
                <tr>
                    <td style="width: 41px; vertical-align: top;">
                        <asp:Image ID="imgMessageBoxIcon" runat="server" ImageAlign="Middle" ImageUrl="~/images/exclamation_icon.png"
              Width="40px" />
                    </td>
                    <td style="padding-left:25px; vertical-align: top;">
                        <asp:Label ID="lblMessageBoxMsg" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
    <CloseButtonImage Height="16px" Width="17px" />
</dx:ASPxPopupControl>
