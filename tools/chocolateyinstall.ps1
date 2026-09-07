$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.19.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'fa4c21e6b9168f067b814099e0d5ef0b5d56baabc187a1abcc72587e597443de06ba81d6cc549fde185a8d14b2731f4c454c60261f2035b6bb27670ba872af5e'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
