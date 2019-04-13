using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!User.Identity.IsAuthenticated)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "tologinpage", "location.href='login.aspx';", true);
        //    return;
        //}
        //else
        //{
        //    User user = new User();
        //    lblName.Text = user.GetName(Session["usercode"].ToString());
        //}
        User user = new User();
        lblName.Text = user.GetName(Session["UserCode"].ToString());
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
    
        FormsAuthentication.SignOut();
        Response.Write(string.Format("<script language='javascript'>parent.location.href='{0}';</script>", FormsAuthentication.LoginUrl));
    }

    protected void siteMapTree_SelectedNodeChanged(object sender, EventArgs e)
    {

    }

    protected void siteMapTree_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
    {
        e.Node.Target = "fContent";
    }
}