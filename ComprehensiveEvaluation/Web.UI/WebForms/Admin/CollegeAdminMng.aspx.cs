using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Admin_CollegeAdminMng : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

  

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            Admin admin = new Admin();
            if (admin.HaveSameNumAdmin(txtUserNum.Text))
            {
                MessageBox.ShowMessage("该账号在管理员角色中已存在!");
            }
            else
            {
                if(txtUserNum.Text == ""||txtName.Text == ""||txtPassword.Text == "")
                {
                    MessageBox.ShowMessage("不能为空!");
                }
                else
                {
                    string userId = Guid.NewGuid().ToString();
                    // 获得学院id
                    string BranchId = dplCollege.SelectedValue;
                    string insertSql = string.Format("INSERT INTO Users(UserId,UserNum,Name,Password) VALUES('{0}', '{1}', '{2}', '{3}')", userId, txtUserNum.Text, txtName.Text, txtPassword.Text);
                    SQLHelper.RunNonQuery(insertSql);

                    string insertRole = string.Format("INSERT INTO UsersInRoles(UserId, RoleId) VALUES('{0}', '6E902DE1-8934-4695-AB7A-4EDF99B71543')", userId);
                    SQLHelper.RunNonQuery(insertRole);

                    string insertBranches = string.Format("INSERT INTO BranchUsers(UserId, BranchId) VALUES('{0}','{1}')", userId, BranchId);
                    SQLHelper.RunNonQuery(insertBranches);
                    MessageBox.ShowMessage("添加成功!");
                }

            }
            gvData.DataBind();
            MyGridView1.Visible = false;
            gvData.Visible = true;
            popupUpload.ShowOnPageLoad = false;
            txtUserNum.Text = "";
            txtName.Text = "";
            txtPassword.Text = "";


        }
        catch (Exception ex)
        {
            MessageBox.ShowErrorMessage(ex.Message);
        }
    }





    protected void ASPxMenu1_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        MyGridView1.Visible = true;
        gvData.Visible = false;
        MyGridView1.DataBind();
    }

    protected void MyGridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            string userId = e.CommandArgument.ToString();
            Admin admin = new Admin();
            admin.DelectBranchAdmin(userId);
            MessageBox.ShowMessage("已删除!");           
            MyGridView1.DataBind();
            gvData.DataBind();

        }
    }
}