# Set up a dev machine for debugging SharePoint-Dev-Infra code

If you want a separate VM from which you want to administer labs, run in Windows PS:

```powershell
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force;
Install-Module -Name Az -RequiredVersion 8.2.0 -Force;
$latestAutomatedLabVersion = ( Find-Module AutomatedLab ).Version;
$requiredAutomatedLabVersion = "5.45.0";
Install-Module -Name AutomatedLab -RequiredVersion $requiredAutomatedLabVersion -Force -SkipPublisherCheck -AllowClobber;
if ( $requiredAutomatedLabVersion -ne $latestAutomatedLabVersion ) {
    "AutomatedLabDefinition", "AutomatedLabNotifications", "AutomatedLabTest", "AutomatedLabWorker", "AutomatedLabUnattended" | % {
        Install-Module -Name $_ -RequiredVersion $requiredAutomatedLabVersion -Force;
        Uninstall-Module -Name $_ -RequiredVersion $latestAutomatedLabVersion -Force;
    }
}
Get-Module AutomatedLab* -ListAvailable;

$securedPassword = ConvertTo-SecureString $env:ARM_CLIENT_SECRET -AsPlainText -Force;
$azureCredential = New-Object System.Management.Automation.PSCredential( $env:ARM_CLIENT_ID, $securedPassword );
Connect-AzAccount -Credential $azureCredential -ServicePrincipal -TenantId $env:ARM_TENANT_ID | Out-Null;
Select-AzSubscription -SubscriptionId $env:ARM_SUBSCRIPTION_ID;

$env:AUTOMATEDLAB_TELEMETRY_OPTIN = 'true';
Set-PSFConfig -Module AutomatedLab -Name DoNotPrompt -Value $true;

New-LabDefinition -Name AutomatedLabWorkplace06 -DefaultVirtualizationEngine Azure
Add-LabAzureSubscription -DefaultLocationName 'West Europe';

Set-LabInstallationCredential -Username Install -Password Somepass1

$azureProperties = @{
    RoleSize    = "Standard_D2s_v3"
    StorageSku  = "Standard_LRS"
}
Add-LabMachineDefinition -Name swazal00 -AzureProperties $azureProperties -OperatingSystem "Windows 11 Pro";

Install-Lab
Invoke-LabCommand -FilePath .\contribute\Install-PackageManagementProviderResource.ps1 -ComputerName swazal00 -PassThru;
$scriptText = Get-Content .\contribute\Install-PSModules.ps1 -Raw;
Invoke-LabCommand -ScriptBlock { param( $scriptText ) Invoke-Expression $scriptText } -ComputerName swazal00 -PassThru -ArgumentList $scriptText;
$scriptText = Get-Content .\contribute\Install-DevTools.ps1 -Raw;
Invoke-LabCommand -ScriptBlock { param( $scriptText ) Invoke-Expression $scriptText } -ComputerName swazal00 -PassThru -ArgumentList $scriptText;
Invoke-LabCommand -FilePath .\contribute\Install-AutomatedLab.ps1 -ComputerName swazal00 -PassThru;
Connect-LabVM swazal00
```

```powershell
git clone https://github.com/alexsapozhkov/SharePointDsc-Dev-Infra c:\projects\SharePointDsc-Dev-Infra
cd c:\projects\SharePointDsc-Dev-Infra
code .
```