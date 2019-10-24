using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_ClassAdmin_BasicSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChangeInfo changeinfo = new ChangeInfo();
        ClassAudit ca = new ClassAudit();
        StudentAchievements sa = new StudentAchievements();
        Session["Semester"] = sa.GainThisSemester();
        Session["Sno"] = changeinfo.GainSnoByUserID(Session["UserCode"].ToString());
        Session["ClassName"] = ca.GainClassBySno(Session["Sno"].ToString());
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ObjectDataSource2.SelectParameters["semester"].DefaultValue = DropDownList1.SelectedItem.Value;
        MyGridView1.Visible = false;
        MyGridView2.Visible = true;
        MyGridView2.DataBind();
    }
}