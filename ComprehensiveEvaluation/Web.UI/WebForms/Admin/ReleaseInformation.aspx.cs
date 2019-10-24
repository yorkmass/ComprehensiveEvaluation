using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Admin_ReleaseInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        gvInformation.DataBind();
    }

    protected void gvSelectedTaskToEnsure_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            sdsInformationList.DeleteParameters["InformationID"].DefaultValue = ((Label)gvInformation.Rows[index].Cells[0].FindControl("lblInformationID")).Text;
            sdsInformationList.Delete();
            gvInformation.DataBind();
        }
    }
}