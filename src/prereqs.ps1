Install-Module -Name Az -RequiredVersion 8.2.0 -Force;
$requiredAutomatedLabVersion = "5.45.0";
Install-Module -Name AutomatedLab -RequiredVersion $requiredAutomatedLabVersion -Force -SkipPublisherCheck -AllowClobber;
"AutomatedLab", "AutomatedLabDefinition", "AutomatedLabNotifications", "AutomatedLabTest", "AutomatedLabWorker", "AutomatedLabUnattended" | % {
    Install-Module -Name $_ -RequiredVersion $requiredAutomatedLabVersion -Force;
    Get-Module $_ -ListAvailable | ? { $_.Version -ne $requiredAutomatedLabVersion } | % {
        Uninstall-Module -Name $_.Name -RequiredVersion $_.Version -Force;
    }
}
Get-Module AutomatedLab* -ListAvailable;
$env:AUTOMATEDLAB_TELEMETRY_OPTIN = 'true';
Enable-LabHostRemoting -Force;
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force;