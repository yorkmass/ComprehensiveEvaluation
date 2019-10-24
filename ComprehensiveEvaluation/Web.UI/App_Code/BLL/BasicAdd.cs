using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// BasicAdd 的摘要说明
/// </summary>
public class BasicAdd
{
    public BasicAdd()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    ///根据班级置入班级所有同学该学期J1\J3默认值
    public void ResetScore(string className,string semester)
    {
        double ideoScore = 18.000;
        double bodyScore = 10.000;
        double political = 2.000;
        double socialMora = 3.000;
        double law = 3.000;
        double collective = 3.000;
        double publicWork = 2.000;
        double health = 3.000;
        double obeyRule = 2.000;
        DSBasicAddTableAdapters.BasisScoreTableAdapter helper = new DSBasicAddTableAdapters.BasisScoreTableAdapter();
        helper.UpdateBasicScoreByClass(ideoScore,bodyScore,political,socialMora,law,collective,publicWork,health,obeyRule,className,semester);

    }
    ///根据学号更新基础性素质分值
    public void UpdateBasicScore(double ideoScore, double bodyScore,double political, double socialMora, double law, double collective,double publicWork,double health, double obeyRule,string sno,string semester)
    {
        DSBasicAddTableAdapters.BasisScoreTableAdapter helper = new DSBasicAddTableAdapters.BasisScoreTableAdapter();
        helper.UpdateBasicInfo(ideoScore, bodyScore, political, socialMora, law, collective, publicWork, health, obeyRule, sno, semester);
    }
    ///得到基础性素质测评表
    public DSBasicAdd.BasisScoreDataTable GainBasicScoreTable(string sno,string semester)
    {
        DSBasicAddTableAdapters.BasisScoreTableAdapter helper = new DSBasicAddTableAdapters.BasisScoreTableAdapter();
        return helper.GetData(sno, semester);
    }

}