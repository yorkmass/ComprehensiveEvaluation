using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MyLoginButton_Click(object sender, EventArgs e)
    {
        // 判断是否登陆成功
        string userCode = "";
        string BranchName="";
        string userName = ((ASPxTextBox)Login1.FindControl("UserName")).Text;// 获得 前台空间的用户名值
        string password = ((ASPxTextBox)Login1.FindControl("Password")).Text; // 获得 密码栏的值
        bool rememberMe = ((CheckBox)Login1.FindControl("RememberMe")).Checked;
        
       // bool rememberMe = ((CheckBox)Login1.FindControl("RememberMe")).Checked;

        User userService = new User();
        
        if (!userService.AuthenticateUser(userName, password, out userCode, out BranchName))
        {
            ((Literal)Login1.FindControl("FailureText")).Text = "用户名密码错误 请重试";
            return;
        }
        else
        {
            Session["BranchName"] = BranchName;
            Session["UserCode"] = userCode;  // 已变成参数的值(userid)
            FormsAuthentication.RedirectFromLoginPage(userCode,false);
        }
    }
}