$ErrorActionPreference = "Stop"

function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$configFile = "Dev.Config.ps1"
$configFilePath = (Get-ScriptDirectory) + "\$configFile"

$IISConfigurationScriptPath = (Get-ScriptDirectory) + "\IISConfiguration.ps1"
. $IISConfigurationScriptPath

. $configFilePath

CreateAppPools $config.ApplicationPools
CreateSiteFromConfig $config.Site