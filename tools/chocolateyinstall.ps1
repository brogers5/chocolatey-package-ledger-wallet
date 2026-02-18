$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.141.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'ef70f89e64c07b83100e990de643f70900f69e25a2b5ae72d79376cd67f2431385ed7d26c88b243fc7b1dbc88a8a6a5fb79ec352645ea845a5d0238a856742b0'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
