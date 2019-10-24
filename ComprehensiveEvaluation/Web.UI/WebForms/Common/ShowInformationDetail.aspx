<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowInformationDetail.aspx.cs" Inherits="WebForms_Common_ShowInformationDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/style.css" rel="stylesheet" />
    <style type="text/css">
        p
        {
            font-size: 12px;
            font-family: 宋体, Arial, Helvetica, sans-serif;
            text-indent: 0px;
            line-height: 20px;
            margin: 7px 4px 7px 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="title">
            <tr>
                <td align="right">
                    <a href="javascript:void(0)" onclick="window.history.go(-1)">返回</a>
                </td>
            </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="6" class="box">
            <tr>
                <td>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="InformationID" DataSourceID="sdsShowDetail"
                        Style="margin:auto; width:100%;" >
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <h2 style="text-align: center; color: Blue;">
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /></h2>
                            <p style="text-align: center">
                                来源：<asp:Label ID="AuthorLabel" runat="server" Text='<%# Bind("Author") %>' />
                                &nbsp;&nbsp;&nbsp;&nbsp;发表时间：<asp:Label ID="CreateTimeLabel" runat="server" Text='<%# Bind("SubmitDate","{0:yyyy-MM-dd}") %>' />
                            </p>
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Bind("Content") %>'></asp:Literal>
                            <p>
                            </p>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="sdsShowDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>"
                        SelectCommand="SELECT Title, Author, [Content], InformationID, SubmitDate FROM Information WHERE (InformationID = @InformationID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="InformationID" QueryStringField="InformationID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
