using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Student_SearchAchievement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChangeInfo changeinfo = new ChangeInfo();
        Session["Sno"] = changeinfo.GainSnoByUserID(Session["UserCode"].ToString());
     
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ObjectDataSource2.SelectParameters["Semester"].DefaultValue = DropDownList1.SelectedItem.Value;
        GridView2.DataBind();
        GridView2.Visible = true;
        GridView1.Visible = false;
    }




}