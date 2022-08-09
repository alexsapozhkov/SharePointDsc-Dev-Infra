# Development infrastructure for https://github.com/dsccommunity/SharePointDsc

This code is for preparing infrastructure for you, when you contribute to https://github.com/dsccommunity/SharePointDsc. It is also used for creating CI environments for the aforementioned project.

## Remove the Azure Resource Group

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
