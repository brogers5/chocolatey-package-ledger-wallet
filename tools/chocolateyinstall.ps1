$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.4.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '1c9b9d6ed3299c19f90eb94e957bda85839ea492a7b4692fbd50cb698ad867aac0d19920bbc056c97d42228bb734cf51eba28a9d4b261bd3c3b2d7f1d20445b0'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
