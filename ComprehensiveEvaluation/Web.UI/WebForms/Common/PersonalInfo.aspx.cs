using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Common_PersonalInfo : System.Web.UI.Page
{
    ChangeInfo changeinfo = new ChangeInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        string userCode = Session["UserCode"].ToString();
        string userNum = "";
        string userName = "";
        
        changeinfo.GainNumAndName(out userNum, out userName, userCode);
        UserNumValue.Text = userNum;
        UserNameValue.Text = userName;
    }
    protected void ConfirmClick(object sender,EventArgs e)
    {
        string userCode = Session["UserCode"].ToString();
        string email = EmailBox.Text;
        string tel = TelBox.Text;
        if (email == "" || tel == "")
        {
            MsgBox.ShowMessage("输入不能为空！");
        }
        else
        {
            if (tel.Length != 11)
            {
                MsgBox.ShowMessage("请输入11位的手机号！");
            }
            else
            {
               changeinfo.ChangeEmailAndTel(email, tel, userCode);
                MsgBox.ShowMessage("修改成功！");
            }           
        }
        EmailBox.Text = "";
        TelBox.Text = "";

    }
    protected void ClearClick(object sender,EventArgs e)
    {
        EmailBox.Text = "";
        TelBox.Text = "";
    }
}