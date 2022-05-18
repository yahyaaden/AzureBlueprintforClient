# This is the script to resize the VM specified in the ARM templates in the template folder
# Our resource group is already predefined in the CAFFortmu blueprint
# When running this script, change the $VMName to the correct VM name

$ResourceGroup = "FortmuLtd-VNet-rg"
$VMOne = "FortmuVM1"
$VMTwo = "FortmuVM2"

# We place the commands in their respective variables. Remove the placeholder for VM size for the one
# you want from the list command

$getarg = $args[0]

##Standard_D2as_v4 <- Standard size with deployment
##Standard_D4as_v4 <- Works

# Belongs to the list command

$ListVMOne = Get-AzVMSize -ResourceGroupName $ResourceGroup -VMName $VMOne
$ListVMTwo = Get-AzVMSize -ResourceGroupName $ResourceGroup -VMName $VMTwo

#Belongs to the update command

$VM = Get-AzVM -ResourceGroupName $ResourceGroup -VMName $VMOne
$VM.HardwareProfile.VmSize = "<vm-size>"
$UpdateVMOne = Update-AzVM -VM $VM -ResourceGroupName $ResourceGroup

$VM = Get-AzVM -ResourceGroupName $ResourceGroup -VMName $VMTwo
$VM.HardwareProfile.VmSize = "<vm-size>"
$UpdateVMTwo = Update-AzVM -VM $VM -ResourceGroupName $ResourceGroup


# We list all the VM sizes available in the region the VM is hosted

if ($getarg -eq "listone")
{
    $ListVMOne
}
elseif ($getarg -eq "listtwo") 
{
    $ListVMTwo
}

# If the VM size of interest is listed, run this command

elseif ($getarg -eq "updateone")
{
    $UpdateVMOne
}
elseif ($getarg -eq "updatetwo")
{
    $UpdateVMTwo
}

#If the variable is incorrect, we print an error message to the user

else
{
    Write-Host "The command does not meet the conditions of the script!" -ForegroundColor Red
}