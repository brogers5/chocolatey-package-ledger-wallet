$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.139.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '5d8f2ca0a3b39766f6d066c85b52a94477d858c42e2e15a4640253fb184ce63ab17de862b2506d5a15a44170e33cabed8a813cc8ce4dc85e16a5dadd7ff9299c'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
