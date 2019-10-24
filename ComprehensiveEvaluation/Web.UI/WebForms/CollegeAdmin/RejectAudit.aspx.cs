﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_CollegeAdmin_RejectAudit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StudentAchievements sa = new StudentAchievements();
        Session["Semester"] = sa.GainThisSemester();
    }

    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Down")
        {
            try
            {
                StudentAchievements ach = new StudentAchievements();
                string achievementID = e.CommandArgument.ToString();
                string strFilePath = "../../FilesUser/" + ach.FilesName(achievementID);//服务器文件路径
                FileInfo fileInfo = new FileInfo(strFilePath);
                Response.Clear();
                Response.Charset = "GB2312";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.AddHeader("Content-Disposition", "attachment;filename=" + Server.UrlEncode(fileInfo.Name));
                Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                Response.ContentType = "application/x-bittorrent";
                Response.WriteFile(fileInfo.FullName);
                Response.End();
            }
            catch (System.Threading.ThreadAbortException ex)
            {
                MsgBox.ShowMessage("抛出一个异常...");
            }
            catch (Exception ex)
            {
                MsgBox.ShowMessage("下载出错...");
            }
        }
        if (e.CommandName == "Look")
        {
            string achievementID = e.CommandArgument.ToString();
            StudentAchievements ach = new StudentAchievements();
            string pathName = ach.FilesName(achievementID);
            Image1.ImageUrl = "../../FilesUser/" + pathName;
            popupChangeRuleImg.ShowOnPageLoad = true;
        }
    }
}