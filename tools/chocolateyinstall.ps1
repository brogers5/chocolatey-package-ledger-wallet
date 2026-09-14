$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.19.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '17efe8b80134542c4c68b1fabd0c5ec5fe35c96dfb8bdf62e244709c6fe6575cdeda82a767d8c110c8eb1d1ccc416de8cdea90cfa6886c3beb1aaf81de3a4d84'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
