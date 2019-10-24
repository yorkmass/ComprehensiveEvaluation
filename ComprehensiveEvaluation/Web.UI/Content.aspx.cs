using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            if (Roles.IsUserInRole("学生"))
            {
                Label1.Text = "友情提示：";
                Label2.Text = " 首次登录系统，请及时完善个人信息与项目成员信息！";
            }
            else
            {
                Label1.Text = "友情提示：";
                Label2.Text = "请老师们及时通知学生完成综测加分的录入！";
            }

    }
}