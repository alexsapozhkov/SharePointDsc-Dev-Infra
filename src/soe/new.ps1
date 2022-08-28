[CmdletBinding()]
param
(
    [Parameter(Mandatory = $false)]
    [String]$ARM_CLIENT_ID,
    [Parameter(Mandatory = $false)]
    [String]$ARM_CLIENT_SECRET,
    [Parameter(Mandatory = $false)]
    [String]$ARM_SUBSCRIPTION_ID,
    [Parameter(Mandatory = $false)]
    [String]$ARM_TENANT_ID,
    [Parameter(Mandatory = $false)]
    [String]$LabName,
    [Parameter(Mandatory = $false)]
    [String]$AzureDefaultLocation = 'West Europe',
    [Parameter(Mandatory = $false)]
    [String]$AdminPassword = 'MySecretPassword!',
    [Parameter(Mandatory = $false)]
    [String]$SPFE1Name = 'SPFE1',
    [Parameter(Mandatory = $false)]
    [String]$SPFE1Size,
    [Parameter(Mandatory = $false)]
    [String]$SPFE1Os,
    [Parameter(Mandatory = $false)]
    [String]$SPFE1StorageSku,
    [Parameter(Mandatory = $false)]
    [String]$GITHUB_RUNNER_URL,
    [Parameter(Mandatory = $false)]
    [String]$GITHUB_RUNNER_TOKEN,
    [Parameter(Mandatory = $false)]
    [String]$GITHUB_RUNNER_LABELS
)

try {
    $securedPassword = ConvertTo-SecureString $ARM_CLIENT_SECRET -AsPlainText -Force;
    $azureCredential = New-Object System.Management.Automation.PSCredential( $ARM_CLIENT_ID, $securedPassword );
    Connect-AzAccount -Credential $azureCredential -ServicePrincipal -TenantId $ARM_TENANT_ID | Out-Null;
    Select-AzSubscription -SubscriptionId $ARM_SUBSCRIPTION_ID;
    
    $env:AUTOMATEDLAB_TELEMETRY_OPTIN = 'true';
    Set-PSFConfig -Module AutomatedLab -Name DoNotPrompt -Value $true;
    
    New-LabDefinition -Name $LabName -DefaultVirtualizationEngine Azure
    Add-LabAzureSubscription -DefaultLocationName $AzureDefaultLocation;
    
    Set-LabInstallationCredential -Username Install -Password $AdminPassword
    
    # SharePoint Machine
    $azureProperties = $null;
    if ($SPFE1Size) {
        if ( $azureProperties -eq $null ) { $azureProperties = @{} }
        $azureProperties.RoleSize = $SPFE1Size}
    if ($SPFE1StorageSku) {
        if ( $azureProperties -eq $null ) { $azureProperties = @{} }
        $azureProperties.StorageSku = $SPFE1StorageSku
    }
    
    #$fePostInstallActivity = @()
    #if ( $SPFE1Os -eq "Windows Server 2012 R2 Datacenter (Server with a GUI)" ) {
    #    $fePostInstallActivity += Get-LabPostInstallationActivity -ScriptFilePath .\src\remote\Set-SchUseStrongCrypto.ps1 -DependencyFolder .\src\remote;
    #}
    
    Add-LabMachineDefinition -Name $SPFE1Name -AzureProperties $azureProperties -OperatingSystem $SPFE1Os -PostInstallationActivity $fePostInstallActivity;
    
    Install-Lab;
    
    if ( $SPFE1Os -eq "Windows Server 2012 R2 Datacenter (Server with a GUI)" ) {
        Invoke-LabCommand -FilePath .\src\remote\Set-SchUseStrongCrypto.ps1 -ComputerName $SPFE1Name -PassThru;
        Invoke-LabCommand -FilePath .\src\remote\Install-Wmf5.ps1 -ComputerName $SPFE1Name -PassThru;
        Sleep 300;
    }
    if ( $SPFE1Os -eq "Windows Server 2016 Datacenter (Desktop Experience)" ) {
        Invoke-LabCommand -FilePath .\src\remote\Set-SchUseStrongCrypto.ps1 -ComputerName $SPFE1Name -PassThru;
    }
    Invoke-LabCommand -FilePath .\src\remote\Install-PackageManagementProviderResource.ps1 -ComputerName $SPFE1Name -PassThru;
    $scriptText = Get-Content .\src\remote\Install-PSModules.ps1 -Raw;
    Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
        catch {
            Write-Host "$(Get-Date) Exception in VM provisioning step:";
            $_.Exception.Message
            Throw $_.Exception.Message;
        }
    } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    if ( $SPFE1Os -eq "Windows Server 2012 R2 Datacenter (Server with a GUI)" ) {
        $scriptText = Get-Content .\src\remote\Download-SP2013.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
        $scriptText = Get-Content .\src\remote\Download-SP2016.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    }
    if ( $SPFE1Os -eq "Windows Server 2016 Datacenter (Desktop Experience)" ) {
        $scriptText = Get-Content .\src\remote\Download-SP2016.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
        $scriptText = Get-Content .\src\remote\Download-SP2019.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    }
    if ( $SPFE1Os -eq "Windows Server 2019 Datacenter (Desktop Experience)" ) {
        $scriptText = Get-Content .\src\remote\Download-SP2016.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
        $scriptText = Get-Content .\src\remote\Download-SP2019.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
        $scriptText = Get-Content .\src\remote\Download-SPSE.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    }
    if ( $SPFE1Os -eq "Windows Server 2019 Datacenter" ) {
        $scriptText = Get-Content .\src\remote\Download-SPSE.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    }
    if ( $SPFE1Os -eq "Windows Server 2022 Datacenter (Desktop Experience)" ) {
        $scriptText = Get-Content .\src\remote\Download-SP2019.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
        $scriptText = Get-Content .\src\remote\Download-SPSE.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    }
    if ( $SPFE1Os -eq "Windows Server 2022 Datacenter" ) {
        $scriptText = Get-Content .\src\remote\Download-SPSE.ps1 -Raw;
        Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
            catch {
                Write-Host "$(Get-Date) Exception in VM provisioning step:";
                $_.Exception.Message
                Throw $_.Exception.Message;
            }
        } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    }
    
    $scriptText = Get-Content .\src\remote\Install-DevTools.ps1 -Raw;
    Invoke-LabCommand -ScriptBlock { param( $scriptText ) try { Invoke-Expression $scriptText }
        catch {
            Write-Host "$(Get-Date) Exception in VM provisioning step:";
            $_.Exception.Message
            Throw $_.Exception.Message;
        }
    } -ComputerName $SPFE1Name -PassThru -ArgumentList $scriptText;
    Invoke-LabCommand -FilePath .\src\remote\Install-PipelineAgent.ps1 -ComputerName $SPFE1Name -PassThru -ArgumentList $GITHUB_RUNNER_URL, $GITHUB_RUNNER_TOKEN, $GITHUB_RUNNER_LABELS;
}
catch {
    Write-Host "$(Get-Date) Exception in lab provisioning:";
    $_.Exception.Message
    Throw $_.Exception.Message;
}
