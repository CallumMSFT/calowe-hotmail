# Authentication  
Write-Output ""
Write-Output "------------------------ Authentication ------------------------"
Write-Output "Logging in to Azure ..."

$connectionName = "AzureRunAsConnection"

# Get the connection "AzureRunAsConnection "
$servicePrincipalConnection = Get-AutomationConnection -Name $connectionName         

$null = Add-AzureRmAccount `
  -ServicePrincipal `
  -TenantId $servicePrincipalConnection.TenantId `
  -ApplicationId $servicePrincipalConnection.ApplicationId `
  -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint

Write-Output "Successfully logged in to Azure." 

# create our new Azure Resource Group
Write-Output ""
Write-Output "------------------------ Creating resource group ------------------------"
New-AzureRmResourceGroup -Name "techhui" -Location "Southeast Asia"
  
# create a new deployment by calling the arm template and parameters file off GitHub
Write-Output ""
Write-Output "------------------------ Creating deployment ------------------------"
New-AzureRmResourceGroupDeployment `
  -Name "techhui" `
  -ResourceGroupName "techhui" `
  -TemplateUri https://raw.githubusercontent.com/CallumMSFT/calowe-hotmail/master/azuredeploy.json  `
  -TemplateParameterUri https://raw.githubusercontent.com/CallumMSFT/calowe-hotmail/master/azuredeploy.parameters.json



