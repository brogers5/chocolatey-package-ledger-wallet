$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.132.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = 'e9f48cca7f317aa9d462607290b692c477a67fbf3be5f210e20541b5d860fd80d706e7a1aeecd4853a4702f67f1b740e18f75bb762fa306042a65e1a34ba7d4a'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
