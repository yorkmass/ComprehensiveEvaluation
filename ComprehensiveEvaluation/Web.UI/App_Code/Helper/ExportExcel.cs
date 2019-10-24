using System;
using System.Data;
using System.Data.OleDb;
using System.Web;

/// <summary>
/// ExportExcel 的摘要说明
/// </summary>
public class ExportExcel
{
    public ExportExcel()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    // 导出Excel
    public static void ToExcel(DataTable p_Table, HttpResponse p_Response, string p_Titile)
    {
        int _CountR = p_Table.Rows.Count; // 行数
        int _CountC = p_Table.Columns.Count; // 列数
        p_Response.Clear();
        p_Response.Buffer = true;

        // 设置Http的头信息,编码格式
        p_Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlPathEncode(p_Titile) + ".xls");
        p_Response.ContentType = "application/vnd.ms-excel";

        // 设置编码
        p_Response.Charset = "GB2312";
        p_Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");

        // 写表头
        for (int i = 0; i < _CountC; i++)
        {
            p_Response.Write(p_Table.Columns[i].ColumnName + "\t");
        }
        p_Response.Write("\n");

        // 写表内容
        for (int RowNo = 0; RowNo < _CountR; RowNo++)
        {
            string RowContent = "";
            string _Content = string.Empty;
            for (int CloumnNo = 0; CloumnNo < _CountC; CloumnNo++)
            {
                _Content = Convert.ToString(p_Table.Rows[RowNo][CloumnNo]);
                if (_Content == "1900-1-1 0:00:00")
                {
                    _Content = "";
                }
                if (_Content.Contains("\n") == true)
                {
                    _Content = _Content.Replace("\n", "");
                }
                if (_Content.Contains("\r") == true)
                {
                    _Content = _Content.Replace("\r", "");
                }
                if (_Content.Contains("\t") == true)
                {
                    _Content = _Content.Replace("\t", "");
                }

                RowContent += _Content + " \t";
            }
            RowContent += "\n";
            p_Response.Write(RowContent);

        }
        p_Response.End();
    }

    // 导入论文
    public static void ImportThesisExcelFile(string fileName)
    {
        // 连接EXCEL数据字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // Provider = Microsoft.ACE.OLEDB.12.0; Data Source = c:\myFolder\myOldExcelFile.xls; Extended Properties = "Excel 8.0;HDR=YES";
        DSAchievement dsAchievement = new DSAchievement();  // 新建DSAchievement

        // 连接Excel  将Excel中的数据导入 AddInnvoativeProject 表当中
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [论文$]", conn))
            {
                adp.Fill(dsAchievement, "AddThesis");  // 装填数据              
            }
            conn.Close();
            // 查询所得表 赋值给tbAddThsis
            
        }
        DSAchievement.AddThesisDataTable tbAddThesis = dsAchievement.AddThesis;
        // Achievement 添加 
        DSThesisTableAdapters.AchievementTableAdapter achievmentHelper = new DSThesisTableAdapters.AchievementTableAdapter();
        // Thesis
        DSThesisTableAdapters.ThesisTableAdapter thesisHelper = new DSThesisTableAdapters.ThesisTableAdapter();
        // studentAchievement
        DSThesisTableAdapters.StudentsAchievementsTableAdapter studentAchievementHleper = new DSThesisTableAdapters.StudentsAchievementsTableAdapter();

        int count = tbAddThesis.Rows.Count;
        for(int i =0; i<count; i++)
        {
            string Achievement, Semester, Title, JournalName, ThesisType, JournalLevel, Author, Sno, AuthorRank, RuleID=null;
            Achievement = Guid.NewGuid().ToString();
            Semester = CalculateResults.getSemester();
            Title = tbAddThesis[i].论文名称;
            JournalName = tbAddThesis[i].期刊名称;
            ThesisType = tbAddThesis[i].论文类型;
            JournalLevel = tbAddThesis[i].期刊等级;
            Author = tbAddThesis[i].论文所有作者;
            Sno = tbAddThesis[i].学号;
            AuthorRank = tbAddThesis[i].第几作者;

            switch (JournalLevel)
            {
                case "SCI一区期刊":
                    switch (AuthorRank)
                    {
                        case "第一作者":
                            RuleID = "F1020301";
                            break;
                        case "第二作者":
                            RuleID = "F1020302";
                            break;
                        case "第三作者":
                            RuleID = "F1020302";
                            break;
                    }
                    break;
                case "SCI二区期刊":
                    switch (AuthorRank)
                    {
                        case "第一作者":
                            RuleID = "F1020401";
                            break;
                        case "第二作者":
                            RuleID = "F1020402";
                            break;
                        case "第三作者":
                            RuleID = "F1020402";
                            break;
                    }
                    break;
                case "SCI三区期刊":
                    switch (AuthorRank)
                    {
                        case "第一作者":
                            RuleID = "F1020501";
                            break;
                        case "第二作者":
                            RuleID = "F1020502";
                            break;
                        case "第三作者":
                            RuleID = "F1020502";
                            break;
                    }
                    break;
                case "省级一般性期刊":
                    switch (AuthorRank)
                    {
                        case "第一作者":
                            RuleID = "F1020101";
                            break;
                        case "第二作者":
                            RuleID = "F1020102";
                            break;
                        case "第三作者":
                            RuleID = "F1020102";
                            break;
                    }
                    break;
                case "国家级一般性期刊":
                    switch (AuthorRank)
                    {
                        case "第一作者":
                            RuleID = "F1020201";
                            break;
                        case "第二作者":
                            RuleID = "F1020202";
                            break;
                        case "第三作者":
                            RuleID = "F1020202";
                            break;
                    }
                    break;
            }
            if(RuleID == null)
            {
                continue;
            }

            achievmentHelper.InsertQuery(Achievement, Title, Semester, DateTime.Now);
            thesisHelper.InsertQuery(Achievement, JournalName, ThesisType, JournalLevel, Author);
            studentAchievementHleper.InsertQuery(Achievement, Sno, RuleID, Semester);
        }
    }
    // 导入大创项目Excel
    public static void ImportInnovativeProjectExcelFile(string fileName)
    {
        // 连接EXCEL数据字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // Provider = Microsoft.ACE.OLEDB.12.0; Data Source = c:\myFolder\myOldExcelFile.xls; Extended Properties = "Excel 8.0;HDR=YES";
        DSAchievement dSAchievement = new DSAchievement();  // 新建DSAchievement

        // 连接Excel  将Excel中的数据导入 AddInnvoativeProject 表当中
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [创新创业项目$]", conn))
            {
                adp.Fill(dSAchievement, "AddInnovativeProject");  // 装填数据              
            }
            conn.Close();
        }
        // 将查询到的表 赋值给 tbAddInn表
        DSAchievement.AddInnovativeProjectDataTable tbAddInn = dSAchievement.AddInnovativeProject;
        // Achievement 添加   因为有约束 添加的时候需要先添加 这个表 再添加大创项目的表
        DSInnovativeProjectTableAdapters.AchievementTableAdapter achievementHelp = new DSInnovativeProjectTableAdapters.AchievementTableAdapter();
        // InnovativeProject 添加  主要是 大创项目的添加
        DSInnovativeProjectTableAdapters.InnovativeProjectTableAdapter innovativeHelp = new DSInnovativeProjectTableAdapters.InnovativeProjectTableAdapter();
        // StudentAchievement 添加
        DSInnovativeProjectTableAdapters.StudentsAchievementsTableAdapter studentsAchievementHelp = new DSInnovativeProjectTableAdapters.StudentsAchievementsTableAdapter();
        //DSInnovativeProject.InnovativeProjectDataTable innovativeTable = new DSInnovativeProject.InnovativeProjectDataTable();
        // 从数据集中读取数据并导入
        int count = tbAddInn.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            string InnovativeProjectNo, AchievementID, InnovativeProjectType, AchievementType, Title, Sno, ProjectRank;
            InnovativeProjectNo = tbAddInn[i].项目编号.Trim();// 给项目编号赋值
            // 给AchievementID 一个GUID值
            AchievementID = Guid.NewGuid().ToString();
            // InnovativeProjectType 赋值
            InnovativeProjectType = tbAddInn[i].项目类型.Trim();
            // Year  暂时先赋值为2019 代码后期再改
            string Year = CalculateResults.getSemester();
            DateTime ObtainDate = DateTime.Now;

            //// 审核状态 为已审核 
            //AuditStatus = "已审核";
            AchievementType = "创新创业项目";
            Title = tbAddInn[i].项目名称;
            Sno = tbAddInn[i].学号;
            //// 因为模版Excel中有自动换行符 所以只能这样替换掉换行符
            //Sno = Sno.Replace("\r", "");
            //Sno = Sno.Replace("\n", "");
            // RuleID  先设置成Test
            string RuleID;

            // 项目等级
            ProjectRank = tbAddInn[i].等级.Trim();
            if (ProjectRank.Equals("国家级"))
            {
                RuleID = "F1050301";
            }
            else if (ProjectRank.Equals("省级"))
            {
                RuleID = "F1050201";
            }
            else
            {
                RuleID = "F1050101";
            }
            if (InnovativeProjectNo != null)
            {
                // 向Achievement 表中添加数据
                achievementHelp.InsertQuery(AchievementID, Title, Year, ObtainDate, AchievementType);
                // 向InnovativeProject 表中添加数据
                innovativeHelp.InsertQuery(AchievementID, ProjectRank, InnovativeProjectNo, InnovativeProjectType);
                // 向StudentAchievement 表中添加数据
                studentsAchievementHelp.InsertQuery(AchievementID, Sno, RuleID, Year);

            }
        }
    }

    // 导入竞赛信息
    public static void ImportCompetitionExcelFile(string fileName)
    {
        // 连接字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // 新建DSAchievement
        DSAchievement dSAchievement = new DSAchievement();
        // 连接Excel
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [竞赛获奖$]", conn))
            {
                adp.Fill(dSAchievement, "AddCompetition");// 装填数据
            }
            conn.Close();
        }
        // 创建AddCompetition 表 然后将刚才读取到的EXCEL数据给这个表
        DSAchievement.AddCompetitionDataTable tbAddCom = dSAchievement.AddCompetition;
        // Achievement 添加
        DSCompetitionxsdTableAdapters.AchievementTableAdapter achievementHelp = new DSCompetitionxsdTableAdapters.AchievementTableAdapter();
        // Competition添加
        DSCompetitionxsdTableAdapters.CompetitionTableAdapter competitionHelp = new DSCompetitionxsdTableAdapters.CompetitionTableAdapter();
        // StudentAchievement添加
        DSCompetitionxsdTableAdapters.StudentsAchievementsTableAdapter studentAchievementHelp = new DSCompetitionxsdTableAdapters.StudentsAchievementsTableAdapter();
        // 从table中读取数据并导入到数据库中
        int count = tbAddCom.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            string AchievementID, Semester, AchievementType, CompetitionName, AwardRank, AwardLevel, Sno, RuleID;
            int Year = Convert.ToInt32(tbAddCom[i].年份.Trim());

            // 给AchievementID 一个GUID值
            AchievementID = Guid.NewGuid().ToString();
            // 竞赛名称
            CompetitionName = tbAddCom[i].竞赛名称.Trim();
            // 学期
            Semester = CalculateResults.getSemester();
            // ObtainDate
            DateTime ObtainDate = DateTime.Now;
            // AchievementType 项目类型
            AchievementType = "竞赛";
            // AwardRank 获奖级别
            AwardRank = tbAddCom[i].获奖级别.Trim();
            // 竞赛等级 
            AwardLevel = tbAddCom[i].获奖等级.Trim(); 
            // 做一个判断 根据竞赛等级与 获奖级别确定RuleID
            switch (AwardLevel)
            {
                case "国家级":
                    switch (AwardRank)
                    {
                        case "一等奖":
                            RuleID = "F1010401";
                            break;
                        case "二等奖":
                            RuleID = "F1010402";
                            break;
                        case "三等奖":
                            RuleID = "F1010403";
                            break;
                        default:
                            RuleID = "F1010404";
                            break;
                    }
                    break;
                case "省级":
                    switch (AwardRank)
                    {
                        case "一等奖":
                            RuleID = "F1010301";
                            break;
                        case "二等奖":
                            RuleID = "F1010302";
                            break;
                        case "三等奖":
                            RuleID = "F1010303";
                            break;
                        default:
                            RuleID = "F1010304";
                            break;
                    }
                    break;
                case "市级":
                    switch (AwardRank)
                    {
                        case "一等奖":
                            RuleID = "F1010201";
                            break;
                        case "二等奖":
                            RuleID = "F1010202";
                            break;
                        case "三等奖":
                            RuleID = "F1010203";
                            break;
                        default:
                            RuleID = "F1010204";
                            break;
                    }
                    break;
                case "校级":
                    switch (AwardRank)
                    {
                        case "一等奖":
                            RuleID = "F1010201";
                            break;
                        case "二等奖":
                            RuleID = "F1010202";
                            break;
                        case "三等奖":
                            RuleID = "F1010203";
                            break;
                        default:
                            RuleID = "F1010204";
                            break;
                    }
                    break;
                case "院级":
                    switch (AwardRank)
                    {
                        case "一等奖":
                            RuleID = "F1010101";
                            break;
                        case "二等奖":
                            RuleID = "F1010102";
                            break;
                        case "三等奖":
                            RuleID = "F1010203";
                            break;
                        default:
                            RuleID = "F1010104";
                            break;
                    }
                    break;
                default:
                    RuleID = "";
                    break;
            }
            // 学号
            Sno = tbAddCom[i].学号.Trim();
            // Sno += "\r\n";
            // 导入Achievement
            achievementHelp.InsertQuery(AchievementID, CompetitionName, Semester, ObtainDate, "已审核", AchievementType);
            // 导入competitionHelp
            competitionHelp.InsertQuery(AchievementID, CompetitionName, Year, AwardLevel, AwardRank, ObtainDate);
            // 导入StudentAchievements
            studentAchievementHelp.InsertQuery(AchievementID, Sno, RuleID, Semester);
        }
    }

    // 导入学生信息
    public static void ImportStudentInfo(string fileName)
    {
        // 连接字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // 创建DSStudent
        DSStudent dsStudent = new DSStudent();
        // 连接
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [学生信息$]", conn))
            {
                adp.Fill(dsStudent, "AddStudent");
            }
            conn.Close();
        }
        // 创建临时学生表 将读取到的数据放入这个表中
        DSStudent.AddStudentDataTable tbAddStu = dsStudent.AddStudent;
        // 添加User
        DSStudentTableAdapters.UsersTableAdapter usersHelp = new DSStudentTableAdapters.UsersTableAdapter();
        // 添加Student
        DSStudentTableAdapters.StudentTableAdapter stuHlep = new DSStudentTableAdapters.StudentTableAdapter();
        // 添加身份
        DSStudentTableAdapters.UsersInRolesTableAdapter userInRolesHelp = new DSStudentTableAdapters.UsersInRolesTableAdapter();
        // 读取数据的行数
        int count = tbAddStu.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            // UserID
            string UserID = Guid.NewGuid().ToString();
            // UserNum 学号
            string Sno, Name, Password, UserNum, Sex, College, Major, Class;

            Sno = tbAddStu[i].学号.Trim();
            Name = tbAddStu[i].姓名.Trim();
            Password = Sno;
            UserNum = Sno;
            Sex = tbAddStu[i].性别.Trim();
            College = tbAddStu[i].学院.Trim();
            Major = tbAddStu[i].专业.Trim();
            Class = tbAddStu[i].班级.Trim();
            int EntranceYear = Convert.ToInt32(tbAddStu[i].入学年份);
            int Grade = Convert.ToInt32(tbAddStu[i].年级.Trim());
            int SchoolingLength = 4;
            int GraduationYear = EntranceYear+4;
            DateTime date = DateTime.Now;
            usersHelp.InsertQuery(UserID, UserNum, Name, Password, date);
            // 添加学生
            stuHlep.InsertQuery(Sno, UserID, Name, Sex, College, Major,Class, EntranceYear, Grade, SchoolingLength, GraduationYear);
            // 给学生添加学生身份
            userInRolesHelp.InsertQuery(UserID, "9475d40b-f862-41f1-9c01-593c0095b600");
        }
    }

    // 导入学生考试成绩
    public static void ImportExamination(string fileName)
    {
        // 连接字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // 分数表
        DSBasicScore dSBasicScore = new DSBasicScore();
        // 连接
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [加权平均成绩$]", conn))
            {
                adp.Fill(dSBasicScore, "WeightAvgScore");
            }
            conn.Close();
        }
        // 表格
        DSBasicScore.WeightAvgScoreDataTable weightAvgScore = dSBasicScore.WeightAvgScore;
        // 添加
        DSBasicScoreTableAdapters.BasisScoreTableAdapter basisScoreHelp = new DSBasicScoreTableAdapters.BasisScoreTableAdapter();
        // 行数
        int cout = weightAvgScore.Count;
        for(int i=0; i<cout; i++)
        {
            string sno, name, className, semester;
            sno = weightAvgScore[i].学号.Trim();
            name = weightAvgScore[i].姓名.Trim();
            className = weightAvgScore[i].班级.Trim();
            double avgScore = Convert.ToDouble( weightAvgScore[i].加权学分成绩.Trim());
            semester = "2018-2019学年秋季学期";
            basisScoreHelp.InsertQuery(sno, name, className,avgScore, semester);
        }
    }
    // 导入认证考试
    public static void ImportCertificateExcelFile(string fileName)
    {
        // 连接字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // 新建DSAchievement
        DSAchievement dSAchievement = new DSAchievement();
        // 连接Excel
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [认证考试成绩$]", conn))
            {
                adp.Fill(dSAchievement, "AddCertificate");// 装填数据
            }
            conn.Close();
        }
        // 创建认证考试导入模版表
        DSAchievement.AddCertificateDataTable tbAddCertificate = dSAchievement.AddCertificate;
        // Achievement 添加   ADAPTER 
        // DSCertificate.AchievementTableAdapter achievementHelp = new DSCompetitionxsdTableAdapters.AchievementTableAdapter();
        DSCertificateTableAdapters.AchievementTableAdapter achievementHelper = new DSCertificateTableAdapters.AchievementTableAdapter();
        DSCertificateTableAdapters.StudentsAchievementsTableAdapter studentsAchievementsHelper = new DSCertificateTableAdapters.StudentsAchievementsTableAdapter();
        DSCertificateTableAdapters.CertificateTableAdapter certificateHelper = new DSCertificateTableAdapters.CertificateTableAdapter();
        // 从table中读取数据并导入到数据库中
        int count = tbAddCertificate.Rows.Count;
        for(int i = 0; i<count; i++)
        {
            // string AchievementID, Semester, AchievementType, CompetitionName, AwardRank, AwardLevel, Sno, RuleID;
            string AchievementID, Semester, Title, AchievementType, TestDate , ExaminationCardNumber, Mark, Description,Sno, RuleID;
            //int Year = Convert.ToInt32(tbAddCertificate[i].年份.Trim());

            // 给AchievementID 一个GUID值
            AchievementID = Guid.NewGuid().ToString();
            // 获得时间
            TestDate = tbAddCertificate[i].获得日期.Trim();
            // 学期
            Semester = CalculateResults.getSemester();
            // Title
            Title = tbAddCertificate[i].描述.Trim();
            // 准考证号
            ExaminationCardNumber = tbAddCertificate[i].准考证号.Trim();
            // 分数
            Mark = tbAddCertificate[i].成绩.Trim();
            // 描述
            Description = tbAddCertificate[i].描述.Trim();
            if(Description == null)
            {
                Description = "";
            }
            // AchievementType 项目类型
            AchievementType = "认证考试";
            // ObtainDate
            DateTime ObtainDate = DateTime.Now;
            // 做一个判断 根据考试等级和描述 来确定RuleID
            switch (Description)
            {
                case "CET4成绩600分以上":
                    RuleID = "F50101";
                    break;
                    //switch (AwardRank)
                    //{
                    //    case "一等奖":
                    //        RuleID = "F1010401";
                    //        break;
                    //    case "二等奖":
                    //        RuleID = "F1010402";
                    //        break;
                    //    case "三等奖":
                    //        RuleID = "F1010403";
                    //        break;
                    //    default:
                    //        RuleID = "F1010404";
                    //        break;
                    //}
                    //break;
                case "CET6成绩535分以上":
                    RuleID = "F50201";
                    break;

                    //switch (AwardRank)
                    //{
                    //    case "一等奖":
                    //        RuleID = "F1010301";
                    //        break;
                    //    case "二等奖":
                    //        RuleID = "F1010302";
                    //        break;
                    //    case "三等奖":
                    //        RuleID = "F1010303";
                    //        break;
                    //    default:
                    //        RuleID = "F1010304";
                    //        break;
                    //}

                case "CET6成绩600分以上":
                    RuleID = "F50202";
                    break;
                    //switch (AwardRank)
                    //{
                    //    case "一等奖":
                    //        RuleID = "F1010201";
                    //        break;
                    //    case "二等奖":
                    //        RuleID = "F1010202";
                    //        break;
                    //    case "三等奖":
                    //        RuleID = "F1010203";
                    //        break;
                    //    default:
                    //        RuleID = "F1010204";
                    //        break;
                    //}
                    //break;

                default:
                    RuleID = "";
                    break;
            }
            // 学号
            Sno = tbAddCertificate[i].学号.Trim();
            // Sno += "\r\n";
            // 导入Achievement
            //INSERT INTO Achievement(AchievementID, Title, Semester, ObtainDate, Memo, AuditStatus, AchievementType) VALUES (@AchievementID, @Title, @Semester, @ObtainDate, NULL, '已审核', '认证考试')
            achievementHelper.InsertQuery(AchievementID, Description, Semester, ObtainDate);
            // 导入competitionHelp
            certificateHelper.InsertQuery(AchievementID, TestDate, ExaminationCardNumber, Mark, Description, ObtainDate);
            // 导入StudentAchievements
            studentsAchievementsHelper.InsertQuery(AchievementID, Sno, RuleID, Semester);
        }

    }
    // 导入社会实践
    public static void ImportSocialPraticeExcelFile(string fileName)
    {
        // 连接字符串
        string connStr = string.Format("Provider=Microsoft.Jet.Oledb.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'", fileName);
        // 新建DSAchievement
        DSAchievement dSAchievement = new DSAchievement();
        // 连接Excel
        using (OleDbConnection conn = new OleDbConnection(connStr))
        {
            conn.Open();
            using (OleDbDataAdapter adp = new OleDbDataAdapter("SELECT * FROM [社会实践$]", conn))
            {
                adp.Fill(dSAchievement, "AddSocialPratice");// 装填数据
            }
            conn.Close();
        }
        // 创建社会实践导入模版表
        DSAchievement.AddSocialPraticeDataTable tbAddSocialPratice = dSAchievement.AddSocialPratice;
        // Achievement 添加   ADAPTER 
        // DSCertificate.AchievementTableAdapter achievementHelp = new DSCompetitionxsdTableAdapters.AchievementTableAdapter();
        DSSocialPraticeTableAdapters.AchievementTableAdapter achievementHelper = new DSSocialPraticeTableAdapters.AchievementTableAdapter();
        DSSocialPraticeTableAdapters.StudentsAchievementsTableAdapter studentsAchievementsHelper = new DSSocialPraticeTableAdapters.StudentsAchievementsTableAdapter();
        DSSocialPraticeTableAdapters.SocialPraticeTableAdapter socialPraticeHelper = new DSSocialPraticeTableAdapters.SocialPraticeTableAdapter();
        // 从table中读取数据并导入到数据库中
        int count = tbAddSocialPratice.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            //string AchievementID, Semester, AchievementType, TestDate, ExaminationCardNumber, Mark, Description, Sno, RuleID;
            string AchievementID, Semester, Title, AchievementType, PraticeDate, PraticeLevel, PraticeType, Sno, RuleID="";
            //int Year = Convert.ToInt32(tbAddCertificate[i].年份.Trim());

            // 给AchievementID 一个GUID值
            AchievementID = Guid.NewGuid().ToString();
            // 获得时间
            PraticeDate = tbAddSocialPratice[i].实践时间.Trim();
            // 学期
            Semester = CalculateResults.getSemester();
            // 实践名称
            Title = tbAddSocialPratice[i].实践名称.Trim();
            // 实践类别
            PraticeType = tbAddSocialPratice[i].实践类别.Trim();
            // 实践荣誉
            PraticeLevel = tbAddSocialPratice[i].实践荣誉.Trim();

            // AchievementType 项目类型
            AchievementType = "社会实践";
            // ObtainDate
            DateTime ObtainDate = DateTime.Now;
            // 做一个判断 根据实践类别和获得荣誉 来确定RuleID
            switch (PraticeType)
            {
                case "积极参加“三下乡”等社会实践":
                    RuleID = "F20101";
                    break;
                case "其他社会实践":
                    RuleID = "F20102";
                    break;
                case "青年志愿者活动":
                    RuleID = "F20103";
                    break;
                case "“三下乡”等社会实践":
                    switch(PraticeLevel)
                    {
                        case "院级社会实践先进个人":
                            RuleID = "F20201";
                            break;
                        case "市（校）级社会实践先进个人":
                            RuleID = "F20202";
                            break;
                        case "省级社会实践先进个人":
                            RuleID = "F20203";
                            break;
                        case "院级社会实践先进集体":
                            RuleID = "F20301";
                            break;
                        case "市（校）级社会实践先进集体":
                            RuleID = "F20302";
                            break;
                        case "省级社会实践先进集体":
                            RuleID = "F20303";
                            break;
                    }
                    break;
                default:
                    RuleID = "";
                    break;
            }
            // 学号
            Sno = tbAddSocialPratice[i].学号.Trim();
            // Sno += "\r\n";
            // 导入Achievement

            achievementHelper.InsertQuery(AchievementID, Title, Semester, ObtainDate);
            // 导入competitionHelp
            socialPraticeHelper.InsertQuery(AchievementID, PraticeDate, PraticeLevel, PraticeType, ObtainDate);
            // 导入StudentAchievements
            studentsAchievementsHelper.InsertQuery(AchievementID, Sno, RuleID, Semester);
        }

    }
}