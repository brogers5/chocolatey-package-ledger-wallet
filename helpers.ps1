$currentPath = Split-Path -Path $MyInvocation.MyCommand.Definition
$publicKeyFilePath = Join-Path -Path $currentPath -ChildPath 'ledgerwallet.pem'
$checksumFilePath = Join-Path -Path $currentPath -ChildPath 'ledger-wallet-desktop.sha512sum'
$signatureFilePath = Join-Path -Path $currentPath -ChildPath 'ledger-wallet-desktop.sha512sum.sig'

function Update-OpenSSLPublicKey([string] $TagName) {
    $javascriptFile = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/LedgerHQ/ledger-live/$TagName/apps/ledger-live-desktop/src/main/updater/ledger-pubkey.ts" -UseBasicParsing

    $rawPemContents = (Select-String -InputObject $javascriptFile.Content -Pattern '-----BEGIN PUBLIC KEY-----\n.*\n.*\n-----END PUBLIC KEY-----\n').Matches[0].Value
    $processedPemContents = $rawPemContents.Replace('\n', "`n")
    
    Out-File -InputObject $processedPemContents -FilePath $publicKeyFilePath -NoNewline
}

function Update-ChecksumFile([string] $Version) { 
    Invoke-WebRequest -Uri "https://resources.live.ledger.app/public_resources/signatures/ledger-live-desktop-$($Version).sha512sum" -OutFile $checksumFilePath -UseBasicParsing
}

function Update-SignatureFile([string] $Version) {
    Invoke-WebRequest -Uri "https://resources.live.ledger.app/public_resources/signatures/ledger-live-desktop-$($Version).sha512sum.sig" -OutFile $signatureFilePath -UseBasicParsing 
}

function Get-ExpectedChecksum {
    $installerFileNameRegex = 'ledger-live-desktop-(?<version>[\d\.]+)-win(-x64)?\.exe$'
    $rawString = Select-String -Path $checksumFilePath -Pattern $installerFileNameRegex -Raw

    return $rawString.Split(' ')[0]
}

function Confirm-Signature {
    if (!(Get-Command -Name 'openssl.exe' -CommandType Application -ErrorAction SilentlyContinue)) {
        Write-Host 'OpenSSL is not available on PATH, installing...'
        choco install openssl --confirm
        refreshenv
    }

    openssl.exe dgst -sha256 -verify $publicKeyFilePath -signature $signatureFilePath $checksumFilePath
    if ($LASTEXITCODE -ne 0) {
        throw 'Signature verification failed!'
    }
}

