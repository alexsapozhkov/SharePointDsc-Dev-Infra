# Development infrastructure for https://github.com/dsccommunity/SharePointDsc

This code is for preparing infrastructure for you, when you contribute to https://github.com/dsccommunity/SharePointDsc. It is also used for creating CI environments for the aforementioned project.

## Standard Operating Environment

When you want to debug/test only SPInstallPrereqs, SPInstall, SPInstallLanguagePack, SPProductUpdate and SPDocIcon resources, you only need VMs without AD domain. For preparing them, you need to run with parameters `./src/soe/new.ps1`:

In Windows 10:

```powershell
Install-Module -Name Az -RequiredVersion 8.2.0 -Force;
Install-Module -Name AutomatedLabUnattended -RequiredVersion 5.43.0 -Force;
Install-Module -Name AutomatedLabDefinition -RequiredVersion 5.43.0 -Force;
Install-Module -Name AutomatedLabNotifications -RequiredVersion 5.43.0 -Force;
Install-Module -Name AutomatedLabTest -RequiredVersion 5.43.0 -Force;
Install-Module -Name AutomatedLabWorker -RequiredVersion 5.43.0 -Force;
Install-Module -Name AutomatedLab -RequiredVersion 5.43.0 -Force -SkipPublisherCheck -AllowClobber;
Uninstall-Module -Name AutomatedLabUnattended -RequiredVersion 5.44.0 -Force;
Uninstall-Module -Name AutomatedLabDefinition -RequiredVersion 5.44.0 -Force;
Uninstall-Module -Name AutomatedLabNotifications -RequiredVersion 5.44.0 -Force;
Uninstall-Module -Name AutomatedLabTest -RequiredVersion 5.44.0 -Force;
Uninstall-Module -Name AutomatedLabWorker -RequiredVersion 5.44.0 -Force;
$env:AUTOMATEDLAB_TELEMETRY_OPTIN = 'true';
Enable-LabHostRemoting -Force;
```

```powershell
./src/soe/new.ps1 `
    -ARM_CLIENT_ID $env:ARM_CLIENT_ID `
    -ARM_CLIENT_SECRET $env:ARM_CLIENT_SECRET `
    -ARM_SUBSCRIPTION_ID $env:ARM_SUBSCRIPTION_ID `
    -ARM_TENANT_ID $env:ARM_TENANT_ID `
    -LabName SharePointDscDev83 `
    -AdminPassword Somepass1 `
    -SPFE1Name swazspfe00 `
    -SPFE1Size Standard_D2s_v3 `
    -SPFE1Os "Windows Server 2012 R2 Datacenter (Server with a GUI)" `
    -SPFE1StorageSku Standard_LRS `
    -GITHUB_RUNNER_URL $env:GITHUB_RUNNER_URL `
    -GITHUB_RUNNER_TOKEN $env:GITHUB_RUNNER_TOKEN `
    -GITHUB_RUNNER_LABELS SOE-DEV
Connect-LabVM swazspfe00
```

https://github.com/AutomatedLab/AutomatedLab/blob/develop/LabXml/Machines/OperatingSystem.cs

- SharePoint Server 2013

  - Windows Server 2008 R2 Datacenter (Full Installation)
    - Not available in Azure
  - Windows Server 2012 Datacenter (Server with a GUI)
    - Not available in Azure

- SharePoint Server 2013 with SP1

  - Windows Server 2008 R2 Datacenter (Full Installation)
    - Not available in Azure
  - Windows Server 2012 Datacenter (Server with a GUI)
    - Not available in Azure
  - Windows Server 2012 R2 Datacenter (Server with a GUI)

- SharePoint Server 2016

  - Windows Server 2012 R2 Datacenter (Server with a GUI)
  - Windows Server 2016 Datacenter (Desktop Experience)
  - Windows Server 2019 Datacenter (Desktop Experience)

- SharePoint Server 2019

  - Windows Server 2016 Datacenter (Desktop Experience)
  - Windows Server 2019 Datacenter (Desktop Experience)
  - Windows Server 2022 Datacenter (Desktop Experience)

- SharePoint Server Subscription Edition

  - Windows Server 2019 Datacenter
  - Windows Server 2019 Datacenter (Desktop Experience)
  - Windows Server 2022 Datacenter
  - Windows Server 2022 Datacenter (Desktop Experience)

## Clear the Azure Resource Group

```powershell
./src/clear.ps1 `
    -ARM_CLIENT_ID $env:ARM_CLIENT_ID `
    -ARM_CLIENT_SECRET $env:ARM_CLIENT_SECRET `
    -ARM_SUBSCRIPTION_ID $env:ARM_SUBSCRIPTION_ID `
    -ARM_TENANT_ID $env:ARM_TENANT_ID `
    -LabName SharePointDscDev39
```

## Remove the Azure Resource Group

In dev Container:

```powershell
./src/remove.ps1 `
    -ARM_CLIENT_ID $env:ARM_CLIENT_ID `
    -ARM_CLIENT_SECRET $env:ARM_CLIENT_SECRET `
    -ARM_SUBSCRIPTION_ID $env:ARM_SUBSCRIPTION_ID `
    -ARM_TENANT_ID $env:ARM_TENANT_ID `
    -LabName SharePointDscDev39
```

In a Linux Docker container:

```
docker run --rm -it -v $(pwd):/workspaces/SharePointDsc-Dev-Infra -w /workspaces/SharePointDsc-Dev-Infra mcr.microsoft.com/azure-powershell:8.2.0-alpine-3.14
```

```powershell
./src/remove.ps1 `
    -ARM_CLIENT_ID $env:ARM_CLIENT_ID `
    -ARM_CLIENT_SECRET $env:ARM_CLIENT_SECRET `
    -ARM_SUBSCRIPTION_ID $env:ARM_SUBSCRIPTION_ID `
    -ARM_TENANT_ID $env:ARM_TENANT_ID `
    -LabName SharePointDscDev39
```

In Windows 10:

```powershell
Install-Module -Name Az -RequiredVersion 8.2.0 -Force;
```

```powershell
./src/remove.ps1 `
    -ARM_CLIENT_ID $env:ARM_CLIENT_ID `
    -ARM_CLIENT_SECRET $env:ARM_CLIENT_SECRET `
    -ARM_SUBSCRIPTION_ID $env:ARM_SUBSCRIPTION_ID `
    -ARM_TENANT_ID $env:ARM_TENANT_ID `
    -LabName SharePointDscDev39
```
