using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_ClassAdmin_BasicAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChangeInfo changeinfo = new ChangeInfo();
        ClassAudit ca = new ClassAudit();
        StudentAchievements sa = new StudentAchievements();
        Session["Semester"]= sa.GainThisSemester();
        Session["Sno"] = changeinfo.GainSnoByUserID(Session["UserCode"].ToString());
        Session["ClassName"] = ca.GainClassBySno(Session["Sno"].ToString());
    }

    protected void mnuMain_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        Sport sport = new Sport();
        bool a = true;
        if (!sport.OpenSystem(Session["Semester"].ToString()))
        {
            a = false;
            popupChangeRule.ShowOnPageLoad = false;
            MsgBox.ShowMessage("未到系统开放时间");
        }
        if (a)
        {
            popupChangeRule.ShowOnPageLoad = true;
        }
    }

    protected void ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        if (PoliticalValue.Text == "" || SocialMValue.Text == "" || LawValue.Text == ""|| CollectiveValue.Text == ""|| PublicWorkValue.Text == ""|| HealthValue.Text == ""|| ObeyRuleValue.Text == ""|| BodyScoreValue.Text == "")
        {
            MsgBox.ShowMessage("输入不能为空！<br/>无数据被提交");
        }
        else
        {
            BasicAdd ba = new BasicAdd();
            try
            {
                double moraTotle = Convert.ToDouble(PoliticalValue.Text) + Convert.ToDouble(SocialMValue.Text) + Convert.ToDouble(LawValue.Text) + Convert.ToDouble(CollectiveValue.Text) + Convert.ToDouble(PublicWorkValue.Text) + Convert.ToDouble(HealthValue.Text) + Convert.ToDouble(ObeyRuleValue.Text);
                MoraTotal.Text = moraTotle.ToString();
                ba.UpdateBasicScore(Convert.ToDouble(MoraTotal.Text), Convert.ToDouble(BodyScoreValue.Text), Convert.ToDouble(PoliticalValue.Text), Convert.ToDouble(SocialMValue.Text), Convert.ToDouble(LawValue.Text), Convert.ToDouble(CollectiveValue.Text), Convert.ToDouble(PublicWorkValue.Text), Convert.ToDouble(HealthValue.Text), Convert.ToDouble(ObeyRuleValue.Text), DropDownList1.SelectedItem.Value, Session["Semester"].ToString());
            }
            catch
            {
                MsgBox.ShowMessage("只能填写数字或者小数！");
            }                                
            MyGridView1.DataBind();
            PoliticalValue.Text = "";
            SocialMValue.Text = "";
            LawValue.Text = "";
            CollectiveValue.Text = "";
            PublicWorkValue.Text = "";
            HealthValue.Text = "";
            ObeyRuleValue.Text = "";
            BodyScoreValue.Text = "";
            BodyTotal.Text = "";
            MoraTotal.Text = "";
            LabelMor.Visible = false;
            LabelBody.Visible = false;
        }              
    }

    protected void ResetDefaultScore_Click(object sender, EventArgs e)
    {
        BasicAdd bs = new BasicAdd();
        bs.ResetScore(Session["ClassName"].ToString(), Session["Semester"].ToString());
        MyGridView1.DataBind();
        LabelMor.Visible = false;
        LabelBody.Visible = false;
        PoliticalValue.Text = "";
        SocialMValue.Text = "";
        LawValue.Text = "";
        CollectiveValue.Text = "";
        PublicWorkValue.Text = "";
        HealthValue.Text = "";
        ObeyRuleValue.Text = "";
        BodyScoreValue.Text = "";
        BodyTotal.Text = "";
        MoraTotal.Text = "";
        popupChangeRule.ShowOnPageLoad = false;
        MsgBox.ShowMessage(Session["ClassName"].ToString()+"所有同学"+ "思想品德素质<br/>和身心测评素质分已初始化！");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMor.Visible = false;
        LabelBody.Visible = false;
        MoraTotal.Text = "";
        BodyTotal.Text = "";
        BasicAdd bs = new BasicAdd();
        DSBasicAdd.BasisScoreDataTable table = bs.GainBasicScoreTable(DropDownList1.SelectedItem.Value, Session["Semester"].ToString());
        PoliticalValue.Text = table.Rows[0]["Political"].ToString();
        SocialMValue.Text = table.Rows[0]["SocialMora"].ToString();
        LawValue.Text = table.Rows[0]["Law"].ToString();
        CollectiveValue.Text = table.Rows[0]["Collective"].ToString();
        PublicWorkValue.Text = table.Rows[0]["PublicWork"].ToString();
        HealthValue.Text = table.Rows[0]["Health"].ToString();
        ObeyRuleValue.Text = table.Rows[0]["ObeyRule"].ToString();
        BodyScoreValue.Text = table.Rows[0]["BodyMindQualityScore"].ToString();
    }

    protected void CaculaterBtn_Click(object sender, EventArgs e)
    {
        try
        {
            double moraTotle = Convert.ToDouble(PoliticalValue.Text) + Convert.ToDouble(SocialMValue.Text) + Convert.ToDouble(LawValue.Text) + Convert.ToDouble(CollectiveValue.Text) + Convert.ToDouble(PublicWorkValue.Text) + Convert.ToDouble(HealthValue.Text) + Convert.ToDouble(ObeyRuleValue.Text);
            MoraTotal.Text = moraTotle.ToString();
            LabelMor.Visible = true;
            LabelBody.Visible = true;
        }
        catch
        {
            MsgBox.ShowMessage("只能填写数字或者小数！");
        }
        BodyTotal.Text = BodyScoreValue.Text;
    }
}