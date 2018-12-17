<#
.SYNOPSIS
Opens Dash (https://kapeli.com/dash) and searches for the specified text.

.DESCRIPTION
Opens Dash (https://kapeli.com/dash) and searches for the specified text. You can specify a specific docset to filter results

.PARAMETER Query
The text you want to search for.

.PARAMETER docset
The docset you want to filter by - ex. github

.EXAMPLE
# If you have the .NET docset installed, this will open Dash and search for System.IO in the .NET docset
Invoke-DashSearch -Query System.IO -Docset net

.NOTES
You need to install Dash to use this module. Install it here: https://kapeli.com/dash
#>
function Invoke-DashSearch {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]
        $Query,
        [Parameter()]
        [string]
        $Docset
    )
    if ($Docset) { $str = "$($Docset):$($Query)" } else { $str = $Query }
    open "dash://$str"
}
New-Alias -Name dash -Value Invoke-DashSearch
