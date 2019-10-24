using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Admin_EditInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Admin admin = new Admin();           
            txtAuthor.Text = admin.GainNameById(Session["UserCode"].ToString()); ;
        }

        if (Request.QueryString["mode"] == "insert")
        {
            fvInformation.DefaultMode = FormViewMode.Insert;
            lblTitle.Text = "新建新闻通知";
        }
        else
        {
            fvInformation.DefaultMode = FormViewMode.Edit;
            lblTitle.Text = "编辑新闻通知";
        }
    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {
        fvInformation.InsertItem(true);
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        fvInformation.UpdateItem(true);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseParentPopup", "CloseParentPopup();", true);
    }

    protected void fvInformation_ItemCreated(object sender, EventArgs e)
    {
        if (fvInformation.CurrentMode == FormViewMode.Insert)
        {
            CheckBox forTeacherCheckBox = fvInformation.FindControl("ForTeacherCheckBox") as CheckBox;
            CheckBox forStudentCheckBox = fvInformation.FindControl("ForStudentCheckBox") as CheckBox;

            if (forTeacherCheckBox != null)
                forTeacherCheckBox.Checked = true;

            if (forStudentCheckBox != null)
                forStudentCheckBox.Checked = true;
        }
    }

    protected void sdsInformationDetail_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentData", "RefreshParentData();", true);
    }

    protected void sdsInformationDetail_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentData", "RefreshParentData();", true);
    }
}