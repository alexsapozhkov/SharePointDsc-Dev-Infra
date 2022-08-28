try
{
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319 -Name SchUseStrongCrypto -Value 1 -Type DWord;
    #[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls";
}
catch
{
    Write-Host "$(Get-Date) Exception in the script:"
    $_.Exception.Message
    Throw $_.Exception.Message;
}
