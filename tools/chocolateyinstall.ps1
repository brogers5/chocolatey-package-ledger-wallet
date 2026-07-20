$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.11.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '19249082ecbd9af0596cb98f91cdd6e0353d655c89574fc4bdbb0cb32ce185c1ccb3a2171e1ef23d4cb772f577d7c90e736a4701e233de67e45b6c5e189f1b85'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
