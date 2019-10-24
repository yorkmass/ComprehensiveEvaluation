using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Sport 的摘要说明
/// </summary>
public class Sport
{
    public Sport()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    StudentAchievements sa = new StudentAchievements();
    ///根据AchievementID删除成果信息
    public void DelectAchievement(string achievementID)
    {
        DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter helper = new DSStudentAchievementsTableAdapters.StudentAchievementTableAdapter();
        DSSportTableAdapters.RecreationSportTableAdapter helper1 = new DSSportTableAdapters.RecreationSportTableAdapter();
        StudentAchievements sa = new StudentAchievements();
        helper.DeleteStudentAchievement(achievementID);
        helper1.DeleteRecreationSport(achievementID);
        sa.DelectFiles(achievementID);
        helper.DeleteAchievement(achievementID);

    }
    //判断学期是否开启，开启返回true
    public bool OpenSystem(string semester)
    {
        DSStudentAchievementsTableAdapters.SemesterStatusTableAdapter helper = new DSStudentAchievementsTableAdapters.SemesterStatusTableAdapter();
        DSStudentAchievements.SemesterStatusDataTable table = new DSStudentAchievements.SemesterStatusDataTable();
        helper.Fill(table);
        for (int i = 0; i < table.Count; i++)
        {
            if (table.Rows[i]["Semester"].ToString() == semester)
            {
                if (table.Rows[i]["SStatus"].ToString()=="True")
                {
                    return true;
                }
            }
        }
        return false;
    }
    //判断学期是否开启，开启返回true，无参数
    public bool OpenSystem()
    {
        DSStudentAchievementsTableAdapters.SemesterStatusTableAdapter helper = new DSStudentAchievementsTableAdapters.SemesterStatusTableAdapter();
        DSStudentAchievements.SemesterStatusDataTable table = new DSStudentAchievements.SemesterStatusDataTable();
        helper.Fill(table);
        for (int i = 0; i < table.Count; i++)
        {
            if(table.Rows[i]["SStatus"].ToString() == "True")
            {
                return true;
            }
        }
        return false;
    }

    //添加文体竞赛加分成果
    public void AddAchievements(string achievementID,string sno,string ruleID,double mark,string semester,string title,DateTime obtainDate,string auditStatus,string achievementType,string comName,string awardType,string comLevel,DateTime lastUpdate,int year,string pathName)
    {
        DSSportTableAdapters.AchievementTableAdapter helper = new DSSportTableAdapters.AchievementTableAdapter();
        DSSportTableAdapters.StudentsAchievementsTableAdapter helper1 = new DSSportTableAdapters.StudentsAchievementsTableAdapter();
        DSSportTableAdapters.RecreationSportTableAdapter helper2 = new DSSportTableAdapters.RecreationSportTableAdapter();
        helper.InsertAchievement(achievementID,title,semester,obtainDate,auditStatus,achievementType);
        helper1.InsertStudentAchievements(achievementID,sno,ruleID,mark,semester);
        helper2.InsertRecreationSport(achievementID,comName,awardType,comLevel,lastUpdate,year);
        StudentAchievements sa = new StudentAchievements();
        sa.AddFiles(achievementID, pathName);
    }
    ///根据achievementID获得成果类型
    public string GainAchTypeByAchID(string achievementID)
    {
        DSSportTableAdapters.AchievementTableAdapter helper = new DSSportTableAdapters.AchievementTableAdapter();
        DSSport.AchievementDataTable table = new DSSport.AchievementDataTable();
        helper.Fill(table, achievementID);
        return table.Rows[0]["AchievementType"].ToString();
    }
    ///根据achievementID获取审核状态
    public string GainAuditStatusByAchID(string achievementID)
    {
        DSSportTableAdapters.AchievementTableAdapter helper = new DSSportTableAdapters.AchievementTableAdapter();
        DSSport.AchievementDataTable table = new DSSport.AchievementDataTable();
        helper.Fill(table, achievementID);
        return table.Rows[0]["AuditStatus"].ToString();
    }
}