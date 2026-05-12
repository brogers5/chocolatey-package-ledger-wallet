$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.2.2-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '7ca905a1a0fbc86cf83a195fde5f14c82c0306b0bba3cfabf4c3a8ed34693da1fa451a47b364456c7c54724aeb2f32517ec88e96b0c90adda774a0c23c08fc52'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
