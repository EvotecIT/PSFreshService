function Get-FreshServiceUser {
    [CmdletBinding(DefaultParameterSetName = 'Count')]
    param(
        $Connection,
        [Parameter(ParameterSetName = 'Count')][nullable[int]] $Count = 50,
        [Parameter(ParameterSetName = 'All')] [switch] $All
    )
    Begin {
        switch ($PsCmdlet.ParameterSetName) {
            'All' { $Count = $null; break}
            'Count' { break }
        }
    }
    Process {
        [int] $PageCount = 1
        [Array] $Feed = $null
        while ($True) {
            $Question = "itil/requesters.json/?page=$PageCount" ##?state=all" # GET example: get all users (limited to first 50)"

            [System.Uri] $URL = "$($Connection.FullDomain)/$Question"
            #Write-Verbose "Get-FreshServiceUser - Url: $URL"

            $Output = Invoke-RestMethod -Method Get -Uri $URL -Headers $Connection.HTTPHeaders
            Write-Verbose "Get-FreshServiceUser - Output Count: $($Output.Count)"
            if ($Output.Count -eq 0) {
                break;
            } else {
                $Feed += $Output.User
            }
            Write-Verbose "Get-FreshServiceUser - Total Count: $($Feed.Count), Expected Count: $Count"

            if ($All) {

            } elseif ($Count) {
                if ($Feed.Count -ge $Count) {
                    break
                }
            } else {
                # Shouldn't happen really
                break
            }

            $PageCount++
        }
    }
    End {
        if ($All) {
            return $Feed
        } else {
            return $Feed | Select-Object -First $Count
        }
    }
}