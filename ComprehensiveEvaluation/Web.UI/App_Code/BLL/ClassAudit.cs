using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ClassAudit 的摘要说明
/// </summary>
public class ClassAudit
{
    public ClassAudit()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    ///根据学号获取班级
    public string GainClassBySno(string sno)
    {
        DSClassAuditTableAdapters.StudentTableAdapter helper = new DSClassAuditTableAdapters.StudentTableAdapter();
        DSClassAudit.StudentDataTable table = new DSClassAudit.StudentDataTable();
        helper.Fill(table, sno);        
        return table.Rows[0]["Class"].ToString();
    }
    ///获取驳回申请条数
    public int RejectCount(string classNum,string semester)
    {
        DSClassAuditTableAdapters.ClassAuditTableAdapter helper = new DSClassAuditTableAdapters.ClassAuditTableAdapter();
        DSClassAudit.ClassAuditDataTable table = helper.GetDataBy(classNum, semester);
        int count = 0;
        for (int i = 0; i < table.Count; i++)
        {
            if (table.Rows[i]["AuditStatus"].ToString() == "驳回")
            {
                count++;
            }
        }
        return count;
    }
    ///获取申请者姓名
    public string GainNameByAch(string achievementID)
    {
        DSClassAuditTableAdapters.ClassAuditTableAdapter helper = new DSClassAuditTableAdapters.ClassAuditTableAdapter();
        DSClassAudit.ClassAuditDataTable table = helper.GetDataByAch(achievementID);
        return table.Rows[0]["Name"].ToString();
    }

}