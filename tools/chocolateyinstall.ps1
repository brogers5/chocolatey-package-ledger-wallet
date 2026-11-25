$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-4.30.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '2a9c6a0a36d643802b318729a902cb392521ecd473f7859dacdab437f679f5f5a1dfba12c9b1c956aa505efcff903ecc45771490731a5e1bc78d6289ae682d38'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
