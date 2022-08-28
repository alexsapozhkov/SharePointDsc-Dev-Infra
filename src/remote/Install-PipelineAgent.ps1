param(
    $githubRunnerUrl,
    $githubRunnerToken,
    $githubRunnerLabels
)

if ($githubRunnerUrl -and $githubRunnerToken) {
    try
    {
        mkdir c:\actions-runner; cd c:\actions-runner
        $ProgressPreference = 'SilentlyContinue';
        Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.294.0/actions-runner-win-x64-2.294.0.zip -OutFile actions-runner-win-x64-2.294.0.zip
        if((Get-FileHash -Path actions-runner-win-x64-2.294.0.zip -Algorithm SHA256).Hash.ToUpper() -ne '22295b3078f7303ffb5ded4894188d85747b1b1a3d88a3eac4d0d076a2f62caa'.ToUpper()){ throw 'Computed checksum did not match' }
        Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.294.0.zip", "$PWD")
        ./config.cmd --url $githubRunnerUrl --token $githubRunnerToken --name (New-Guid).Guid --labels $githubRunnerLabels --unattended --runasservice
    }
    catch
    {
        Write-Host "$(Get-Date) Exception in the script:"
        $_.Exception.Message
        Throw $_.Exception.Message;
    }
    
}
