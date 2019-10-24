using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Student_AchievementMng : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChangeInfo changeinfo = new ChangeInfo();
        Session["Sno"] = changeinfo.GainSnoByUserID(Session["UserCode"].ToString());
      

    }
     protected void ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
            string SelectRuleID = myHiddenField.Value;
            StudentAchievements achievements = new StudentAchievements();
            double score = achievements.FindScoreByRuleID(SelectRuleID);
            string userID = Session["UserCode"].ToString();
            string sno = Session["Sno"].ToString();
            string achievementID = Guid.NewGuid().ToString();
            string semester = achievements.GainThisSemester();
            string achievementType = "社会工作";
            DateTime obtainDate = DateTime.Now;
            string auditStatus = "草稿";
            string organization = Organization.Text;
            string positionType = PositionType.Text;
            string ruleName = organization+positionType+"-----"+achievements.GainRuleName(SelectRuleID);
            if(organization==""|| positionType == "")
            {
                MsgBox.ShowMessage("所属组织或职位输入不能为空! 请重新填写");
             }
            
            else
            {
             if (HiddenField1.Value == "")
             {
                   MsgBox.ShowMessage("请上传附件！");
             }
            else
            {
                string pathName = HiddenField1.Value;
                achievements.AddAchievement(sno, achievementID, semester, obtainDate, auditStatus, achievementType, SelectRuleID, ruleName, score, organization, positionType, pathName);
                MyGridView1.DataBind();
                MsgBox.ShowMessage("当前草稿已保存，请提交审核");
                Organization.Text = "";
                PositionType.Text = "";
                HiddenField1.Value = "";
                TextTip.Text = "";
            }
        }
            



    }
    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            string achievementID = e.CommandArgument.ToString();
            Sport sport = new Sport();
            bool a = true;
            if (sport.GainAuditStatusByAchID(achievementID) == "初审通过")
            {
                a = false;
                MsgBox.ShowMessage("正在进行复审，取消复审请联系班级管理员...");
            }
            if (a)
            {
                StudentAchievements achs = new StudentAchievements();
                achs.DelectAchievement(achievementID);
                MyGridView1.DataBind();
            }
        }
        if (e.CommandName == "AuditRecord")
        {
            Sport sport = new Sport();
            string achievementID = e.CommandArgument.ToString();
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




    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        string sno = Session["Sno"].ToString();
        StudentAchievements sa = new StudentAchievements();
        string semester = sa.GainThisSemester();
        bool a = true;
        if (sa.NowAuditStatus(sno,semester))
        {
            a = false;
            popupChangeRule.ShowOnPageLoad = false;
            MsgBox.ShowMessage("已审核完毕或请等待复审或未到系统开放时间");           
        }
        if (a)
        {
            popupChangeRule.ShowOnPageLoad = true;
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string fullFileName = fileUploader.PostedFile.FileName;
        //从路径中截取出文件名
        string fileName = fullFileName.Substring(fullFileName.LastIndexOf('\\') + 1);
        HiddenField1.Value = fileName;
        //限定上传文件的格式
        string type = fullFileName.Substring(fullFileName.LastIndexOf('.') + 1);
        if (type == "jpg"||type=="JPG"||type=="png"||type=="PNG")
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