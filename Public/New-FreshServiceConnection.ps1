function New-FreshServiceConnection {
    param(
        [string] $Domain,
        [string] $APIKey
    )
    $Connection = @{}
    $EncodedCredentials = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $APIKey, $null)))
    $HTTPHeaders = @{}
    $HTTPHeaders.Add('Authorization', ("Basic {0}" -f $EncodedCredentials))
    $HTTPHeaders.Add('Content-Type', 'application/json')

    $Connection.HTTPHeaders = $HTTPHeaders
    $Connection.Domain = $Domain
    $Connection.FullDomain = "https://$Domain.freshservice.com"
    return $Connection
}