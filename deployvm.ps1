# This is the script to use for deployment of the VMs specified in the ARM templates in the template folder
# Our resource group is already predefined in the CAFFortmu blueprint

$getarg = $args[0]

$ResourceGroup = "FortmuLtd-VNet-rg"
$TemplateOne = ".\Templates\VMTemplate_01.json"
$ParameterOne = ".\Templates\VMParameters_01.json"
$DeploymentOne = New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $TemplateOne -TemplateParameterFile $ParameterOne

$TemplateTwo = ".\Templates\VMTemplate_02.json"
$ParameterTwo = ".\Templates\VMParameters_02.json"
$DeploymentTwo = New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $TemplateTwo -TemplateParameterFile $ParameterTwo


# We check if the variable meets the criteria of our condition
# If everything is correct, you will be asked to give an adminUsername and adminPassword for the VM
# The new code is deployed after that

if ($getarg -eq "deploy")
{
    $DeploymentOne
    $DeploymentTwo
}

else
{
    Write-Host "Wrong deployment!" -ForegroundColor Red
}
