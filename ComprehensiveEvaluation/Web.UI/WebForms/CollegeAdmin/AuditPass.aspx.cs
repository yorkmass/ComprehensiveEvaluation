using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_CollegeAdmin_AuditPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CollegeAudit ca = new CollegeAudit();
        Session["College"] = ca.GainBranchByID(Session["UserCode"].ToString());
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DClassName.Visible = true;
        DropDownList1.Visible = false;
        ObjectDataSource2.SelectParameters["major"].DefaultValue = DMarjor.SelectedItem.Value;
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DClassName.Visible = true;
        ObjectDataSource3.SelectParameters["ClassName"].DefaultValue = DClassName.SelectedItem.Value;
        
    }

    protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ObjectDataSource3.SelectParameters["semester"].DefaultValue = DropDownList2.SelectedItem.Value;
        MyGridView1.DataBind();
    }

    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Look")
        {
            string achievementID = e.CommandArgument.ToString();
            StudentAchievements ach = new StudentAchievements();
            string pathName = ach.FilesName(achievementID);
            Image1.ImageUrl = "../../FilesUser/" + pathName;
            popupChangeRuleImg.ShowOnPageLoad = true;
        }
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
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DClassName.Visible = true;
        DropDownList1.Visible = false;
        ObjectDataSource2.SelectParameters["major"].DefaultValue = DMarjor.SelectedItem.Value;
    }
}