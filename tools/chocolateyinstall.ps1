$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.13.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '034668c05d172e5852efc7056a20b4210c95b075366c9e1c2923f12774f24191b68116bf349b67e5c1f791511107653fbef672813c0f870117de9f502d314503'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
