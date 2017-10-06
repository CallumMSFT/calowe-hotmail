 # create our new Azure Resource Group
  New-AzureRmResourceGroup -Name "techhui" -Location "Southeast Asia"
  
  # create a new deployment by calling the arm template and parameters file off GitHub
  New-AzureRmResourceGroupDeployment `
    -Name techhui `
    -ResourceGroupName techhui `
    -TemplateUri https://raw.githubusercontent.com/CallumMSFT/calowe-hotmail/master/azuredeploy.json  `
    -TemplateParameterUri https://raw.githubusercontent.com/CallumMSFT/calowe-hotmail/master/azuredeploy.parameters.json 
    