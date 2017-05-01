
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'http://static.red-lang.org/dl/win/red-062.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = 'AE146E1B3E8EF6F37BB2ED94AC3BA9B23013269A'
  checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
