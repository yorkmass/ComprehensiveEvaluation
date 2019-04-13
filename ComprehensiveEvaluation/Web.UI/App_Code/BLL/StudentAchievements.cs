using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// StudentAchievements 的摘要说明:学生操作
/// </summary>
public class StudentAchievements
{
    public StudentAchievements()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    /// <summary>
    /// 根据RuleID查询规则分值
    /// </summary>
    /// <param name="ruleID"></param>
    /// <returns></returns>
    public double FindScoreByRuleID(string ruleID)
    {
        DSStudentAchievementsTableAdapters.RulesTableAdapter helper = new DSStudentAchievementsTableAdapters.RulesTableAdapter();
        DSStudentAchievements.RulesDataTable table = new DSStudentAchievements.RulesDataTable();
        helper.Fill(table, ruleID);
        double score;
        score =Convert.ToDouble(table.Rows[0]["Score"].ToString());
        return score;
    }
    ///向成果表里面添加数据
    public void AddInfoToAchievement(string sno, string achievementID, string semester, DateTime obtainDate, string auditStatus, string achievementType, string ruleID, string title)
    {
        DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter helper = new DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter();
        DSStudentAchievements.StudentAchievementDataTable table = new DSStudentAchievements.StudentAchievementDataTable();
        helper.Fill(table, sno);
        bool a = true;
        for (int i = 0; i < table.Count; i++)
        {
            if (table.Rows[i]["Semester"].ToString() == semester && GainParentRuleID(ruleID)=="F4")
            {
                a = false;
                string achievement = table.Rows[i]["AchievementID"].ToString();
                helper.UpdateAchievement(semester, obtainDate, auditStatus, achievementType,title, achievement);
            }            

        }
        if (a)
        {
            helper.InsertAchievement(achievementID, semester, obtainDate, auditStatus, achievementType, title);
        }
       

    }
    ///向发展性素质表里面添加数据
    public void AddInfoToStudentAchievement(string sno,string ruleID,double mark,string semester, string achievementID)
    {
        DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter helper = new DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter();
        DSStudentAchievements.StudentAchievementDataTable table = new DSStudentAchievements.StudentAchievementDataTable();
        helper.Fill(table, sno);
        bool a = true;
        for(int i = 0; i < table.Count; i++)
        {
            if (table.Rows[i]["Semester"].ToString() == semester && GainParentRuleID(ruleID)=="F4")
            {
                a = false;
                string achievement = table.Rows[i]["AchievementID"].ToString();
                helper.UpdateStudentAchievements(sno, ruleID, mark, semester, achievement);
            }
               
        }
        if (a)
        {
            helper.InsertStudentAchievements(sno, ruleID, mark, semester, achievementID);
        }
       

    }
    ///向社会工作中添加数据
    public void AddSocialWork(string achievementID,string organization,string poitionTtype,string sno)
    {
        DSStudentAchievementsTableAdapters.SocialWorkProjectTableAdapter helper = new DSStudentAchievementsTableAdapters.SocialWorkProjectTableAdapter();
        DSStudentAchievements.SocialWorkProjectDataTable table = new DSStudentAchievements.SocialWorkProjectDataTable();
        DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter helper1 = new DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter();
        DSStudentAchievements.StudentAchievementDataTable table1 = new DSStudentAchievements.StudentAchievementDataTable();
        helper1.Fill(table1,sno);
        helper.Fill(table, achievementID);
        bool a = true;
        for (int i = 0; i < table1.Count; i++)
        {
            if (GainParentRuleID(table1.Rows[i]["RuleID"].ToString()) == "F4")
            {
                a = false;
                string achievement = table1.Rows[i]["AchievementID"].ToString();
                helper.UpdateScoiaWork(organization, poitionTtype, achievement);
                
            }

        }
        if (a)
        {
            helper.InsertSocialWorkProject(achievementID, organization, poitionTtype);
        }

            
        
    }
    ///获得当前学期
    public string GainThisSemester()
    {
        DSStudentAchievementsTableAdapters.SemesterStatusTableAdapter helper = new DSStudentAchievementsTableAdapters.SemesterStatusTableAdapter();
        DSStudentAchievements.SemesterStatusDataTable table = new DSStudentAchievements.SemesterStatusDataTable();
        helper.Fill(table);
        string semester="";
        for (int i = 0; i < table.Count; i++)
        {
            if(table.Rows[i]["SStatus"].ToString() == "True")
            {
                semester=table.Rows[i]["Semester"].ToString();
            }
        }
        return semester;

    }
    ///根据ID获取parentRuleID
    public string GainParentRuleID(string ruleID)
    {
        DSStudentAchievementsTableAdapters.RulesTableAdapter helper = new DSStudentAchievementsTableAdapters.RulesTableAdapter();
        DSStudentAchievements.RulesDataTable table = new DSStudentAchievements.RulesDataTable();
        helper.Fill(table, ruleID);
        string parentID = table.Rows[0]["ParentRuleID"].ToString();
        return parentID;
    }
    ///根据ID获取RuleName
    public string GainRuleName(string ruleID)
    {
        DSStudentAchievementsTableAdapters.RulesTableAdapter helper = new DSStudentAchievementsTableAdapters.RulesTableAdapter();
        DSStudentAchievements.RulesDataTable table = new DSStudentAchievements.RulesDataTable();
        helper.Fill(table, ruleID);
        string ruleName = table.Rows[0]["RuleName"].ToString();
        return ruleName;
    }
    ///根据成果ID删除成果信息
    public void DelectAchievement(string achievementID)
    {
        DSStudentAchievementsTableAdapters.SocialWorkProjectTableAdapter helper1 = new DSStudentAchievementsTableAdapters.SocialWorkProjectTableAdapter();
        DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter helper = new DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter();
        helper.DeleteStudentAchievement(achievementID);
        helper1.DeleteSocialWork(achievementID);
        helper.DeleteAchievement(achievementID);
    }
    ///向3个表里面添加成果信息
    public void AddAchievement(string sno, string achievementID, string semester, DateTime obtainDate, string auditStatus, string achievementType, string ruleID, string title,double mark, string organization, string poitionType)
    {
        AddInfoToAchievement(sno, achievementID, semester, obtainDate, auditStatus, achievementType, ruleID, title);
        AddInfoToStudentAchievement(sno, ruleID, mark, semester, achievementID);
        AddSocialWork(achievementID,organization,poitionType,sno);
    }
   ///更新审核状态
   public void UpdateAuditStatus(string auditStatus,string achievementID)
    {
        DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter helper = new DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter();
        helper.UpdateAuditStatus(auditStatus, achievementID);
    }
    ///判断社会加分当前学期是否已审核,已审核返回true
    public bool NowAuditStatus(string sno,string semester)
    {
        DSStudentAchievementsTableAdapters.StudentAllAchievementTableAdapter helper = new DSStudentAchievementsTableAdapters.StudentAllAchievementTableAdapter();
        DSStudentAchievements.StudentAllAchievementDataTable table = new DSStudentAchievements.StudentAllAchievementDataTable();
        helper.Fill(table, sno);
        bool status = false;
        for (int i = 0; i < table.Count; i++)
        {
            if ((table.Rows[i]["Semester"].ToString() == semester) && (GainParentRuleID(table.Rows[i]["RuleID"].ToString())=="F4"))
            {
                if (table.Rows[i]["AuditStatus"].ToString() == "已审核")
                {
                    status = true;
                }
            }
            if (semester == "")
            {
                return true;
            }
        }
        return status;

    }

}