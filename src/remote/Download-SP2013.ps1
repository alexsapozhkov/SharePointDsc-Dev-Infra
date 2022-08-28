$configName = "SP2013Media"
Write-Host "$(Get-Date) Defining DSC"
try
{
    Configuration $configName
    {
        param(
        )
    
        Import-DscResource -ModuleName PSDesiredStateConfiguration
        Import-DscResource -ModuleName xPSDesiredStateConfiguration -Name xRemoteFile -ModuleVersion 9.1.0
    
        Node $AllNodes.NodeName
        {
    
            xRemoteFile dotNetFx45_Full_setup.exe
            {
                Uri             = "http://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_setup.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\dotNetFx45_Full_setup.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'E434828818F81E6E1F5955E84CAEC08662BD154A80B24A71A2EDA530D8B2F66A'
            }

            xRemoteFile Windows6.1-KB2506143-x64.msu
            {
                Uri             = "http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu"
                DestinationPath = "c:\install\SP2013\prerequisites\Windows6.1-KB2506143-x64.msu"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '8A8E35FA0E613FCC54644B8336D7DABBE5C6B57A1895E9CAAC2D0065746D1F8D'
            }

            xRemoteFile sqlncli.msi
            {
                Uri             = "https://download.microsoft.com/download/2/4/F/24FE862D-7D32-47F2-B91D-22DAFA270BBC/2008%20R2%20ENU-1033/x64/sqlncli.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\sqlncli.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '8222BEBD63C2C79BDF0BFBCB614D43806799891D9348FF8DA7DF8F458A7F8BC6'
            }

            xRemoteFile Windows6.1-KB974405-x64.msu
            {
                Uri             = "http://download.microsoft.com/download/D/7/2/D72FD747-69B6-40B7-875B-C2B40A6B2BDD/Windows6.1-KB974405-x64.msu"
                DestinationPath = "c:\install\SP2013\prerequisites\Windows6.1-KB974405-x64.msu"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '7B6F6D6E4500B8F81107591DE06E2945A7CF07D72D0881D237F90C433801096C'
            }

            xRemoteFile Synchronization.msi
            {
                Uri             = "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\Synchronization.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '89FB4B9C4EB4ECF0900851AE232B1173AFEAEB0714FBCC027FAE8CEDEE6E1FA2'
            }

            xRemoteFile WindowsServerAppFabricSetup_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\WindowsServerAppFabricSetup_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'B87FD42E2DCA96E9EA4BE6483F93918F42F73F218CF9E3C2340A4902B666EE51'
            }

            xRemoteFile AppFabric1.1-KB2932678-x64-ENU.exe
            {
                Uri             = "http://download.microsoft.com/download/E/D/9/ED9591F8-8720-4EE7-97D0-B6FD29C6D339/AppFabric1.1-KB2932678-x64-ENU.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\AppFabric1.1-KB2932678-x64-ENU.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '1CCEC0234317C716E7F49050E6D517773EB03954CC49E6A1C7EE6F9F126E9EF4'
            }

            xRemoteFile MicrosoftIdentityExtensions-64.msi
            {
                Uri             = "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\MicrosoftIdentityExtensions-64.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '775AF844A832FB3B7A478B89880B7F09FAAC4772A029E7D55681A7E7EBB2270F'
            }

            xRemoteFile setup_msipc_x64.msi
            {
                Uri             = "http://download.microsoft.com/download/9/1/D/91DA8796-BE1D-46AF-8489-663AB7811517/setup_msipc_x64.msi"
                DestinationPath = "c:\install\SP2013\prerequisites\setup_msipc_x64.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '08184D64A5BAFA940BC3BD01A14DC5A7BA9E981D40F96D3CC5569B48A8D44CD3'
            }

            xRemoteFile WcfDataServices.exe
            {
                Uri             = "http://download.microsoft.com/download/8/F/9/8F93DBBD-896B-4760-AC81-646F61363A6D/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\WcfDataServices.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '0796127DB7618A71B87B3972FE4FA5126AAB2F7F2BD0C4AC22D31726ACF3245C'
            }

            xRemoteFile WcfDataServices56.exe
            {
                Uri             = "http://download.microsoft.com/download/1/C/A/1CAA41C7-88B9-42D6-9E11-3C655656DAB1/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2013\prerequisites\WcfDataServices56.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'FC6213C0A417BA3E3ABCEDC458BE625A5C1B4D060A99B1188DC3AE9AD33B0F71'
            }

            xRemoteFile en_sharepoint_server_2013_with_sp1_x64_dvd_3823428.iso
            {
                Uri             = "https://aleksstore.blob.core.windows.net/common-assets/en_sharepoint_server_2013_with_sp1_x64_dvd_3823428.iso?sp=r&st=2022-08-09T20:20:06Z&se=2027-12-31T05:20:06Z&spr=https&sv=2021-06-08&sr=b&sig=SAMmmafe78JDbbmeVNcxsv1Ds0emNTs%2FzXsgaX4Bwdw%3D"
                DestinationPath = "c:\install\SP2013\en_sharepoint_server_2013_with_sp1_x64_dvd_3823428_.iso"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '816F3F0D32F393B7738945B78826F53D1F97EE0877E9E68E8D57AD40AC3588E5'
            }

            xRemoteFile ubersrv2013-kb5002218-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv2013-kb5002218-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2013\2022_June\ubersrv2013-kb5002218-fullfile-x64-glb.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'AA1C20352388A22338BCDF32DE63A57F00736FBE760D784FA30DA0669169A79C'
            }

            xRemoteFile ubersrv_1.cab
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv_1.cab"
                DestinationPath = "c:\install\SP2013\2022_June\ubersrv_1.cab"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '3CFE0235669B4BE648681EE93478D2A023A776A1E6A665598B81C2976A74FD8B'
            }

            xRemoteFile ubersrv_2.cab
            {
                Uri             = "https://download.microsoft.com/download/d/c/7/dc758c30-2e8b-4b80-8e5b-21253852ed1e/ubersrv_2.cab"
                DestinationPath = "c:\install\SP2013\2022_June\ubersrv_2.cab"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'FDC3D34A6FFD6DD23D7EDDC2CC9B11B7DC61DD6360375722FA1108A8BB2FC4F3'
            }

            xRemoteFile ServerLanguagePack_x64_pl-pl.img
            {
                Uri             = "http://download.microsoft.com/download/0/9/D/09D9A656-A4DE-4548-8A54-7BB8F21281E7/ServerLanguagePack_x64_pl-pl.img"
                DestinationPath = "c:\install\SP2013\pl-pl\ServerLanguagePack_x64_pl-pl.img"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '5E4FFC6638871609DCBB6522C3F5FDF81537A21B3A10C59E3143B3BF880A8612'
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
