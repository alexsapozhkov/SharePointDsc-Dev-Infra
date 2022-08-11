$configName = "SP2016Media"
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
    
            xRemoteFile NDP46-KB3045557-x86-x64-AllOS-ENU.exe
            {
                Uri             = "https://download.microsoft.com/download/C/3/A/C3A5200B-D33C-47E9-9D70-2F7C65DAAD94/NDP46-KB3045557-x86-x64-AllOS-ENU.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\NDP46-KB3045557-x86-x64-AllOS-ENU.exe"
                MatchSource     = $false
            }

            xRemoteFile sqlncli.msi
            {
                Uri             = "https://download.microsoft.com/download/F/3/C/F3C64941-22A0-47E9-BC9B-1A19B4CA3E88/ENU/x64/sqlncli.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\sqlncli.msi"
                MatchSource     = $false
            }

            xRemoteFile msodbcsql.msi
            {
                Uri             = "https://download.microsoft.com/download/5/7/2/57249A3A-19D6-4901-ACCE-80924ABEB267/ENU/x64/msodbcsql.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\msodbcsql.msi"
                MatchSource     = $false
            }

            xRemoteFile Synchronization.msi
            {
                Uri             = "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\Synchronization.msi"
                MatchSource     = $false
            }

            xRemoteFile MicrosoftIdentityExtensions-64.msi
            {
                Uri             = "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\MicrosoftIdentityExtensions-64.msi"
                MatchSource     = $false
            }

            xRemoteFile setup_msipc_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/3/C/F/3CF781F5-7D29-4035-9265-C34FF2369FA2/setup_msipc_x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\setup_msipc_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile WcfDataServices.exe
            {
                Uri             = "http://download.microsoft.com/download/1/C/A/1CAA41C7-88B9-42D6-9E11-3C655656DAB1/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\WcfDataServices.exe"
                MatchSource     = $false
            }

            xRemoteFile WindowsServerAppFabricSetup_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\WindowsServerAppFabricSetup_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile AppFabric-KB3092423-x64-ENU.exe
            {
                Uri             = "https://download.microsoft.com/download/F/1/0/F1093AF6-E797-4CA8-A9F6-FC50024B385C/AppFabric-KB3092423-x64-ENU.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\AppFabric-KB3092423-x64-ENU.exe"
                MatchSource     = $false
            }

            xRemoteFile vcredist_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\vcredist_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile vc_redist.x64.exe
            {
                Uri             = "http://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\vc_redist.x64.exe"
                MatchSource     = $false
            }

            xRemoteFile officeserver.img
            {
                Uri             = "https://download.microsoft.com/download/0/0/4/004EE264-7043-45BF-99E3-3F74ECAE13E5/officeserver.img"
                DestinationPath = "c:\install\SP2016\officeserver.img"
                MatchSource     = $false
            }

            xRemoteFile ubersrv2013-kb5002218-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv2013-kb5002218-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2016\2022_June\ubersrv2013-kb5002218-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile sts2016-kb5002231-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/4/c/1/4c18db79-6e6d-4f9c-82ec-0071e37941fc/sts2016-kb5002231-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2016\2022_July\sts2016-kb5002231-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile wssloc2016-kb5002118-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/c/d/c/cdc66551-193f-4786-843f-c37e522c5025/wssloc2016-kb5002118-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2016\2022_July\wssloc2016-kb5002118-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile serverlanguagepack.exe
            {
                Uri             = "https://download.microsoft.com/download/8/1/5/815F32DD-D203-49FE-882B-11AA29A60321/serverlanguagepack.exe"
                DestinationPath = "c:\install\SP2016\pl-pl\serverlanguagepack.exe"
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
