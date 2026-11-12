$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.28.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '417d2c7886c3d0fd51c69736f0392a2b8c26856671bbb2a535a0c56aa01d4372ff252c39f34ebd056ebee0d8634bc88500a6cd83ffe361eaefc50aabae4bab46'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
