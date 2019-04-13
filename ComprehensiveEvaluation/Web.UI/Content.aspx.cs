using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //判断用户登陆角色，是学生显示指定文本
            User user = new User();
            if (user.IsNotStudent(Session["UserCode"].ToString()))
            {
                Label1.Text = "友情提示：";
                Label2.Text = " 首次登录系统，请及时完善个人信息与项目成员信息！";
            }
            else
            {
                Label1.Text = "";
                Label2.Text = "";
            }

        }
    }
}