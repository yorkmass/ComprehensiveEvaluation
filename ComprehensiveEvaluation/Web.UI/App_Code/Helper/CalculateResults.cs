using System;
using System.Data;

/// <summary>
/// CalculateResults 的摘要说明
/// </summary>
public class CalculateResults
{
    /// <summary>
    /// 计算综合测评成绩
    /// </summary>
    public CalculateResults()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }



    public static void CompositveScore(string CollegeName, string Major, double maxScore)
    {
        DSStudentTableAdapters.StudentTableAdapter stuHelper = new DSStudentTableAdapters.StudentTableAdapter();
        // 创建学生表
        DSStudent.StudentDataTable stuTable = new DSStudent.StudentDataTable();
       
        // 装入数据
        stuHelper.Fill(stuTable, CollegeName, Major);

        int count = stuTable.Rows.Count;
        string sno;
        string Name;
        string Semester = getSemester();
        // 1 先取出学院中所有的的学生
        for (int i = 0; i < count; i++)
        {
            // 取出每个学生的成果
            sno = stuTable[i].Sno.Trim();
            Name = stuTable[i].Name.Trim();

            DSInnovativeProject.StudentsAchievementsDataTable studentsAchievementsTable = getStudentAchievement(sno);
            int countAchievement = studentsAchievementsTable.Rows.Count;
            // 成果总分数
            double achievementScore = 0.000;
            for (int j = 0; j < countAchievement; j++)
            {
                string RuleId = studentsAchievementsTable[j].RuleID;
                string sqlAchievementScore = string.Format("select Score from Rules where RuleID='{0}'", RuleId);
                achievementScore += Convert.ToDouble(SQLHelper.GetDataTable(sqlAchievementScore).Rows[0]["Score"]);
            }
            string sqlBasisScore = string.Format("SELECT WeightAvgScore, Political, SocialMora, Law, Collective, PublicWork,Health,ObeyRule, BodyMindQualityScore FROM BasisScore WHERE Sno='{0}' and Semester='{1}'", sno, Semester);
            DataTable basicScore = SQLHelper.GetDataTable(sqlBasisScore);
            // 考试成绩分数
            double WeightAvgScore = Convert.ToDouble(basicScore.Rows[0]["WeightAvgScore"]);
            // 身体素质分
            double BodyMindQualityScore = Convert.ToDouble(basicScore.Rows[0]["BodyMindQualityScore"]);
            // 思想品德分
            double IdeologyMoralityScore = Convert.ToDouble(basicScore.Rows[0]["Political"]) + Convert.ToDouble(basicScore.Rows[0]["SocialMora"]) + Convert.ToDouble(basicScore.Rows[0]["Law"]) + Convert.ToDouble(basicScore.Rows[0]["Collective"]) + Convert.ToDouble(basicScore.Rows[0]["PublicWork"]) + Convert.ToDouble(basicScore.Rows[0]["Health"]) + Convert.ToDouble(basicScore.Rows[0]["ObeyRule"]);

            // 如果 最高分大于100 所有的分数 都除以 最高分除以100后的折叠倍数
            if (maxScore > 100)
            {
                achievementScore = Math.Round(achievementScore / (maxScore / 100), 3);
            }

            // 计算出总分
            double total = 0.9 * (BodyMindQualityScore + 0.7 * WeightAvgScore + IdeologyMoralityScore) + 0.1 * (achievementScore);

            // 将计算的分数插入到CompositveScore
            string sqlInsert = string.Format("INSERT INTO CompositveScore(Sno, Name, TotalScore, Semester, AchievementTotalScore) VALUES('{0}', '{1}', '{2}', '{3}', '{4}')", sno, Name, total, Semester, achievementScore);
            SQLHelper.RunNonQuery(sqlInsert);
        }
    }

    public static DSInnovativeProject.StudentsAchievementsDataTable getStudentAchievement(string Sno)
    {
        DSInnovativeProjectTableAdapters.StudentsAchievementsTableAdapter stuAchievementHelp = new DSInnovativeProjectTableAdapters.StudentsAchievementsTableAdapter();
        // 获得当前学期
        string semester = getSemester();
        if (semester == null)
        {
            // 说明当前学期未开启
            return null;
        }

        DSInnovativeProject.StudentsAchievementsDataTable studentsAchievementsTable = new DSInnovativeProject.StudentsAchievementsDataTable();
        stuAchievementHelp.Fill(studentsAchievementsTable, Sno, semester);
        return studentsAchievementsTable;
    }

    // 获得当前学期
    public static string getSemester()
    {
        string semester = null;

        // 创建 sememster表
        DSSemester.SemesterStatusDataTable semesterStatusTable = new DSSemester.SemesterStatusDataTable();
        // 创建 adapter
        DSSemesterTableAdapters.SemesterStatusTableAdapter semesterHelper = new DSSemesterTableAdapters.SemesterStatusTableAdapter();
        semesterHelper.Fill(semesterStatusTable);
        int count = semesterStatusTable.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            if (semesterStatusTable[i].IsCalculateScore == true)
            {
                // 如果学期状态等于true获得当前学期
                semester = semesterStatusTable[i].Semester.ToString();
                break;
            }
        }
        return semester;
    }

    public static double getMaxAchievementScore(string CollegeName, string Major)
    {
        // 最高分数
        double maxScore = 0;

        DSStudentTableAdapters.StudentTableAdapter stuHelper = new DSStudentTableAdapters.StudentTableAdapter();
        // 创建学生表
        DSStudent.StudentDataTable stuTable = new DSStudent.StudentDataTable();

        // 装入数据
        stuHelper.Fill(stuTable, CollegeName, Major);

        int count = stuTable.Rows.Count;
        string sno;
        string Name;
        string Semester = getSemester();
        // 1 先取出学院中选择的专业所有的的学生
        for (int i = 0; i < count; i++)
        {
            // 取出每个学生的成果
            sno = stuTable[i].Sno.Trim();
            Name = stuTable[i].Name.Trim();

            DSInnovativeProject.StudentsAchievementsDataTable studentsAchievementsTable = getStudentAchievement(sno);
            int countAchievement = studentsAchievementsTable.Rows.Count;
            // 成果总分数
            double achievementScore = 0.000;
            for (int j = 0; j < countAchievement; j++)
            {
                string RuleId = studentsAchievementsTable[j].RuleID;
                string sqlAchievementScore = string.Format("select Score from Rules where RuleID='{0}'", RuleId);
                achievementScore += Convert.ToDouble(SQLHelper.GetDataTable(sqlAchievementScore).Rows[0]["Score"]);
            }

            // 判断最高分
            if (maxScore < achievementScore)
                maxScore = achievementScore;
            
        }
        return maxScore;
    }
}