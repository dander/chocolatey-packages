$packageName = 'red'
$url = 'http://static.red-lang.org/dl/win/red-054.exe'
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$redPath = Join-Path $scriptPath 'red.exe'

Get-ChocolateyWebFile $packageName "$redPath" $url
