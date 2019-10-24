<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInformation.aspx.cs" Inherits="WebForms_Admin_EditInformation" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        html {
            padding: 0px;
            margin: 0px;
        }

        body {
            font-size: 12px;
            font-family: 宋体, Arial, Helvetica, sans-serif;
            padding: 0px;
        }

        h2 {
            font-size: 16px;
            font-weight: 700;
            color: Navy;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        p {
            font-size: 12px;
            line-height: 20px;
        }

        a, a:visited {
            color: #07519A;
            text-decoration: none;
        }

            a:hover, a:focus, a:active {
                color: #f37028;
                text-decoration: underline;
            }
    </style>
    <script type="text/javascript">
        function CloseParentPopup() {
            var p = window.parent;
            var popup = p.window["popupEdit"];
            popup.Hide();
        }

        function RefreshParentData() {
            var p = window.parent;
            var popup = p.window["popupEdit"];
            popup.Hide();
            p.ForceRefresh();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>
                <asp:Label ID="lblTitle" runat="server" Text="编辑新闻通知"></asp:Label></h2>
            <asp:FormView ID="fvInformation" runat="server" DataKeyNames="InformationID" DataSourceID="sdsInformationDetail"
                DefaultMode="Edit" OnItemCreated="fvInformation_ItemCreated">
                <EditItemTemplate>
                    <p>
                        新闻标题：<br />
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="600px" />
                    </p>
                    <p>
                        通知对象：<asp:CheckBox ID="ForTeacherCheckBox" runat="server" Checked='<%# Bind("ForTeacher") %>' Text="教师" />
                        &nbsp;
                        <asp:CheckBox ID="ForStudentCheckBox" runat="server" Checked='<%# Bind("ForStudent") %>' Text="学生" />
                        &nbsp;
                    </p>
                    <p>
                        内容：
                    <br />
                        <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" EnableTheming="True" Html='<%# Bind("Content") %>' Theme="Aqua" RightToLeft="False">
                            <StylesToolbars>
                                <ToolbarItem Wrap="False">
                                </ToolbarItem>
                            </StylesToolbars>
                            <SettingsImageUpload UploadImageFolder="~/ImageAdmin">
                            </SettingsImageUpload>
                            <SettingsForms InsertImageFormPath="~/DevExpress/ASPxHtmlEditorForms/InsertImageForm.ascx" InsertLinkFormPath="~/DevExpress/ASPxHtmlEditorForms/InsertLinkForm.ascx" InsertTableFormPath="~/DevExpress/ASPxHtmlEditorForms/InsertTableForm.ascx" PasteFromWordFormPath="~/DevExpress/ASPxHtmlEditorForms/PasteFromWordForm.ascx" TableColumnPropertiesFormPath="~/DevExpress/ASPxHtmlEditorForms/TableColumnPropertiesForm.ascx">
                                <SpellCheckerForms SpellCheckFormPath="~/DevExpress/ASPxSpellCheckerForms/SpellCheckForm.ascx" SpellCheckOptionsFormPath="~/DevExpress/ASPxSpellCheckerForms/SpellCheckOptionsForm.ascx" />
                            </SettingsForms>
                        </dx:ASPxHtmlEditor>
                    </p>
                    <br />
                    <br />
                    <div style="display: none;">
                        <asp:LinkButton ID="btnSave" runat="server" CausesValidation="True" Text="更新" OnClick="UpdateButton_Click" />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="btnCancel_Click" Text="取消" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <p>
                        新闻标题：<br />
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="600px" />
                    </p>
                    <p>
                        通知对象：<asp:CheckBox ID="ForTeacherCheckBox" runat="server" Checked='<%# Bind("ForTeacher") %>' Text="教师" />
                        &nbsp;
                        <asp:CheckBox ID="ForStudentCheckBox" runat="server" Checked='<%# Bind("ForStudent") %>' Text="学生" />
                        &nbsp;
                    </p>
                    <p>
                        内容：
                    <br />
                        <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" EnableTheming="True" Html='<%# Bind("Content") %>' Theme="Aqua" RightToLeft="False">
                            <StylesToolbars>
                                <ToolbarItem Wrap="False">
                                </ToolbarItem>
                            </StylesToolbars>
                            <SettingsImageUpload UploadImageFolder="~/ImageAdmin">
                            </SettingsImageUpload>
                            <SettingsForms InsertImageFormPath="~/DevExpress/ASPxHtmlEditorForms/InsertImageForm.ascx" InsertLinkFormPath="~/DevExpress/ASPxHtmlEditorForms/InsertLinkForm.ascx" InsertTableFormPath="~/DevExpress/ASPxHtmlEditorForms/InsertTableForm.ascx" PasteFromWordFormPath="~/DevExpress/ASPxHtmlEditorForms/PasteFromWordForm.ascx" TableColumnPropertiesFormPath="~/DevExpress/ASPxHtmlEditorForms/TableColumnPropertiesForm.ascx">
                                <SpellCheckerForms SpellCheckFormPath="~/DevExpress/ASPxSpellCheckerForms/SpellCheckForm.ascx" SpellCheckOptionsFormPath="~/DevExpress/ASPxSpellCheckerForms/SpellCheckOptionsForm.ascx" />
                            </SettingsForms>
                        </dx:ASPxHtmlEditor>
                    </p>
                    <br />
                    <br />
                    <div style="display: none;">
                        <asp:LinkButton ID="btnSave" runat="server" CausesValidation="True" Text="插入" OnClick="InsertButton_Click" />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="btnCancel_Click" Text="取消" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:FormView>
            <p>
                <asp:TextBox ID="txtAuthor" runat="server" Style="display: none"></asp:TextBox>
            </p>
            <asp:SqlDataSource ID="sdsInformationDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ms4132928ConnectionString %>"
                DeleteCommand="DELETE FROM [Information] WHERE [InformationID] = @InformationID"
                InsertCommand="INSERT INTO Information(Title, [Content], Author, ForTeacher, ForStudent, SubmitDate) VALUES (@Title, @Content, @Author, @ForTeacher, @ForStudent, GETDATE())"
                SelectCommand="SELECT InformationID, Title, [Content], Author, SubmitDate, ForTeacher, ForStudent FROM Information WHERE (InformationID = @InformationID)"
                UpdateCommand="UPDATE Information SET Title = @Title, [Content] = @Content, Author = @Author, SubmitDate = GETDATE(), ForTeacher = @ForTeacher, ForStudent = @ForStudent WHERE (InformationID = @InformationID)" OnInserted="sdsInformationDetail_Inserted" OnUpdated="sdsInformationDetail_Updated">
                <SelectParameters>
                    <asp:QueryStringParameter Name="InformationID" QueryStringField="InformationID" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="InformationID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:ControlParameter ControlID="txtAuthor" Name="Author" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="ForTeacher" Type="Boolean" />
                    <asp:Parameter Name="ForStudent" Type="Boolean" />
                    <asp:QueryStringParameter Name="InformationID" QueryStringField="InformationID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:ControlParameter ControlID="txtAuthor" Name="Author" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="ForTeacher" Type="Boolean" DefaultValue="" />
                    <asp:Parameter Name="ForStudent" Type="Boolean" DefaultValue="" />
                </InsertParameters>
            </asp:SqlDataSource>
            <script type="text/javascript">
                function Save() {
                    __doPostBack('fvInformation$btnSave', '');
                }
                function Cancel() {
                    __doPostBack('fvInformation$btnCancel', '');
                }
            </script>
        </div>
    </form>
</body>
</html>
