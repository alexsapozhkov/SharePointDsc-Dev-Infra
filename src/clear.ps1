[CmdletBinding()]
param
(
    [Parameter(Mandatory = $false)]
    [String]$ARM_CLIENT_ID,
    [Parameter(Mandatory = $false)]
    [String]$ARM_CLIENT_SECRET,
    [Parameter(Mandatory = $false)]
    [String]$ARM_SUBSCRIPTION_ID,
    [Parameter(Mandatory = $false)]
    [String]$ARM_TENANT_ID,
    [Parameter(Mandatory = $false)]
    [String]$LabName
)

$securedPassword = ConvertTo-SecureString $ARM_CLIENT_SECRET -AsPlainText -Force;
$azureCredential = New-Object System.Management.Automation.PSCredential( $ARM_CLIENT_ID, $securedPassword );
Connect-AzAccount -Credential $azureCredential -ServicePrincipal -TenantId $ARM_TENANT_ID | Out-Null;
Select-AzSubscription -SubscriptionId $ARM_SUBSCRIPTION_ID;

if ( Get-AzResourceGroup $LabName -ErrorAction SilentlyContinue ) {
    Write-Host "Found the resource group called `"$LabName`", now removing";
    New-AzResourceGroupDeployment -ResourceGroupName $LabName -Mode Complete -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/100-blank-template/azuredeploy.json -Force -Verbose -DeploymentDebugLogLevel All | Out-Null;
} else {
    Write-Host "Resource group called `"$LabName`" is not found";
}