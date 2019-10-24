<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataImporter.ascx.cs" Inherits="UserControls_DataImporter" %>

<script type="text/javascript" language="javascript">
    function SetPorgress(pos) {
        // 设置进度条居中
        
    }
</script>

<asp:Wizard ID="ImportWizard" runat="server" ActiveStepIndex="0" Heigh="335px" Width="495px" BorderColor="#8BB6EF" BorderStyle="Solid" BorderWidth="1px"  OnNextButtonClick="ImportWizard_NextButtonClick"    OnFinishButtonClick="ImportWizard_FinishButtonClick" DisplaySideBar="false">
    <StepStyle VerticalAlign="Top" BorderStyle="None"/>
    <WizardSteps>
        <asp:WizardStep ID="WizardStep1" runat="server" Title="第一步：指定待导入字段">
            <p>
                <strong>第一步：选择待导入数据包含的字段及顺序</strong>
            </p>
            <p>
                选择要导入的字段及字段的排列顺序
            </p>
            
        </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>