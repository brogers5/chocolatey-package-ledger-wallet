$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.143.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'edb504d1351117e4308bf74f14c5816d31f40ff94c338b3d95e55afb87e87396c7ceee4e2b3beeec114dd2c22dc7158b292ab1d6bcdb645d5b0ceef443963635'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
