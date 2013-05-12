function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$doConfigPath = (Get-ScriptDirectory) + "\DeployScripts\" + "DoConfig.ps1"
. $doConfigPath