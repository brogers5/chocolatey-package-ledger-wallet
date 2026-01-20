$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.137.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '4163e1e013d3771aeaa8ecff175ae78294802315786e7a801c07ec667cc2b7fb8bc0c9e3eec3e27709630c9432d8c5fd76f761321c32a039c3d296e6e4c61bc7'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
