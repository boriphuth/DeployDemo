$ErrorActionPreference = "Stop"

function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

function Get-OctopusWebSiteNameFromConfig($conf) {
    if($conf.Site) {
        if($conf.Site.Application) {
            return $conf.Site.Name + "/" + $conf.Site.Application.Name
        }
        return $conf.Site.Name
    }
    Write-Error "Configuration is missing site"
    exit 1
}

if($configFile -eq $null) {
    $configFile = "Local.Config.ps1"
}

$configFilePath = (Get-ScriptDirectory) + "\$configFile"

$IISConfigurationScriptPath = (Get-ScriptDirectory) + "\IISConfiguration.ps1"
. $IISConfigurationScriptPath

. $configFilePath

CreateAppPools $config.ApplicationPools
CreateSiteFromConfig $config.Site

Set-OctopusVariable -Name "OctopusWebSiteName" -Value (Get-OctopusWebSiteNameFromConfig $config)
