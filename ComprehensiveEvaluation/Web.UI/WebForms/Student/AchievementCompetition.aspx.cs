using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Student_AchievementCompetition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChangeInfo changeinfo = new ChangeInfo();
        Session["Sno"] = changeinfo.GainSnoByUserID(Session["UserCode"].ToString());
       
    }

    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        StudentAchievements sa = new StudentAchievements();
        string semester = sa.GainThisSemester();
        Sport sport = new Sport();
        bool a = true;
        if (!sport.OpenSystem(semester))
        {
            a = false;
            popupChangeRule.ShowOnPageLoad = false;
            MsgBox.ShowMessage("未到系统开放时间");
        }
        if (a)
        {
            popupChangeRule.ShowOnPageLoad = true;
        }
    }

    protected void ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        StudentAchievements achievements = new StudentAchievements();
        Sport sport = new Sport();
        string achievementID = Guid.NewGuid().ToString();
        DateTime lastUpdateDate = DateTime.Now;
        DateTime obtainTime = Convert.ToDateTime(myHiddenField.Value);
        string sno = Session["Sno"].ToString();
        string achievementType = "文体竞赛";
        string ruleID = DropDownList1.SelectedItem.Value;
        double score = achievements.FindScoreByRuleID(ruleID);
        string semester = achievements.GainThisSemester();
        int year = obtainTime.Year;
        string comName = ComNameValue.Text;
        string comType = ComTypeValue.Text;
        string comWard = ComWardValue.Text;
        string title = comName+"-----"+achievements.GainRuleName(ruleID);
        string auditStatus = "草稿";
        if (comName == "" || comType == "" || comWard=="" ||ruleID=="")
        {
            MsgBox.ShowMessage("加分信息没有完善! 请重新填写");
        }

        else
        {
            if (HiddenField1.Value == "")
            {
                MsgBox.ShowMessage("请提交附件！");
            }
            else
            {
                string pathName = HiddenField1.Value;
                sport.AddAchievements(achievementID, sno, ruleID, score, semester, title, obtainTime, auditStatus, achievementType, comName, comType, comWard, lastUpdateDate, year, pathName);
                MyGridView1.DataBind();
                MsgBox.ShowMessage("当前草稿已保存，请提交审核");
                ComNameValue.Text = "";
                ComTypeValue.Text = "";
                ComWardValue.Text = "";
                HiddenField1.Value = "";
                TextTip.Text = "";
            }
            
        }

    }

    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string achievementID = e.CommandArgument.ToString();
        if (e.CommandName == "DeleteRecord")
        {
            Sport sport = new Sport();
            bool a = true;
            if (sport.GainAuditStatusByAchID(achievementID)=="初审通过")
            {
                a = false;
                MsgBox.ShowMessage("正在进行复审，取消复审请联系班级管理员...");
            }
            if (a)
            {
                sport.DelectAchievement(e.CommandArgument.ToString());
                MyGridView1.DataBind();
            }

        }
        if (e.CommandName == "AuditRecord")
        {           
            Sport sport = new Sport();
            bool a = true;
            if (sport.GainAuditStatusByAchID(achievementID) == "初审通过")
            {
                a = false;
                MsgBox.ShowMessage("正在进行复审，请勿重复提交...");
            }
            if (a)
            {
                StudentAchievements ach = new StudentAchievements();
                ach.UpdateAuditStatus("待审", achievementID);
                MyGridView1.DataBind();
                MsgBox.ShowMessage("审核中...");
            }

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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters["RuleID"].DefaultValue = DropDownList1.SelectedItem.Value;
        GridView1.DataBind();
    }





    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string fullFileName = fileUploader.PostedFile.FileName;
        //从路径中截取出文件名
        string fileName = fullFileName.Substring(fullFileName.LastIndexOf('\\') + 1);
        HiddenField1.Value = fileName;
        //限定上传文件的格式
        string type = fullFileName.Substring(fullFileName.LastIndexOf('.') + 1);
        if (type == "jpg" || type == "JPG" || type == "png" || type == "PNG")
        {
            //将文件保存在服务器中根目录下的files文件夹中
            string saveFileName = Server.MapPath("..\\..\\FilesUser") + "\\" + fileName;
            fileUploader.PostedFile.SaveAs(saveFileName);
            MsgBox.ShowMessage("上传成功");
            TextTip.Text = "已上传";
            //BLL.news.InsertAnnexBLL insertAnnex = new BLL.news.InsertAnnexBLL();
            //AnnexEntity annex = new AnnexEntity();     //创建附件的实体
            //annex.AnnexName = fileName;               //附件名
            //annex.AnnexContent = saveFileName;        //附件的存储路径
            //annex.NoticeId = noticeId;              //附件所属“通知”的ID在这里为已知
            //insertAnnex.InsertAnnex(annex);         //将实体存入数据库（其实就是讲实体的这些属性insert到数据库中的过程，具体BLL层和DAL层的代码这里不再多说）
        }
        else
        {
            MsgBox.ShowMessage("非jpg\\png格式文件！上传失败");
        }
    }
}