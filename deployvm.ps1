# This is the script to use for deployment of the VMs specified in the ARM templates in the template folder
# Our resource group is already predefined in the CAFFortmu blueprint

$ResourceGroup = "FortmuLtd-VNet-rg"
$TemplateOne = ".\Templates\VMTemplate_01.json"
$ParameterOne = ".\Templates\VMParameters_01.json"
$DeploymentOne = New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $TemplateOne -TemplateParameterFile $ParameterOne

$TemplateTwo = ".\Templates\VMTemplate_02.json"
$ParameterTwo = ".\Templates\VMParameters_02.json"
$DeploymentTwo = New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $TemplateTwo -TemplateParameterFile $ParameterTwo

$DeploymentOne
$DeploymentTwo