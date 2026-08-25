$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.17.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '7b75af56c9afb9a84ddd83af0d6515c202f96ccb7967b31ebb0c5651f72cf1dda4a69596873f16d89ca0404359d67c7b1c557e5a3e2a9c5b5d59dede19d40062'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
