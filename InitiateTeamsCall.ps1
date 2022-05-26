#requires -version 1
<#
.SYNOPSIS
  Initiate Teams Call
.DESCRIPTION
  Initiate Teams Call
.PARAMETER <Parameter_Name>
    None
.INPUTS
  None
.OUTPUTS
  Application Log
.NOTES
  Version:        1.0
  Author:         Richard B
  Creation Date:  18/05/2022 (UK FORMAT)
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>## 

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version
$sScriptVersion = '1.0'
$RequireScriptVersion = '1.0'

# Powershell Version

$versionMinimum = '5.0'

#----------------------------------------------------------[Script]----------------------------------------------------------#Set Powershell Execution Policy
#Set Powershell Execution Policy
try { Set-ExecutionPolicy Unrestricted }
catch {
    Write-Host "An error occured:"
    Write-Host $_
    }

# Register New Log Source
try { New-EventLog -LogName Application -Source 'LabScript' }
catch {
    Write-Host "An error occured:"
    Write-Host $_
    }

# Check Meets Requirements of Powershell and Script Version
if ($versionMinimum -gt $PSVersionTable.PSVersion -AND $sScriptVersion -eq $RequireScriptVersion) 
{
    # Check PowerShell Version and Script Version
    

    Write-EventLog -LogName Application -Source 'LabScript' -EntryType Information -EventId 1 -Message "Powershell Version $versionMinimum installed"
}
else
{
    Write-EventLog -LogName Application -Source 'LabScript' -EntryType Information -EventId 1 -Message "Powershell Version $versionMinimum Not available"
}
# Microsoft Teams desktop application needs to installed and logged in
# Change <emailID> to email address of caller in the contacts
$callerid = <emailID>
start callto:$callerid
Start-Sleep -s 5
$wshell = New-Object -ComObject wscript.shell;
$wshell.SendKeys('~')