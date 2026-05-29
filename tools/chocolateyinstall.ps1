$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.6.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '5c4c6befa48e484b1d93bb4519e3b5062483ad79d8c4d3106e13dfefc68cccac9405ec7803dd48cc60c2d7efb3cfabb94bb9bfc2d07b14669901f6c55b22fd72'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
