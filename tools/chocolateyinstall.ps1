$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.26.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '6eaca2d1e5c9dd748dff0391e81a477699283be4070338964a3587bdae86e2a0f46f9122fd0c6b7bc3377a2f8ff6def6ebe06ffdff23a4bc29ec754c0e07936b'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
