try
{
    Write-Host "$( Get-Date ) Install-PackageProvider -Name NuGet -Force -RequiredVersion 2.8.5.201"
    Install-PackageProvider -Name NuGet -Force -RequiredVersion 2.8.5.201;
    Write-Host "$( Get-Date ) Install-Module -Name PackageManagementProviderResource -Force -RequiredVersion 1.0.3"
    Install-Module -Name PackageManagementProviderResource -Force -RequiredVersion 1.0.3;
}
catch
{
    Write-Host "$(Get-Date) Exception in the script:"
    $_.Exception.Message
    Throw $_.Exception.Message;
}
