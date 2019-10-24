// using Microsoft.Office.Interop.Excel;
using System;
using System.Data;
using System.IO;
using System.Runtime.InteropServices;
using System.Web.UI;


public partial class WebForms_Admin_ScoreSetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //加上下面这句
        if (!IsPostBack)
        {
            gvData.DataBind();
        }
           
    }

    protected void btnScore_Click(object sender, EventArgs e)
    {
        // 拿到专业
        string Major = dplMajor.Text.Trim();
        if(Major == "%")
        {
            MessageBox.ShowErrorMessage("请在专业下来框中选择专业！！");
            return;
        }
        double maxScore = CalculateResults.getMaxAchievementScore(Session["BranchName"].ToString(), Major);
        // 计算综测
        CalculateResults.CompositveScore(Session["BranchName"].ToString(), Major, maxScore);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showPlayerID", "alert('计算成功');", true);
        GoodChart.Visible = true;
        gvData.DataBind();
    }

    protected void btnSearch0_Click(object sender, EventArgs e)
    {
        gvData.DataBind();
    }

    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        switch (e.Item.Name)
        {
            case "Export":
                
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