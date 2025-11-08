Import-Module au
Import-Module PowerShellForGitHub
Import-Module FXPSYaml

$currentPath = (Split-Path $MyInvocation.MyCommand.Definition)
. $currentPath\helpers.ps1

$owner = 'LedgerHQ'
$repository = 'ledger-live'

function global:au_BeforeUpdate($Package) {
    #Verify the integrity of the binary, following these instructions:
    #https://www.ledger.com/ledger-live/lld-signatures

    #Confirm integrity of the published checksums file
    Update-OpenSSLPublicKey -TagName $Latest.TagName
    Update-ChecksumFile -Version $Latest.SoftwareVersion
    Update-SignatureFile -Version $Latest.SoftwareVersion
    Confirm-Signature

    #Confirm integrity of installer binary
    $expectedChecksum = Get-ExpectedChecksum
    if ($Latest.Checksum64 -ne $expectedChecksum) {
        throw "Published checksums are not consistent!`n
        Checksum File: $expectedChecksum
        Latest Version Info: $($Latest.Checksum64)"
    }

    Set-DescriptionFromReadme -Package $Package -ReadmePath '.\DESCRIPTION.md'
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1'   = @{
            '(^[$]?\s*url64bit\s*=\s*)(''.*'')'   = "`$1'$($Latest.Url64)'"
            '(^[$]?\s*checksum64\s*=\s*)(''.*'')' = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            '(<packageSourceUrl>)[^<]*(</packageSourceUrl>)' = "`$1https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)`$2"
            '(<projectSourceUrl>)[^<]*(</projectSourceUrl>)' = "`$1https://github.com/$owner/$repository/tree/$($Latest.TagName)`$2"
            '(\*\*Release Notes:\*\* ).*$'                   = "`$1https://github.com/$owner/$repository/blob/$($Latest.TagName)/apps/ledger-live-desktop/RELEASE_NOTES.md"
            '(\*\*Full Changelog:\*\* ).*$'                  = "`$1https://github.com/$owner/$repository/releases/tag/$($Latest.TagName)"
            '(<copyright>)[^<]*(</copyright>)'               = "`$1Copyright © $(Get-Date -Format yyyy) Ledger Wallet Team`$2"
        }
    }
}

function global:au_GetLatest {
    $userAgent = 'Update checker of Chocolatey Community Package ''ledger-wallet'''
    $latestVersionInfoUri = 'https://download.live.ledger.com/latest-win.yml'

    $tempFilePath = New-TemporaryFile
    Invoke-WebRequest -Uri $latestVersionInfoUri -UserAgent $userAgent -Method Get -OutFile $tempFilePath
    $latestVersionInfo = ConvertFrom-Yaml -Path $tempFilePath
    Remove-Item $tempFilePath -Force

    #FXPSYaml may deserialize version as a DateTime object if it contains a non-zero patch number.
    #Unfortunately, this is due to Ledger not abiding by the YAML specification.
    #YAML documents should include a type tag (specifically, "!!str") if a value can be ambiguously interpreted.
    #As I do not have control over the contents of this document, working around it by keying off the interpreted type.
    $interpretedType = $latestVersionInfo.version.GetType()
    if ($interpretedType -eq [DateTime]) {
        $servedVersion = $latestVersionInfo.version.ToString('M.yyy.d')
    }
    else {
        $servedVersion = $latestVersionInfo.version
    }

    $checksumBytes = [System.Convert]::FromBase64String($latestVersionInfo.sha512) 
    $checksumString = ($checksumBytes | ForEach-Object ToString x2) -join ''

    $releases = Get-GitHubRelease -OwnerName $owner -RepositoryName $repository
    $latestRelease = $releases | Where-Object { $_.tag_name -match '@ledgerhq/live-desktop@\d\.(\d){1,3}\.\d' } | Select-Object -First 1
    $actualLatestVersion = [version] $latestRelease.tag_name.Substring(23)

    if ([version] $servedVersion -lt $actualLatestVersion) {
        Write-Warning "A newer tag for Ledger Wallet Desktop was found (v$actualLatestVersion), but this build has not been published yet!"
    }

    return @{
        Checksum64      = $checksumString
        SoftwareVersion = $servedVersion
        TagName         = "%40ledgerhq/live-desktop%40$servedVersion"
        Url64           = "https://download.live.ledger.com/$($latestVersionInfo.path)"
        Version         = $servedVersion #This may change if building a package fix version
    }
}

Update-Package -ChecksumFor None -NoReadme
