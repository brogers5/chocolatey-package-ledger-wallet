$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.26.1-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'a1063dced0e174375f6e79dfcc7bf3667683aa9b2bdc9a7d3419b0ce87c3e9ca636eab3c3cca6d5bf181538474dd9b02a91a49b0354a9af71ad0deff1f1de863'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
