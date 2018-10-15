function Get-FreshServiceUser {
    param(
        $Connection
    )
    $Question = "itil/requesters.json" # ?state=all" # GET example: get all users (limited to first 50)"
    $URL = "$($Connection.FullDomain)/$Question"

    $Data = Invoke-RestMethod -Method Get -Uri $URL -Headers $Connection.HTTPHeaders
    return $Data
}