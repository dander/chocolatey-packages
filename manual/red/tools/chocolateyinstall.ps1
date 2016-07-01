
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'http://static.red-lang.org/dl/win/red-061.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = '0101618ec6971509e117e290b807f471dfb78c57'
  checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
