$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.6.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '02211df61e16a83de5c6ad90121dedb4d157d91cee069d7c80a4ffd043d8ed1d8bba7953e05bac7195aec49609d7529732f77f38ce254736b0b005b6d535e01f'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
