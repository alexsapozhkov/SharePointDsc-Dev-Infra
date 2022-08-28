$configName = "SP2016Media"
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
    
            xRemoteFile NDP46-KB3045557-x86-x64-AllOS-ENU.exe
            {
                Uri             = "https://download.microsoft.com/download/C/3/A/C3A5200B-D33C-47E9-9D70-2F7C65DAAD94/NDP46-KB3045557-x86-x64-AllOS-ENU.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\NDP46-KB3045557-x86-x64-AllOS-ENU.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'B21D33135E67E3486B154B11F7961D8E1CFD7A603267FB60FEBB4A6FEAB5CF87'
            }

            xRemoteFile sqlncli.msi
            {
                Uri             = "https://download.microsoft.com/download/F/3/C/F3C64941-22A0-47E9-BC9B-1A19B4CA3E88/ENU/x64/sqlncli.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\sqlncli.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '3F48F58DCF9855B4C0F7C23C946A67AE0800ABD2E561216EB60E623B61A30FE1'
            }

            xRemoteFile msodbcsql.msi
            {
                Uri             = "https://download.microsoft.com/download/5/7/2/57249A3A-19D6-4901-ACCE-80924ABEB267/ENU/x64/msodbcsql.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\msodbcsql.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '9F21AF4BD88C25FA4C4A8763EB81C1A5F92AF20CBF2F2391A2293DA2BCA90CDF'
            }

            xRemoteFile Synchronization.msi
            {
                Uri             = "http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\Synchronization.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '89FB4B9C4EB4ECF0900851AE232B1173AFEAEB0714FBCC027FAE8CEDEE6E1FA2'
            }

            xRemoteFile MicrosoftIdentityExtensions-64.msi
            {
                Uri             = "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi"
                DestinationPath = "c:\install\SP2016\prerequisites\MicrosoftIdentityExtensions-64.msi"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '775AF844A832FB3B7A478B89880B7F09FAAC4772A029E7D55681A7E7EBB2270F'
            }

            xRemoteFile setup_msipc_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/3/C/F/3CF781F5-7D29-4035-9265-C34FF2369FA2/setup_msipc_x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\setup_msipc_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '7FFC61D4474AB26A23A22299A00CAB1D9BC03F9101BFB097C256EADCE33F88A7'
            }

            xRemoteFile WcfDataServices.exe
            {
                Uri             = "http://download.microsoft.com/download/1/C/A/1CAA41C7-88B9-42D6-9E11-3C655656DAB1/WcfDataServices.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\WcfDataServices.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'FC6213C0A417BA3E3ABCEDC458BE625A5C1B4D060A99B1188DC3AE9AD33B0F71'
            }

            xRemoteFile WindowsServerAppFabricSetup_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\WindowsServerAppFabricSetup_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'B87FD42E2DCA96E9EA4BE6483F93918F42F73F218CF9E3C2340A4902B666EE51'
            }

            xRemoteFile AppFabric-KB3092423-x64-ENU.exe
            {
                Uri             = "https://download.microsoft.com/download/F/1/0/F1093AF6-E797-4CA8-A9F6-FC50024B385C/AppFabric-KB3092423-x64-ENU.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\AppFabric-KB3092423-x64-ENU.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '19D6D9D49CCF381FDC57010BAA6050A244A5DE0EF6F2E004138403C8447BB5D5'
            }

            xRemoteFile vcredist_x64.exe
            {
                Uri             = "http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\vcredist_x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '681BE3E5BA9FD3DA02C09D7E565ADFA078640ED66A0D58583EFAD2C1E3CC4064'
            }

            xRemoteFile vc_redist.x64.exe
            {
                Uri             = "http://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe"
                DestinationPath = "c:\install\SP2016\prerequisites\vc_redist.x64.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '5EEA714E1F22F1875C1CB7B1738B0C0B1F02AEC5ECB95F0FDB1C5171C6CD93A3'
            }

            xRemoteFile officeserver.img
            {
                Uri             = "https://download.microsoft.com/download/0/0/4/004EE264-7043-45BF-99E3-3F74ECAE13E5/officeserver.img"
                DestinationPath = "c:\install\SP2016\officeserver.img"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '480802AD1373687EC80881B8CFA9F9174D60F63982E4854860D8C4085768F372'
            }

            xRemoteFile sts2016-kb5002231-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/4/c/1/4c18db79-6e6d-4f9c-82ec-0071e37941fc/sts2016-kb5002231-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2016\2022_July\sts2016-kb5002231-fullfile-x64-glb.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = 'FD58DCD7EFB78EA7B01407356AB70DA806EBEA2E6F6AE8E75AC75FF8F8DE4868'
            }

            xRemoteFile wssloc2016-kb5002118-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/c/d/c/cdc66551-193f-4786-843f-c37e522c5025/wssloc2016-kb5002118-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SP2016\2022_July\wssloc2016-kb5002118-fullfile-x64-glb.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '788296A1FEBCE2C2ACCD9E1095EE888F65E56C09364F0977AE9047073F5D6ECA'
            }

            xRemoteFile serverlanguagepack.exe
            {
                Uri             = "https://download.microsoft.com/download/8/1/5/815F32DD-D203-49FE-882B-11AA29A60321/serverlanguagepack.exe"
                DestinationPath = "c:\install\SP2016\pl-pl\serverlanguagepack.exe"
                MatchSource     = $false
                ChecksumType    = 'SHA256'
                Checksum        = '0A5E8FB196100D88F8CA427EC8B0F203A6D8EF21D017CD987A9A92F52B41DED5'
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
