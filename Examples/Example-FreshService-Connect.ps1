Import-Module PSFreshService -Force

$Domain = 'yourdomain' # just part of it
$APIKey = ''

$Connection = New-FreshServiceConnection -Domain $Domain -APIKey $APIKey

$Users = Get-FreshServiceUser -Connection $Connection
$Tickets = Get-FreshServiceTicket -Connection $Connection


$Users | Format-Table -AutoSize
$Tickets | Format-Table -AutoSize