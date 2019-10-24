using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_CollegeAdmin_ClassAdminMng : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }




    protected void gvData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string userId = e.CommandArgument.ToString();
        CollegeManage cm = new CollegeManage();
        if (e.CommandName == "Back")
        {
            cm.RemoveClassAdmin(userId);
            MsgBox.ShowMessage("已移除该同学班级管理员职位！");
        }
        if (e.CommandName == "Pass")
        {
            if (cm.IsClassAdmin(userId))
            {
                MsgBox.ShowMessage("对方已经是班级管理员了！");
            }
            else
            {
                cm.AddClassAdmin(userId);
                MsgBox.ShowMessage("成功设置为班级管理员！");
            }
        }


    }
}