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
$env:AUTOMATEDLAB_TELEMETRY_OPTIN = 'true';
Enable-LabHostRemoting -Force;
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force;