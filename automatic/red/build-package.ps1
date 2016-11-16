<#
.SYNOPSIS
    Builds a chocolatey package for an auto-generated red executable.

.DESCRIPTION
    Produces a Chocolatey package for Red based on the specified red executable.
    This package includes the checksum of the red executable to satisfy automatic Chocolatey
    package requirements, and retrieves the red.exe from the download location on red-lang.org
    at install time.

.PARAMETER filepath
    The red*.exe file.

.PARAMETER version
    The semantic version to assign to this Chocolatey package. This does not need to
    exactly match the product version number, though a scheme should be chosen to make
    it as clear as possible for users.

    If the version contains a hyphen, that marks it as a pre-release package, which sets
    its priorty just under the base version. Chocolatey will only install a pre-release
    package if the --pre flag is specified.
    
    For example
    0.4.9 < 0.5.0-beta1 < 0.5.0-beta2 < 0.5.0

    See also:
    
    Chocolatey versioning recommendations:
    https://github.com/chocolatey/choco/wiki/CreatePackages#versioning-recommendations
    
    Semver:
    http://semver.org/

.PARAMETER baseUrl
    Specifies the URL for host/path to the download location which the chocolatey package should
    pull from. The filename will be appended to this location.

    If unspecified, 'http://static.red-lang.org/dl/win/' will be used.

.EXAMPLE
    PS> build-package.ps1 -filepath red-16nov16-f638d45.exe -version 0.6.2-alpha-161116

.EXAMPLE
    PS> build-package.ps1 -filepath red-16nov16-f638d45.exe -version 1.0.445-alpha
#>

param (
    [Parameter(Mandatory=$True)]
    [string] $filepath,

    [Parameter(Mandatory=$True)]
    [string] $version,

    [string] $baseUrl = 'http://static.red-lang.org/dl/win/'
)

$file = Get-Item $filepath

$chocolateyInstallTemplate = @"
`$scriptPath = "`$(Split-Path -parent `$MyInvocation.MyCommand.Definition)"

`$webFileArgs = @{
    packageName = 'red'
    url = '$(-Join ($baseUrl, $file.Name))'
    fileFullPath = Join-Path `$scriptPath 'red.exe'
    checksum = '$($(Get-FileHash $file -Algorithm sha1).Hash)'
    checksumType = 'sha1'
}

Get-ChocolateyWebFile @webFileArgs
"@

Write-Output $chocolateyInstallTemplate | Out-File -FilePath tools\chocolateyinstall.ps1

choco pack red.nuspec --version $version