$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.145.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'f29bc2cfe376377b05fc2b67c58e68a8707533b35f06062d3a5177a9d3aec8bec8bbe53541a768e02eff5d9a770ec8ffceb4b2e90abc82b04540a8fb08d88ba7'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
