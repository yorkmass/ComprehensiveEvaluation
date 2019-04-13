<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Css/style.css" rel="stylesheet" />
    <style type="text/css">
        body {
            margin: 0;
        }

        img {
            border-bottom: medium none;
            border-left: medium none;
            vertical-align: middle;
            border-top: medium none;
            border-right: medium none;
        }

        .wrapper {
            background: url(images/wrapper.png) #FFF repeat-x left top;
        }

        .header {
            height: 72px;
            color: #666;
        }

        .inner-header {
            width: 95%;
            margin: 0 auto;
        }

        .header a {
            color: #666;
        }

        .header .logo {
            background-image: url('images/logo.png');
            width: 570px;
            background-repeat: no-repeat;
            background-position: center center;
            float: left;
            height: 52px;
            cursor: pointer;
            margin: 6px 0;
        }

        .website-links {
            float: right;
            font-size: 115%;
            position: relative;
            margin: 18px 0;
        }

            .website-links div {
                display: inline;
                float: left;
                margin-left: 5px;
                margin-right: 5px;
                margin-top: 5px;
            }

            .website-links a {
                display: inline;
                float: left;
                margin-left: 5px;
                margin-right: 5px;
                cursor: pointer;
            }

                .website-links a span {
                    float: left;
                    height: 18px;
                    overflow: hidden;
                    padding: 5px 10px;
                }

                .website-links a.current, .website-links a:hover {
                    background: url(images/website-link-bg-left.png) no-repeat left top;
                    color: #FFF;
                    text-decoration: none;
                }

                    .website-links a.current span, .website-links a:hover span {
                        background: url(images/website-link-bg-right.png) no-repeat right top;
                    }

        .menuTree {
            margin: 0px 10px 0px 10px;
            padding: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxSplitter ID="MainSplitter" runat="server" Height="100%" Width="100%" FullscreenMode="True" Orientation="Vertical">
                <Styles>
                <Pane>
                    <Paddings Padding="0px" />
                    <Border BorderWidth="0px" />
                </Pane>
                 </Styles>
                <panes>
                     <dx:SplitterPane Name="HeaderPane" Size="72px">
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            <div class="wrapper">
                                <div class="header">
                                    <div class="inner-header">
                                        <div id="logo" class="logo">
                                        </div>
                                        <div class="website-links">
                                            <div>
                                                当前登录帐户：<asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click"><span>注销</span></asp:LinkButton>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                    <dx:SplitterPane Name="MainPane" Separator-Visible="False">
                    <Separator Visible="False"></Separator>
                    <PaneStyle CssClass="noborder"></PaneStyle>
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            <dx:ASPxSplitter ID="SpliterMenuContent" runat="server" Height="100%" EnableTheming="False" PaneMinSize="0px" ShowSeparatorImage="False">
                                <Styles>
                                    <Pane>
                                        <Paddings Padding="0px" />
                                        <Border BorderStyle="None" />
                                    </Pane>
                                    <Separator BackColor="#EEEEEE">
                                        <HoverStyle BackColor="#FFCC00">
                                        </HoverStyle>
                                    </Separator>
                                    <SeparatorButton>
                                        <HoverStyle BackColor="#FFCC00">
                                        </HoverStyle>
                                    </SeparatorButton>
                                </Styles>
                                <Panes>
                                    <dx:SplitterPane Name="LeftPane" ShowCollapseBackwardButton="True" Size="280px" ScrollBars="Auto">
                                        <PaneStyle>
                                            <BorderRight BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                                        </PaneStyle>
                                        <ContentCollection>
                                            <dx:SplitterContentControl>
                                                <div class="menuTree">
                                                    <asp:TreeView ID="siteMapTree" runat="server" DataSourceID="smDS" ShowLines="True"
                                                        OnTreeNodeDataBound="siteMapTree_TreeNodeDataBound"  ExpandDepth="3" PopulateNodesFromClient="False" OnSelectedNodeChanged="siteMapTree_SelectedNodeChanged">
                                                        <RootNodeStyle ImageUrl="~/images/node-root.gif" />
                                                        <NodeStyle ImageUrl="~/images/node-normal.gif" HorizontalPadding="2px" />
                                                        <LeafNodeStyle ImageUrl="~/images/node-leaf.gif" />
                                                    </asp:TreeView>
                                                    <asp:SiteMapDataSource ID="smDS" runat="server" />
                                                </div>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                    <dx:SplitterPane Name="ContentPane" ContentUrlIFrameName="fContent" ScrollBars="Auto" ContentUrl="~/Content.aspx">
                                        <Separator>
                                            <SeparatorStyle></SeparatorStyle>
                                        </Separator>
                                        <PaneStyle>
                                            <BorderLeft BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                                        </PaneStyle>
                                        <ContentCollection>
                                            <dx:SplitterContentControl>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                </Panes>
                            </dx:ASPxSplitter>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                </panes>
            </dx:ASPxSplitter>
          
        </div>
    </form>
</body>
</html>
