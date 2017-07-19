
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'http://static.red-lang.org/dl/win/red-063.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = '5F3614D833AA3C2BC9D0CAEFC532A2A6247CD20D'
  checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
