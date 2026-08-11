$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.15.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '520fa8f61a3ee0f4085f9aed9a01986449d33349f462ba7e3ec2b160941310d1a09e60a508389dea1f684938ebcdbd7f1427bd59a35c4f2428c2f0ab57dc7ac6'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
