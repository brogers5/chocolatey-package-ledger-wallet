$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.139.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'fe17e98c419b81cf8ac55f06065832463319d7419135120efe8ac6cff185c781362a86d2b5679b619ff0d836c4c497528356be7484930dce6d1375416f99bfbb'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
