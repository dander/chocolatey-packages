
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'http://static.red-lang.org/dl/win/red-062.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = '0D3E2A581F7A3F2309447064FEE30C620390FBCA'
  checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
