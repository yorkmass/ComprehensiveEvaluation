using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_ClassAdmin_ClassComprehensiveSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // string i = Session["UserCode"].ToString();
    }

    protected void btnSearch0_Click(object sender, EventArgs e)
    {
        gvData.DataBind();
    }

    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        switch (e.Item.Name)
        {
            case "导出":
                gvData.DataBind();
                this.gvExport.WriteXlsToResponse("综测成绩");
                break;
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for
    }
}