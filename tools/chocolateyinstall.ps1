$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.24.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '654886b537b59ddda47c120b63e6057fb45170d79dd905f3629f5af0f6e8c597c50a9f0bacdbd25647e29b3de97938cf5ca7fccb182bf38f898451fe72a916d3'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
