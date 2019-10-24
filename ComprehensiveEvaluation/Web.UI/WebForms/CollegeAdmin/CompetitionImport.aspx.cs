using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_CollegeAdmin_CompetitionImport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // if(!)
    }

    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        switch (e.Item.Name)
        {
            
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        // 判断fileUpload是否存在文件
        if (!fileUpload.HasFile)
            return;
        // 获取上传文件名
        string fileName = fileUpload.PostedFile.FileName;

        // 生成新文件
        string ext = Path.GetExtension(fileName); // 获取文件字符串的后缀
        // 如果不是excel 返回提示
        if(ext.ToLower() != ".xls")
        {
            MessageBox.ShowErrorMessage("请使用导出后的Excel格式文档");
            return;
        }

        // 存储为临时文件 GUID编码+后缀名
        string newFileName = Guid.NewGuid().ToString() + ext;
        string destPhysicalFile = Path.Combine(Server.MapPath("~/TempFiles"), newFileName);
        fileUpload.SaveAs(destPhysicalFile);

        try
        {
            ExportExcel.ImportCompetitionExcelFile(destPhysicalFile);
            FillScore fs = new FillScore();
            fs.FillScoreInAch();
            MessageBox.ShowMessage("导入数据成功");
        }
        catch(Exception ex)
        {
            MessageBox.ShowErrorMessage(ex.Message);
        }
        finally
        {
            popupUpload.ShowOnPageLoad = false;
            gvData.DataBind();
            // 删除临时文件

            if (File.Exists(destPhysicalFile))
            {
                File.Delete(destPhysicalFile);
            }
        }
    }
}