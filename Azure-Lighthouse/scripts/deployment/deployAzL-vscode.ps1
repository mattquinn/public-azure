Write-Host 'Sign in using an account on the Customer Tenant' -ForegroundColor Green

Connect-AzAccount

<# 
    Download the Policy ARM Template Files to your machine and
    update the paths below as required 
#>

# [ File locations on Windows - update these paths as required ]
$windowtemplatefile = "<FILE PATH>\DelegatedResourceManagement.json"
$windowstemplateparameterfile = "<FILE PATH>\DelegatedResourceManagement.parameters.json"

# [ File locations on Linux - update these paths as required ]
$linuxtemplatefile = "<FILE PATH>/DelegatedResourceManagement.json"
$linuxtemplateparameterfile = "<FILE PATH>/DelegatedResourceManagement.parameters.json"

Write-Host 'Setting target Subscription' -ForegroundColor Green

<# 
    I wanted to test against a single subscription, so specified the Subscription name
    If you don't know the Subscription name, then run the command first and then
    update the Subscription Name here as appropriate
    
    Also update the Deployment Name and Location as appropriate
#>

$mySub = Get-AzSubscription -SubscriptionName '<TARGET SUBSCRIPTION NAME>'
$DeploymentName = 'Lighthouse'                     
$location = 'northeurope'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
Set-AzContext -Subscription $mysub.SubscriptionId

# [ Update the variables below to reflect Windows or Linux locations ]
Write-Host 'Enable Lighthouse Connection' -ForegroundColor Green
New-AzDeployment -Name $DeploymentName -Location $location `
    -TemplateFile $linuxtemplatefile `
    -TemplateParameterFile $linuxtemplateparameterfile `
    -Verbose