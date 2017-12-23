
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$webFileArgs = @{
  packageName = 'red'
  url = 'http://static.red-lang.org/dl/win/red-063.exe'
  fileFullPath = Join-Path $scriptPath 'red.exe'
  checksum = 'BC5540AF782F489643E6A993FB7419CEA1C31EF4'
  checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
