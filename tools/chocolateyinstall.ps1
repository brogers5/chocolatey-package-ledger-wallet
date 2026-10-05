$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.23.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'a168d9364ec2b0dd452037d35835a3a7ed5d3957cecad82004f9e45b85480b6472d9980f5221505324800a5fec9e55b526ac5f4431ab0d51e061b753409890c2'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
