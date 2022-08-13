$configName = "SP2019Media"
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
    
            xRemoteFile sqlncli.msi
            {
                Uri             = "https://download.microsoft.com/download/F/3/C/F3C64941-22A0-47E9-BC9B-1A19B4CA3E88/ENU/x64/sqlncli.msi"
                DestinationPath = "c:\install\SP2019\prerequisites\sqlncli.msi"
                MatchSource     = $false
            }

            xRemoteFile Synchronization.msi
            {
                Uri             = "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi"
                DestinationPath = "c:\install\SP2019\prerequisites\Synchronization.msi"
                MatchSource     = $false
            }

            xRemoteFile WindowsServerAppFabricSetup_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\WindowsServerAppFabricSetup_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile MicrosoftIdentityExtensions-64.msi
            {
                Uri             = "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi"
                DestinationPath = "c:\install\SP2019\prerequisites\MicrosoftIdentityExtensions-64.msi"
                MatchSource     = $false
            }

            xRemoteFile setup_msipc_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/3/C/F/3CF781F5-7D29-4035-9265-C34FF2369FA2/setup_msipc_x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\setup_msipc_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile WcfDataServices.exe
            {
                Uri             = "http://download.microsoft.com/download/1/C/A/1CAA41C7-88B9-42D6-9E11-3C655656DAB1/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\WcfDataServices.exe"
                MatchSource     = $false
            }

            xRemoteFile vcredist_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\vcredist_x64.exe"
                MatchSource     = $false
            }

            xRemoteFile AppFabric-KB3092423-x64-ENU.exe
            {
                Uri             = "https://download.microsoft.com/download/F/1/0/F1093AF6-E797-4CA8-A9F6-FC50024B385C/AppFabric-KB3092423-x64-ENU.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\AppFabric-KB3092423-x64-ENU.exe"
                MatchSource     = $false
            }

            xRemoteFile ndp472-kb4054530-x86-x64-allos-enu.exe
            {
                Uri             = "https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/089f837de42708daacaae7c04b7494db/ndp472-kb4054530-x86-x64-allos-enu.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\ndp472-kb4054530-x86-x64-allos-enu.exe"
                MatchSource     = $false
            }

            xRemoteFile VC_redist.x64.exe
            {
                Uri             = "https://download.visualstudio.microsoft.com/download/pr/11687625/2cd2dba5748dc95950a5c42c2d2d78e4/VC_redist.x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\VC_redist.x64.exe"
                MatchSource     = $false
            }

            xRemoteFile officeserver.img
            {
                Uri             = "https://download.microsoft.com/download/C/B/A/CBA01793-1C8A-4671-BE0D-38C9E5BBD0E9/officeserver.img"
                DestinationPath = "c:\install\SP2019\officeserver.img"
                MatchSource     = $false
            }

            xRemoteFile sts2019-kb5002229-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/4/f/7/4f71a6bf-ca0d-418d-9288-950198f836e2/sts2019-kb5002229-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2019\2022_July\sts2019-kb5002229-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile wssloc2019-kb5002230-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/a/1/6/a163cec4-9e54-4c0b-8a94-71eaf547cd88/wssloc2019-kb5002230-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2019\2022_July\wssloc2019-kb5002230-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile serverlanguagepack.exe
            {
                Uri             = "https://download.microsoft.com/download/B/A/6/BA64C1B5-0CFD-4925-84BA-2A1C24FCE21F/serverlanguagepack.exe"
                DestinationPath = "c:\install\SP2019\pl-pl\serverlanguagepack.exe"
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
