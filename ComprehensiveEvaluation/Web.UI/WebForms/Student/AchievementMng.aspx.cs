using System;
using System.Collections.Generic;
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
            string ruleName = achievements.GainRuleName(SelectRuleID);
            DateTime obtainDate = DateTime.Now;
            string auditStatus = "草稿";
            string organization = Organization.Text;
            string positionType = PositionType.Text;
            if(organization==""|| positionType == "")
            {
                MsgBox.ShowMessage("所属组织或职位输入不能为空! 请重新填写");
             }
             else
             {
                achievements.AddAchievement(sno, achievementID, semester, obtainDate, auditStatus, achievementType, SelectRuleID, ruleName, score, organization, positionType);
                MyGridView1.DataBind();
                MsgBox.ShowMessage("当前草稿已保存，请提交审核");
                Organization.Text = "";
                PositionType.Text = "";
        }
            



    }
    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            StudentAchievements achs = new StudentAchievements();
            achs.DelectAchievement(e.CommandArgument.ToString());
            MyGridView1.DataBind();
        }
        if (e.CommandName == "AuditRecord")
        {
            StudentAchievements ach = new StudentAchievements();
            ach.UpdateAuditStatus("待审", e.CommandArgument.ToString());
            MyGridView1.DataBind();
            MsgBox.ShowMessage("审核中...");
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
            MsgBox.ShowMessage("已审核完毕或未到系统开放时间");           
        }
        if (a)
        {
            popupChangeRule.ShowOnPageLoad = true;
        }

    }



} 