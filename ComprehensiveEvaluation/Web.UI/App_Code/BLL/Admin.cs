using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Admin 的摘要说明
/// </summary>
public class Admin
{
    public Admin()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    ///根据账号获得ID
    public string GainIdByNum(string userNum)
    {
        DSAdminTableAdapters.UsersTableAdapter helper = new DSAdminTableAdapters.UsersTableAdapter();
        DSAdmin.UsersDataTable table = helper.GetData(userNum);
        string userId=table.Rows[0]["UserId"].ToString();
        return userId; 
    }
    ///根据ID获取学号
    public string GainNumById(string userId)
    {
        DSAdminTableAdapters.UsersTableAdapter helper = new DSAdminTableAdapters.UsersTableAdapter();
        DSAdmin.UsersDataTable table = helper.GetDataBy1(userId);
        string userNum = table.Rows[0]["UserNum"].ToString();
        return userNum;

    }
    ///根据ID获得姓名
    public string GainNameById(string userCode)
    {
        DSAdminTableAdapters.UsersTableAdapter helper = new DSAdminTableAdapters.UsersTableAdapter();
        DSAdmin.UsersDataTable table = helper.GetDataBy1(userCode);
        return table.Rows[0]["Name"].ToString();
    }
    ///删除学院管理员
    public void DelectBranchAdmin(string userId)
    {
        DSAdminTableAdapters.CollegeAdminTableAdapter helper = new DSAdminTableAdapters.CollegeAdminTableAdapter();
        helper.DeleteUserInRole(userId);
        helper.DeleteBranchUser(userId);
        helper.DeleteUser(userId);
    }
    ///判断数据库学院管理员角色是否存在相同账号
    public bool HaveSameNumCollege(string userNum)
    {
        DSAdminTableAdapters.UserTableAdapter helper = new DSAdminTableAdapters.UserTableAdapter();
        DSAdmin.UserDataTable table = helper.GetDataByCollege();
        for (int i = 0; i < table.Count; i++)
        {
            if (table.Rows[i]["UserNum"].ToString()==userNum)
            {
                return true;
            }
        }
        return false;
    }
    ///判断数据库管理员角色是否存在相同账号
    public bool HaveSameNumAdmin(string userNum)
    {
        DSAdminTableAdapters.UserTableAdapter helper = new DSAdminTableAdapters.UserTableAdapter();
        DSAdmin.UserDataTable table = helper.GetDataByAdmin();
        for (int i = 0; i < table.Count; i++)
        {
            if (table.Rows[i]["UserNum"].ToString() == userNum)
            {
                return true;
            }
        }
        return false;
    }
    ///添加管理员
    public void AddAdmin(string userId,string userNum,string name,string password)
    {
        DSAdminTableAdapters.AdminMangerTableAdapter helper = new DSAdminTableAdapters.AdminMangerTableAdapter();
        if (HaveSameNumCollege(userNum))
        {
            string userHaveId = GainIdByNum(userNum);
            if (!HaveSameNumAdmin(userNum))
            {              
                helper.InsertAdminInRole(userHaveId);
            }
            helper.UpdateAdmin(name, password, userHaveId);
        }
        else
        {
            helper.InsertAdmin(userId, userNum, name, password);
            helper.InsertAdminInRole(userId);
        }
    }
    ///删除管理员
    public void delectAdmin(string userId)
    {
        DSAdminTableAdapters.AdminMangerTableAdapter helper = new DSAdminTableAdapters.AdminMangerTableAdapter();
        string userNum = GainNumById(userId);
        if (HaveSameNumCollege(userNum))
        {
            helper.DeleteAdminInRole(userId);
        }
        else
        {
            helper.DeleteAdminInRole(userId);
            helper.DeleteAdminUser(userId);
        }
       
    }
}