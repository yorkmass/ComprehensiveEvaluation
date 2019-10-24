<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentMng.aspx.cs" Inherits="WebForms_CollegeAdmin_StudentMng" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxMenu ID="mnuMain" runat="server" BackColor="White" EnableTheming="true" ShowAsToolbar="true" Theme="Default">
                <ClientSideEvents ItemClick="functionfunction(s, e) {
    var itemName = e.item.name;
	switch(itemName){
		case 'Import':
			popupUpload.Show(); 
			e.processOnServer = false;
			break;
		case 'BatchMng':
			popupBatchMng.Show();
			e.processOnServer = false;
			break;
	}" />
                <Paddings PaddingBottom="5px" PaddingTop="8px" />
                <Items>
                    <dx:MenuItem BeginGroup="true" Text="下载模版" Name="DownloadTemplate" NavigateUrl="~/Downloads/学生信息导入模版.xls">
                        <Image Url="~/images/export.png">
                        </Image>
                        </dx:MenuItem>
                    <dx:MenuItem Name="Import" Text="导入">
                        <Image Url="~/images/import.png">
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
    </form>
</body>
</html>
