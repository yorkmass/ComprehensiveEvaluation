using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Admin_AdminMng : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string userNum = txtUserNum.Text.Trim();
        string password = txtPassword.Text.Trim();
        string userName = txtName.Text.Trim();
        string userId=Guid.NewGuid().ToString();
        if (userNum==""||password==""||userName=="")
        {
            MessageBox.ShowMessage("输入不能为空！");
        }
        else
        {
            Admin admin = new Admin();
            admin.AddAdmin(userId, userNum, userName, password);
            MessageBox.ShowMessage("添加成功！");
            popupUpload.ShowOnPageLoad = false;
            MyGridView1.DataBind();
            txtUserNum.Text="";
            txtPassword.Text = "";
            txtName.Text = "";
        }
    }
       

    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            string userId = e.CommandArgument.ToString();
            Admin admin = new Admin();
            admin.delectAdmin(userId);
            MessageBox.ShowMessage("已删除!");
            MyGridView1.DataBind();

        }
    }
}