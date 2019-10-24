using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_ClassAdmin_AchievementToAudit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChangeInfo changeinfo = new ChangeInfo();
        ClassAudit ca = new ClassAudit();
        StudentAchievements sa = new StudentAchievements();
        string semester = sa.GainThisSemester();
        Session["Sno"] = changeinfo.GainSnoByUserID(Session["UserCode"].ToString());
        string className = ca.GainClassBySno(Session["Sno"].ToString());
        ObjectDataSource1.SelectParameters["Class"].DefaultValue = className;
        ObjectDataSource1.SelectParameters["Semester"].DefaultValue = semester;
        ObjectDataSource2.SelectParameters["Class"].DefaultValue = className;
        ObjectDataSource2.SelectParameters["Semester"].DefaultValue = semester;
        Nums.Text=ca.RejectCount(className, semester).ToString();
    }

    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string achievementID = e.CommandArgument.ToString();
        Sport sport = new Sport();
        ClassAudit ca = new ClassAudit();
        StudentAchievements sa = new StudentAchievements();
        string semester = sa.GainThisSemester();
        string className = ca.GainClassBySno(Session["Sno"].ToString());        
        if (e.CommandName == "Reject")
        {
            string name = ca.GainNameByAch(achievementID);
            sa.UpdateAuditStatus("驳回", achievementID);
            MyGridView1.DataBind();
            MyGridView2.DataBind();
            Nums.Text = ca.RejectCount(className, semester).ToString();
            MsgBox.ShowMessage("已驳回"+name+"的申请...<br/>"+name+ "又双叒叕做错了什么嘤嘤嘤！");
        }
        if (e.CommandName == "Pass")
        {
            string name = ca.GainNameByAch(achievementID);
            sa.UpdateAuditStatus("初审通过", achievementID);
            MyGridView1.DataBind();
            MsgBox.ShowMessage("校对无误！<br/>"+name+"正在等待复审通过...");
        }
        if (e.CommandName == "Back")
        {
            sa.UpdateAuditStatus("待审", achievementID);
            MyGridView1.DataBind();
            MyGridView2.DataBind();
            Nums.Text = ca.RejectCount(className, semester).ToString();
            MsgBox.ShowMessage("已恢复为待审，请认真核对哦！...");
        }
        if (e.CommandName == "Look")
        {
            StudentAchievements ach = new StudentAchievements();
            string pathName = ach.FilesName(achievementID);
            Image1.ImageUrl = "../../FilesUser/"+pathName;
            popupChangeRuleImg.ShowOnPageLoad = true;
        }

        if (e.CommandName == "Down")
        {
            try
            {
                StudentAchievements ach = new StudentAchievements();
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

    protected void MyGridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string achievementID = e.CommandArgument.ToString();
        StudentAchievements sa = new StudentAchievements();
        ClassAudit ca = new ClassAudit();       
        string semester = sa.GainThisSemester();
        string className = ca.GainClassBySno(Session["Sno"].ToString());
        if (e.CommandName == "Back")
        {
            string name = ca.GainNameByAch(achievementID);
            sa.UpdateAuditStatus("待审", achievementID);
            MyGridView1.DataBind();
            MyGridView2.DataBind();
            Nums.Text = ca.RejectCount(className, semester).ToString();
            MsgBox.ShowMessage(name+"感谢小主不“杀”之恩！");
        }

    }
}