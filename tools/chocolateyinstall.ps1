$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.24.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '8ac9b4604a53b6dea86cf9c6079f034607c8acd7a8d71933bf4a4419a7d966c4616db8f39a89e114a143e7d61a8096b0b070b27650bb3c1e61647570f6c58e8e'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
