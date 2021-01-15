#RW5qb3kgdGhlIGNvZGU=
function get-publicip
{return (curl ifconfig.me/ip -UseBasicParsing).Content 
}
function get-Konibodns
{
    $OVHUSER = T1ZIVVNFUg=="
    $OVHPASS = "T1ZIVVNFUg=="
     $password = ConvertTo-SecureString $OVHPASS -AsPlainText -Force;
     return New-Object System.Management.Automation.PSCredential ($OVHUSER, $password) 
}
$cred = get-Konibodns
# initialisation des variables

$currentIP = get-publicip
$OVHUSER = "USERNAME_Bob" # to change 
$OVHPASS = "PASSWORD" #// to change
$OVHDYNHOST = "URLexmaple.com" # TO Change

$v=Invoke-WebRequest -uri "https://www.ovh.com/nic/update?myip=$($currentIP)`&hostname=$($OVHDYNHOST)`&system=dyndns" -Method GET -Credential $cred -UseBasicParsing
Write-Output $v
Read-Host -Prompt "Tada" 
