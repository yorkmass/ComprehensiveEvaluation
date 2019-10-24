using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// FillScore 的摘要说明
/// </summary>
public class FillScore
{
    public FillScore()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public void FillScoreInAch()
    {
        DSFillScoreTableAdapters.StudentsAchievementsTableAdapter helper = new DSFillScoreTableAdapters.StudentsAchievementsTableAdapter();
        DSFillScore.StudentsAchievementsDataTable table = new DSFillScore.StudentsAchievementsDataTable();
        helper.Fill(table);
        StudentAchievements sa = new StudentAchievements();
        for (int i = 0; i < table.Count; i++)
        {
            helper.UpdateScore(sa.FindScoreByRuleID(table.Rows[i]["RuleID"].ToString()), table.Rows[i]["RuleID"].ToString());
        }
    }
}