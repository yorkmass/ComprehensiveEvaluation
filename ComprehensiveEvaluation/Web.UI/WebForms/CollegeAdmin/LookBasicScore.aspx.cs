using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_CollegeAdmin_LookBasicScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CollegeAudit ca = new CollegeAudit();
        Session["College"] = ca.GainBranchByID(Session["UserCode"].ToString());
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DClassName.Visible = true;
        DropDownList1.Visible = false;
        ObjectDataSource2.SelectParameters["major"].DefaultValue = DMarjor.SelectedItem.Value;
    }



    /// <summary>
    /// 学期
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ObjectDataSource3.SelectParameters["semester"].DefaultValue = DropDownList2.SelectedItem.Value;
        MyGridView1.DataBind();
    }

    /// <summary>
    /// 班级
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DClassName_Change(object sender, EventArgs e)
    {
        DClassName.Visible = true;
        ObjectDataSource3.SelectParameters["ClassName"].DefaultValue = DClassName.SelectedItem.Value;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DClassName.Visible = true;
        DropDownList1.Visible = false;
        ObjectDataSource2.SelectParameters["major"].DefaultValue = DMarjor.SelectedItem.Value;
    }
}