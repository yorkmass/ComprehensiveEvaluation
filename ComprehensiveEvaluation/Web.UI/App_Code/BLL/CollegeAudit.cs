using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CollegeAudit 的摘要说明
/// </summary>
public class CollegeAudit
{
    public CollegeAudit()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    ///通过userID得到学院名
    public string GainBranchByID(string userID)
    {
        DSCollegeAuditTableAdapters.IDGetBranchNameTableAdapter helper = new DSCollegeAuditTableAdapters.IDGetBranchNameTableAdapter();
        DSCollegeAudit.IDGetBranchNameDataTable table=helper.GetData(userID);
        return table.Rows[0]["BranchName"].ToString();
    }
   
}