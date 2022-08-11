$configName = "SP2013Media"
Write-Host "$(Get-Date) Defining DSC"
try
{
    Configuration $configName
    {
        param(
        )
    
        Import-DscResource -ModuleName PSDesiredStateConfiguration
        Import-DscResource -ModuleName xPSDesiredStateConfiguration -Name xRemoteFile -ModuleVersion 8.4.0.0
    
        Node $AllNodes.NodeName
        {
    
            xRemoteFile dotNetFx45_Full_setup.exe
            {
                Uri             = "http://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_setup.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\dotNetFx45_Full_setup.exe"
                MatchSource     = $false
            }

            xRemoteFile Windows6.1-KB2506143-x64.msu
            {
                Uri             = "http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu"
                DestinationPath = "c:\install\SP2013\prerequisites\Windows6.1-KB2506143-x64.msu"
                MatchSource     = $false
            }

            xRemoteFile sqlncli.msi
            {
                Uri             = "https://download.microsoft.com/download/2/4/F/24FE862D-7D32-47F2-B91D-22DAFA270BBC/2008%20R2%20ENU-1033/x64/sqlncli.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\sqlncli.msi"
                MatchSource     = $false
            }

            xRemoteFile Windows6.1-KB974405-x64.msu
            {
                Uri             = "http://download.microsoft.com/download/D/7/2/D72FD747-69B6-40B7-875B-C2B40A6B2BDD/Windows6.1-KB974405-x64.msu"
                DestinationPath = "c:\install\SP2013\prerequisites\Windows6.1-KB974405-x64.msu"
                MatchSource     = $false
            }

            xRemoteFile Synchronization.msi
            {
                Uri             = "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\Synchronization.msi"
                MatchSource     = $false
            }

            xRemoteFile WindowsServerAppFabricSetup_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\WindowsServerAppFabricSetup_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile AppFabric1.1-KB2932678-x64-ENU.exe
            {
                Uri             = "http://download.microsoft.com/download/E/D/9/ED9591F8-8720-4EE7-97D0-B6FD29C6D339/AppFabric1.1-KB2932678-x64-ENU.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\AppFabric1.1-KB2932678-x64-ENU.exe"
                MatchSource     = $false
            }

            xRemoteFile MicrosoftIdentityExtensions-64.msi
            {
                Uri             = "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\MicrosoftIdentityExtensions-64.msi"
                MatchSource     = $false
            }

            xRemoteFile setup_msipc_x64.msi
            {
                Uri             = "http://download.microsoft.com/download/9/1/D/91DA8796-BE1D-46AF-8489-663AB7811517/setup_msipc_x64.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\setup_msipc_x64.msi"
                MatchSource     = $false
            }

            xRemoteFile WcfDataServices.exe
            {
                Uri             = "http://download.microsoft.com/download/8/F/9/8F93DBBD-896B-4760-AC81-646F61363A6D/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\WcfDataServices.exe"
                MatchSource     = $false
            }

            xRemoteFile WcfDataServices56.exe
            {
                Uri             = "http://download.microsoft.com/download/1/C/A/1CAA41C7-88B9-42D6-9E11-3C655656DAB1/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\WcfDataServices56.exe"
                MatchSource     = $false
            }

            xRemoteFile en_sharepoint_server_2013_with_sp1_x64_dvd_3823428.iso
            {
                Uri             = "https://aleksstore.blob.core.windows.net/common-assets/en_sharepoint_server_2013_with_sp1_x64_dvd_3823428.iso?sp=r&st=2022-08-09T20:20:06Z&se=2027-12-31T05:20:06Z&spr=https&sv=2021-06-08&sr=b&sig=SAMmmafe78JDbbmeVNcxsv1Ds0emNTs%2FzXsgaX4Bwdw%3D"
                DestinationPath = "c:\install\SP2013\en_sharepoint_server_2013_with_sp1_x64_dvd_3823428_.iso"
                MatchSource     = $false
            }

            xRemoteFile ubersrv2013-kb5002218-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv2013-kb5002218-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2013\2022_June\ubersrv2013-kb5002218-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile ubersrv_1.cab
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv_1.cab"
                DestinationPath = "c:\install\SP2013\2022_June\ubersrv_1.cab"
                MatchSource     = $false
            }

            xRemoteFile ubersrv_2.cab
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv_2.cab"
                DestinationPath = "c:\install\SP2013\2022_June\ubersrv_2.cab"
                MatchSource     = $false
            }

            xRemoteFile ServerLanguagePack_x64_pl-pl.img
            {
                Uri             = "http://download.microsoft.com/download/0/9/D/09D9A656-A4DE-4548-8A54-7BB8F21281E7/ServerLanguagePack_x64_pl-pl.img"
                DestinationPath = "c:\install\SP2013\pl-pl\ServerLanguagePack_x64_pl-pl.img"
                MatchSource     = $false
            }

        }
    }
}
catch
{
    Write-Host "$(Get-Date) Exception in defining DCS:"
    $_.Exception.Message
    Throw $_.Exception.Message;
}
$configurationData = @{ AllNodes = @(
    @{ NodeName = $env:COMPUTERNAME; PSDscAllowPlainTextPassword = $true; PsDscAllowDomainUser = $true }
) }
Write-Host "$(Get-Date) Compiling DSC"
try
{
    &$configName `
        -ConfigurationData $configurationData;
}
catch
{
    Write-Host "$(Get-Date) Exception in compiling DCS:";
    $_.Exception.Message
    Throw $_.Exception.Message;
}
Write-Host "$(Get-Date) Starting DSC"
try
{
    Start-DscConfiguration $configName -Verbose -Wait -Force;
}
catch
{
    Write-Host "$(Get-Date) Exception in starting DCS:"
    $_.Exception.Message
    Throw $_.Exception.Message;
}
if ( $env:VMDEVOPSSTARTER_NODSCTEST -ne "TRUE" )
{
    Write-Host "$(Get-Date) Testing DSC"
    try {
        $result = Test-DscConfiguration $configName -Verbose;
        $inDesiredState = $result.InDesiredState;
        $inDesiredState | % {
            if ( !$_ ) {
                Write-Host "$(Get-Date) Test failed"
                Throw "Test failed"
            }
        }
    }
    catch {
        Write-Host "$(Get-Date) Exception in testing DCS:"
        $_.Exception.Message
        Throw $_.Exception.Message;
    }
} else {
    Write-Host "$(Get-Date) Skipping tests"
}
