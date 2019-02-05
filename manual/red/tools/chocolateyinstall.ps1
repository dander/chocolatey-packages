
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'https://static.red-lang.org/dl/win/red-064.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = '45eb8d089b6e25701e4208ac5d1db0c483752e0abff28f58baff5a39f765db9c'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @webFileArgs
