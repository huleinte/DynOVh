$file={
  function get-publicip
{return (curl ifconfig.me/ip -UseBasicParsing).Content 
}
function get-Konibodns
{
    $OVHUSER = "T1ZIVVNFUg=="
    $OVHPASS = "T1ZIUEFTUw=="
     $password = ConvertTo-SecureString $OVHPASS -AsPlainText -Force;
     return New-Object System.Management.Automation.PSCredential ($OVHUSER, $password) 
}
$cred = get-Konibodns
# initialisation des variables

$currentIP = get-publicip
$OVHUSER = "T1ZIVVNFUg==o"
$OVHPASS = "T1ZIUEFTUw=="
$OVHDYNHOST = "T1ZIVVNFUg=="

$v=Invoke-WebRequest -uri "https://www.ovh.com/nic/update?myip=$($currentIP)`&hostname=$($OVHDYNHOST)`&system=dyndns" -Method GET -Credential $cred -UseBasicParsing
Write-Output $v
Read-Host -Prompt "voila" 
}

if((Test-Path -Path "c:/automatisation")  -eq $false) {mkdir "c:/automatisation" }
Set-Content -Value $file -Path "c:/automatisation/dynsovh.ps1" 

$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -File c:/automatisation/dynsovh.ps1"'

$trigger =  New-ScheduledTaskTrigger -Daily -At 9am 

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "dyns ovh updater" -Description "Your friend morning ovh update"



