$configName = "SPSEMedia"
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
    
            xRemoteFile ndp48-x86-x64-allos-enu.exe
            {
                Uri             = "https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe"
                DestinationPath = "c:\install\SPSE\prerequisites\ndp48-x86-x64-allos-enu.exe"
                MatchSource     = $false
            }

            xRemoteFile VC_redist.x64.exe
            {
                Uri             = "https://download.visualstudio.microsoft.com/download/pr/d3cbdace-2bb8-4dc5-a326-2c1c0f1ad5ae/9B9DD72C27AB1DB081DE56BB7B73BEE9A00F60D14ED8E6FDE45DAB3E619B5F04/VC_redist.x64.exe"
                DestinationPath = "c:\install\SPSE\prerequisites\VC_redist.x64.exe"
                MatchSource     = $false
            }

            xRemoteFile officeserver.img
            {
                Uri             = "https://download.microsoft.com/download/3/f/5/3f5f8a7e-462b-41ff-a5b2-04bdf5821ceb/OfficeServer.iso"
                DestinationPath = "c:\install\SPSE\officeserver.img"
                MatchSource     = $false
            }

            xRemoteFile sts-subscription-kb5002234-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/2/d/a/2dad7602-6194-4314-b615-7627fa07ac11/sts-subscription-kb5002234-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SPSE\2022_July\sts-subscription-kb5002234-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile wssloc-subscription-kb5002225-fullfile-x64-glb.exe
            {
                Uri             = "https://download.microsoft.com/download/d/c/8/dc8bd05e-97db-4be2-9745-78712cffc584/wssloc-subscription-kb5002225-fullfile-x64-glb.exe"
                DestinationPath = "c:\install\SPSE\2022_July\wssloc-subscription-kb5002225-fullfile-x64-glb.exe"
                MatchSource     = $false
            }

            xRemoteFile serverlanguagepack.exe
            {
                Uri             = "https://download.microsoft.com/download/f/d/e/fdea2e9e-cd3c-4c19-943f-c371745b223f/ServerLanguagePack.iso"
                DestinationPath = "c:\install\SPSE\pl-pl\serverlanguagepack.exe"
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
