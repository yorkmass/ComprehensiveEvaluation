using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Common_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void ChangeButton_click(object sender,EventArgs e)
    {
        string password = TextBox1.Text;
        string newPassword = TextBox2.Text;
        string userCode = Session["UserCode"].ToString();
        ChangeInfo changeinfo = new ChangeInfo();
        if (password == "")
        {
            checkNew.Text = "原密码不能为空";
        }
        else
        {
            if (changeinfo.CheckPassword(password, userCode))
            {
               
               
                    if ((TextBox2.Text == TextBox3.Text) && (password != TextBox2.Text)&&TextBox2.Text!="")
                    {
                    if (TextBox2.Text.Length < 8)
                    {
                        MsgBox.ShowMessage("密码必须在8-15字符之间！");
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        checkNew.Text = "";
                    }
                    else
                    {
                        changeinfo.ChangePassword(newPassword, userCode);
                        MsgBox.ShowMessage("修改成功！");
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        checkNew.Text = "";
                    }                  
                    }
                    else if ((TextBox2.Text == TextBox3.Text) && (password == TextBox2.Text))
                    {
                        checkNew.Text = "不能与原密码相同";
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                    }
                    else if ((TextBox2.Text == "") && (TextBox3.Text == ""))
                    {
                        checkNew.Text = "输入不能为空";
                        TextBox1.Text = "";
                }
                    else
                    {
                        checkNew.Text = "两次密码输入不一致";
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                    }
            }
            else
            {
                checkNew.Text = "原密码输入错误";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
            }
        }
        
    }

}