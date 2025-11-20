$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.133.0-win-x64.exe'
  softwareName   = 'Ledger Wallet *'
  checksum64     = '50b429635ccbb4a6efe5b8e76ee19e0e509431542ad2b55fdda6ec2e5fe864a0928db1249cda3f5e8045baa6a8c7a0c2aa2e399cdd9bfcab199020b557092115'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
