$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.8.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '9554759f74b22a268aeda8defa9eca078de4fd2be09c99f0adb9f516c048420c76f41de4837fcf0d2fcce104d314a46e39b4fc16341af7eb6ce28c309e49cf6f'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
