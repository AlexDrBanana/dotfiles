function Install-ProfileModule {
    param(
        [Parameter(Mandatory)]
        [string] $Name
    )

    if (Get-Module -ListAvailable -Name $Name) {
        return $true
    }

    if (-not (Get-Command Install-Module -ErrorAction SilentlyContinue)) {
        Write-Warning "Install-Module is not available; cannot install PowerShell module '$Name'."
        return $false
    }

    try {
        Install-Module -Name $Name -Scope CurrentUser -Repository PSGallery -Force -AllowClobber -ErrorAction Stop
        return $true
    } catch {
        Write-Warning "Failed to install PowerShell module '$Name': $($_.Exception.Message)"
        return $false
    }
}

function Import-ProfileModule {
    param(
        [Parameter(Mandatory)]
        [string] $Name
    )

    if (Install-ProfileModule -Name $Name) {
        try {
            Import-Module $Name -ErrorAction Stop
        } catch {
            Write-Warning "Failed to import PowerShell module '$Name': $($_.Exception.Message)"
        }
    }
}

function Install-WingetCommand {
    param(
        [Parameter(Mandatory)]
        [string] $CommandName,

        [Parameter(Mandatory)]
        [string] $PackageId
    )

    if (Get-Command $CommandName -ErrorAction SilentlyContinue) {
        return $true
    }

    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Warning "winget is not available; cannot install '$PackageId'."
        return $false
    }

    winget install --id $PackageId --exact --source winget --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "winget failed to install '$PackageId'."
        return $false
    }

    return [bool](Get-Command $CommandName -ErrorAction SilentlyContinue)
}

Import-ProfileModule -Name Terminal-Icons
Import-ProfileModule -Name posh-git

Install-WingetCommand -CommandName fzf -PackageId junegunn.fzf | Out-Null
if (Get-Command fzf -ErrorAction SilentlyContinue) {
    Import-ProfileModule -Name PSFzf
}

Install-WingetCommand -CommandName oh-my-posh -PackageId JanDeDobbeleer.OhMyPosh | Out-Null
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/paradox.omp.json" | Invoke-Expression
}

if (Install-ProfileModule -Name PSReadLine) {
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView
}
