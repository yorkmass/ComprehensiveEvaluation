using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CollegeManage 的摘要说明
/// </summary>
public class CollegeManage
{
    public CollegeManage()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    ///判断是否已经是班级管理员
    public bool IsClassAdmin(string userId)
    {
        DSCollegeManageTableAdapters.UsersInRolesTableAdapter helper = new DSCollegeManageTableAdapters.UsersInRolesTableAdapter();
        DSCollegeManage.UsersInRolesDataTable table = helper.GetData(userId);
        if (table.Count == 0)
        {
            return false;
        }
        return true;
    }
    ///添加为班级管理员
    public void AddClassAdmin(string userId)
    {
        DSCollegeManageTableAdapters.UsersInRolesTableAdapter helper = new DSCollegeManageTableAdapters.UsersInRolesTableAdapter();
        helper.InsertClassAdmin(userId);
    }
    ///取消班级管理员
    public void RemoveClassAdmin(string userId)
    {
        DSCollegeManageTableAdapters.UsersInRolesTableAdapter helper = new DSCollegeManageTableAdapters.UsersInRolesTableAdapter();
        helper.DeleteClassAdmin(userId);
    }
}