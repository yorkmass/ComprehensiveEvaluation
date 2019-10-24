using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// User 的摘要说明
/// </summary>
public class User
{
    public User()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 判断输入的用户是否在Users表中
    /// </summary>
    /// <param name="username"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    public bool AuthenticateUser(string username, string password, out string userId, out string BranchName)
    {
        DSUsersTableAdapters.UsersTableAdapter helper = new DSUsersTableAdapters.UsersTableAdapter();
        DSUsers.UsersDataTable table = new DSUsers.UsersDataTable();    
        helper.Fill(table, password, username);

        DSUsersTableAdapters.BranchUsersTableAdapter branchUsersHelp = new DSUsersTableAdapters.BranchUsersTableAdapter();
        DSUsers.BranchUsersDataTable branchUsersTable = new DSUsers.BranchUsersDataTable();

        // 如果查询出来的密码匹配， 则验证通过
        //之前写的是：table.Rows.Count == 0 这个会出现大小写无法区分问题
        if (table.Rows.Count == 0 || password != table.Rows[0]["Password"].ToString()) 
        {
            
            userId = "";
            BranchName = "";
            return false;
        }
        else
        {
            userId = table.Rows[0]["UserId"].ToString();
            branchUsersHelp.Fill(branchUsersTable, userId);
            if (branchUsersTable.Rows.Count == 0)
                BranchName = "";
            else
                BranchName = branchUsersTable.Rows[0]["BranchName"].ToString();
            return true;
        }
    }
    
    /// <summary>
    /// 返回用户名
    /// </summary>
    /// <param name="UserCode">接受的Session值</param>
    /// <returns></returns>
    public string GetName(string UserCode)
    {
        DSUsersTableAdapters.UsersTableAdapter helper = new DSUsersTableAdapters.UsersTableAdapter();
        DSUsers.UsersDataTable table = new DSUsers.UsersDataTable();
        helper.FillByPsw(table, UserCode);
        string name = string.Empty; //声明返回name
        if(table.Rows.Count != 0)
        {
            name = table.Rows[0]["Name"].ToString();
        }
        return name;
    }

    /// <summary>
    /// 获得角色ID号
    /// </summary>
    /// <param name="Rname"></param>
    /// <returns></returns>
    public string GetRid(string Rname)
    {
        DSUsersTableAdapters.RolesTableAdapter helper = new DSUsersTableAdapters.RolesTableAdapter();
        DSUsers.RolesDataTable table = new DSUsers.RolesDataTable();
        helper.Fill(table, Rname);
        return table.Rows[0]["RoleId"].ToString();
    }

    /// <summary>
    /// 判断是否是学生
    /// </summary>
    /// <param name="userCode">用户编号</param>
    /// <returns>true:是</returns>
    public bool IsNotStudent(string userCode)
    {
        bool resIsNot = false;
        string strSql = "SELECT [RoleId] FROM [dbo].[UsersInRoles] where UserId=@UserCode";
        System.Data.SqlClient.SqlParameter[] para = new System.Data.SqlClient.SqlParameter[1];
        para[0] = new System.Data.SqlClient.SqlParameter("@UserCode", userCode);
        System.Data.DataTable dt = SQLHelper.GetDataTable(strSql, para);        
        if (dt.Rows[0][0].ToString() == "5")
        { resIsNot = true; }
        return resIsNot;

    }
}