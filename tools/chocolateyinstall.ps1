$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.13.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'ec7b55ef5851fd8a15f474e58d8f4f67e45cdab5af2fe9e8bf74d38344e08109b8006199faf7e41a5442bd02ccedff8ed353d9441c4f18ef226b8c22f0299431'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
