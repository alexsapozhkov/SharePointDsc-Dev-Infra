$configName = "SP2019Media"
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
    
            xRemoteFile sqlncli.msi
            {
                Uri             = "https://download.microsoft.com/download/F/3/C/F3C64941-22A0-47E9-BC9B-1A19B4CA3E88/ENU/x64/sqlncli.msi"
                DestinationPath = "c:\install\SP2019\prerequisites\sqlncli.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '3F48F58DCF9855B4C0F7C23C946A67AE0800ABD2E561216EB60E623B61A30FE1'
            }

            xRemoteFile Synchronization.msi
            {
                Uri             = "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi"
                DestinationPath = "c:\install\SP2019\prerequisites\Synchronization.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '89FB4B9C4EB4ECF0900851AE232B1173AFEAEB0714FBCC027FAE8CEDEE6E1FA2'
            }

            xRemoteFile WindowsServerAppFabricSetup_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\WindowsServerAppFabricSetup_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'B87FD42E2DCA96E9EA4BE6483F93918F42F73F218CF9E3C2340A4902B666EE51'
            }

            xRemoteFile MicrosoftIdentityExtensions-64.msi
            {
                Uri             = "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi"
                DestinationPath = "c:\install\SP2019\prerequisites\MicrosoftIdentityExtensions-64.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '775AF844A832FB3B7A478B89880B7F09FAAC4772A029E7D55681A7E7EBB2270F'
            }

            xRemoteFile setup_msipc_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/3/C/F/3CF781F5-7D29-4035-9265-C34FF2369FA2/setup_msipc_x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\setup_msipc_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '7FFC61D4474AB26A23A22299A00CAB1D9BC03F9101BFB097C256EADCE33F88A7'
            }

            xRemoteFile WcfDataServices.exe
            {
                Uri             = "http://download.microsoft.com/download/1/C/A/1CAA41C7-88B9-42D6-9E11-3C655656DAB1/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\WcfDataServices.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'FC6213C0A417BA3E3ABCEDC458BE625A5C1B4D060A99B1188DC3AE9AD33B0F71'
            }

            xRemoteFile vcredist_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\vcredist_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '681BE3E5BA9FD3DA02C09D7E565ADFA078640ED66A0D58583EFAD2C1E3CC4064'
            }

            xRemoteFile AppFabric-KB3092423-x64-ENU.exe
            {
                Uri             = "https://download.microsoft.com/download/F/1/0/F1093AF6-E797-4CA8-A9F6-FC50024B385C/AppFabric-KB3092423-x64-ENU.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\AppFabric-KB3092423-x64-ENU.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '19D6D9D49CCF381FDC57010BAA6050A244A5DE0EF6F2E004138403C8447BB5D5'
            }

            xRemoteFile ndp472-kb4054530-x86-x64-allos-enu.exe
            {
                Uri             = "https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/089f837de42708daacaae7c04b7494db/ndp472-kb4054530-x86-x64-allos-enu.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\ndp472-kb4054530-x86-x64-allos-enu.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '5CB624B97F9FD6D3895644C52231C9471CD88AACB57D6E198D3024A1839139F6'
            }

            xRemoteFile VC_redist.x64.exe
            {
                Uri             = "https://download.visualstudio.microsoft.com/download/pr/11687625/2cd2dba5748dc95950a5c42c2d2d78e4/VC_redist.x64.exe"
                DestinationPath = "c:\install\SP2019\prerequisites\VC_redist.x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '8279ECA69E6F6F5228ECB0B874119D8A8C808BDFFAA54B4B250827DD4BDDCF5E'
            }

            xRemoteFile officeserver.img
            {
                Uri             = "https://download.microsoft.com/download/C/B/A/CBA01793-1C8A-4671-BE0D-38C9E5BBD0E9/officeserver.img"
                DestinationPath = "c:\install\SP2019\officeserver.img"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '4266D29ADFE7E5B5F5C6298325721E495361961D5B4978E3A46AE6657E601C5A'
            }

            xRemoteFile sts2019-kb5002229-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/4/f/7/4f71a6bf-ca0d-418d-9288-950198f836e2/sts2019-kb5002229-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2019\2022_July\sts2019-kb5002229-fullfile-x64-glb.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'FD6595ABE55748B0FB1462342D54ED2C3F2C8D1DC292B024FF0E16ED5A30ADAA'
            }

            xRemoteFile wssloc2019-kb5002230-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/a/1/6/a163cec4-9e54-4c0b-8a94-71eaf547cd88/wssloc2019-kb5002230-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2019\2022_July\wssloc2019-kb5002230-fullfile-x64-glb.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '5429BDD184A6D90CF170A25C4AA4D6CA0B5F1045DE9AE4BF9E37EF64F702D0C1'
            }

            xRemoteFile serverlanguagepack.exe
            {
                Uri             = "https://download.microsoft.com/download/B/A/6/BA64C1B5-0CFD-4925-84BA-2A1C24FCE21F/serverlanguagepack.exe"
                DestinationPath = "c:\install\SP2019\pl-pl\serverlanguagepack.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '47C5A2DAFF605833A539BF03F97215C25E9D136E32398758787D09A9A009F5A4'
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
