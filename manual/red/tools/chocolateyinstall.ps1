
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'http://static.red-lang.org/dl/win/red-060.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = 'a4b45da7c037480e49175df261fc2fa61ef2ab02'
  checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
