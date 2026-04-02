$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.0.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '794f577711caf6389788adff8ddf04f70be593c753cb37fa0a3094c20064ce713b25ccafbfdd536514f0e0a6b8cbf429c39f4e64358b07faf84c025c052bff4c'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
