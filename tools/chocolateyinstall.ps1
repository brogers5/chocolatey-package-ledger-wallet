$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.21.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '22723728122f5ff123f10ac2ad16e7ea338e1ac5db1490a79a79d0e1489443a0f49bd3b1555aa42a70ecd08f8c370e23844bf720ef55f52c9632b5c5893b060a'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
