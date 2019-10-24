using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_Admin_SemesterStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpadd_Click(object sender, EventArgs e)
    {
        // 添加新学期
        try
        {
            // 学期名称
            string semester = txtSemester.Text.Trim();
            string sql = string.Format("INSERT INTO SemesterStatus(Semester, SStatus) VALUES('{0}', 0)", semester);
            SQLHelper.RunNonQuery(sql); // 添加
            mgvSemester.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addResult", "alert('添加成功');", true);
        }catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addResult", "alert('"+ex.Message+"');", true);
        }
    }


    protected void mnuSemester_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
       
    }
}