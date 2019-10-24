using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class WebForms_CollegeAdmin_ExaminationImport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // string UserCode = Session["BranchName"].ToString();
    }

    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        switch (e.Item.Name)
        {
            case "Export":

                break;
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        // 判断fileUpload是否存在文件
        if (!fileUpload.HasFile)
        {
            return;
        }
        // 获取上传文件的文件名
        string fileName = fileUpload.PostedFile.FileName;

        // 生成新文件
        string ext = Path.GetExtension(fileName);
        // 如果不是excel提示然后返回
        if (ext.ToLower() != ".xls")
        {
            MessageBox.ShowErrorMessage("请使用导出后的EXCEL格式文档");
            return;
        }
        // 存储为临时文件
        string newFileName = Guid.NewGuid().ToString() + ext;
        string destPhysicalFile = Path.Combine(Server.MapPath("~/TempFiles"), newFileName);
        fileUpload.SaveAs(destPhysicalFile);

        try
        {
            ExportExcel.ImportExamination(destPhysicalFile);
            FillScore fs = new FillScore();
            fs.FillScoreInAch();
            MessageBox.ShowErrorMessage("导入数据成功!");
        }
        catch (Exception ex)
        {
            MessageBox.ShowErrorMessage(ex.Message);
        }
        finally
        {
            popupUpload.ShowOnPageLoad = false;

            // 删除临时文件
            if (File.Exists(destPhysicalFile))
                File.Delete(destPhysicalFile);
        }
        gvData.DataBind();
    }

    protected void dplMajor_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}