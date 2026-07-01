$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.10.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '8ea511e15dc28bdbcf8c266d383df9c77c329c3bf5324788abeaef4399e62b3ed2d7cf6a496093ac4a3d752449948549f92a19724a0967e6979545fc43a35193'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
