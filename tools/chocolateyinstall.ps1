$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.135.2-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'c5557d46bf12bfe4f5304e31bd088a128454a95c38162e2fd63314ac88ab8c815918d2ce88616f570d1e1370dead79b46976339b5a156ce25679775cb1c6ea6a'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
