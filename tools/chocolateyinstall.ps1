$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.21.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '9c599e8f2311a7877af630ede52a2c50980816354df2d3b1d28e21ff16175b26655f31b248f7ac720e88daea4b527ccaae550332eb3105ce5e503a893edb4f2f'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
