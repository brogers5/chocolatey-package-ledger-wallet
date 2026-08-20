$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.17.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'bd894887429b1b83adc752be96097d970cea552f88534f7dc210ba05ca09c2191996654cfbd0b8ef5a8daed0ca355f40b3073efde0281ab181f32666a83866b1'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
