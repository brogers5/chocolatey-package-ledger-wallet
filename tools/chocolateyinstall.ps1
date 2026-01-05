$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.135.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '25116ad31cf2968ad02c3cac561fe31170b0894f22e85bdf433fcbf7befca9c937348af61f8f69757512292a1b562fb08f8b28b3726bba27778c796456356783'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
