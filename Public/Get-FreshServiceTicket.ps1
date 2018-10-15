function Get-FreshServiceTicket {
    param(
        $Connection
    )
    $Question = "helpdesk/tickets/filter/all_tickets?format=json&page=1"
    $URL = "$($Connection.FullDomain)/$Question"

    $Data = Invoke-RestMethod -Method Get -Uri $URL -Headers $Connection.HTTPHeaders
    return $Data
}