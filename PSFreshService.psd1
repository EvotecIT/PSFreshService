﻿@{
    AliasesToExport      = @()
    Author               = 'Przemyslaw Klys'
    CmdletsToExport      = @()
    CompanyName          = 'Evotec'
    CompatiblePSEditions = @('Desktop', 'Core')
    Copyright            = '(c) 2011 - 2022 Przemyslaw Klys @ Evotec. All rights reserved.'
    Description          = 'Module covering functions that are shared within multiple projects'
    FunctionsToExport    = @('Get-FreshServiceTicket', 'Get-FreshServiceUser', 'New-FreshServiceConnection')
    GUID                 = 'd56f6761-f4c3-4282-88db-1ee22e671302'
    ModuleVersion        = '0.0.2'
    PowerShellVersion    = '5.1'
    PrivateData          = @{
        PSData = @{
            Tags       = @('Windows', 'MacOS', 'Linux', 'Shared', 'Useful', 'Email', 'Format', 'Azure', 'ActiveDirectory')
            ProjectUri = 'https://github.com/EvotecIT/PSFreshService'
        }
    }
    RootModule           = 'PSFreshService.psm1'
}