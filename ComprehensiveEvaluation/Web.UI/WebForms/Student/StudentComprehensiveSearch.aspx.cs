using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Student_StudentComprehensiveSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }    
    

    protected void btnSearch0_Click1(object sender, EventArgs e)
    {

    }

    protected void mnuMain_ItemClick1(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        switch (e.Item.Name)
        {
            case "导出":
                gvData.DataBind();
                this.gvExport.WriteXlsToResponse("综测成绩");
                break;
        }
    }
}