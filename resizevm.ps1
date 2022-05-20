# This is the script to resize the VM specified in the ARM templates in the template folder
# Our resource group is already predefined in the CAFFortmu blueprint
# When running this script, change the $VMName to the correct VM name

$ResourceGroup = "FortmuLtd-VNet-rg"
$VMOne = "FortmuVM1"
#$VMTwo = "FortmuVM2"

##Standard_D2as_v4 <- Standard size with deployment
##Standard_D4as_v4 <- Works

# Run the below list commands in the terminal

#$ListVMOne = Get-AzVMSize -ResourceGroupName $ResourceGroup -VMName $VMOne
#$ListVMTwo = Get-AzVMSize -ResourceGroupName $ResourceGroup -VMName $VMTwo

#Use the resizevm pipeline to run the update commands

$VM = Get-AzVM -ResourceGroupName $ResourceGroup -VMName $VMOne
$VM.HardwareProfile.VmSize = "Standard_D4as_v4"
$UpdateVMOne = Update-AzVM -VM $VM -ResourceGroupName $ResourceGroup
$UpdateVMOne

#$VM = Get-AzVM -ResourceGroupName $ResourceGroup -VMName $VMTwo
#$VM.HardwareProfile.VmSize = "<vm-size>"
#$UpdateVMTwo = Update-AzVM -VM $VM -ResourceGroupName $ResourceGroup
#$UpdateVMTwo
