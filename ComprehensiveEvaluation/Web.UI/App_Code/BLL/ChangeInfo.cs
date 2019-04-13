using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ChangeInfo 的摘要说明
/// </summary>
public class ChangeInfo
{
    public ChangeInfo()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    ///验证密码是否正确
    public bool CheckPassword(string password,string userCode)
    {
        DSChangeInfoTableAdapters.UsersTableAdapter helper = new DSChangeInfoTableAdapters.UsersTableAdapter();
        DSChangeInfo.UsersDataTable table = new DSChangeInfo.UsersDataTable();
        helper.Fill(table, userCode);
        if (table.Rows[0]["Password"].ToString()==password)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
    ///更新数据库密码
    public void ChangePassword(string newPassword,string userCode)
    {
        DSChangeInfoTableAdapters.UsersTableAdapter helper = new DSChangeInfoTableAdapters.UsersTableAdapter();
        helper.UpdatePassword(newPassword, userCode);
  
    }
    ///获得信息表学号和姓名值
    public void GainNumAndName(out string userNum,out string userName,string userCode)
    {
        DSChangeInfoTableAdapters.UsersTableAdapter helper = new DSChangeInfoTableAdapters.UsersTableAdapter();
        DSChangeInfo.UsersDataTable table = new DSChangeInfo.UsersDataTable();
        helper.Fill(table, userCode);
        userNum=table.Rows[0]["UserNum"].ToString();
        userName =table.Rows[0]["Name"].ToString();
    }
    ///修改邮箱、电话
    public void ChangeEmailAndTel(string email,string tel,string userCode)
    {
        DSChangeInfoTableAdapters.UsersTableAdapter helper = new DSChangeInfoTableAdapters.UsersTableAdapter();
        helper.UpdateEmailAndTel(email, tel, tel, userCode);
    }
    ///通过ID获得学号，从用户表
    public string GainUserNum(string userCode)
    {
        string userNum;
        DSChangeInfoTableAdapters.UsersTableAdapter helper = new DSChangeInfoTableAdapters.UsersTableAdapter();
        DSChangeInfo.UsersDataTable table = new DSChangeInfo.UsersDataTable();
        helper.Fill(table, userCode);
        userNum = table.Rows[0]["UserNum"].ToString();
        return userNum;
    }
    ///通过ID获得学号，从学生表里面
    public string GainSnoByUserID(string userCode)
    {
        string Sno;
        DSChangeInfoTableAdapters.StudentTableAdapter helper = new DSChangeInfoTableAdapters.StudentTableAdapter();
        DSChangeInfo.StudentDataTable table = new DSChangeInfo.StudentDataTable();
        helper.Fill(table, userCode);
        Sno = table.Rows[0]["Sno"].ToString();
        return Sno;
    }

}