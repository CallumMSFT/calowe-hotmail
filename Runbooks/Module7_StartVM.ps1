workflow Module7_StartVM
{
    Param (
    # spurious comment
    # cray-cray comment
	
    # get the name of the VM you are to start
    [Parameter(Mandatory)] $VMName = "e.g. calowe1210 (without the quotes)",

    # and the cloud service that contains your VM
    [Parameter(Mandatory)] $VMServiceName  = "e.g. calowe1210 (without the quotes)"
    )
    
    # first, we need a user who has access to your Azure
    $Credential = Get-AutomationPSCredential –Name 'autoaccount‘

    # second, we need to connect to your Azure
    Add-AzureAccount –Credential $Credential

    # third, start the VM
    Start-AzureVM –Name $VMName –ServiceName $VMServiceName

}
