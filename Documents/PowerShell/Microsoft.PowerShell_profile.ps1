if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Repository PSGallery -Force
}
Import-Module Terminal-Icons

if (-not (Get-Module -ListAvailable -Name posh-git)) {
    Install-Module -Name posh-git -Scope CurrentUser -Repository PSGallery -Force
}
Import-Module posh-git

if (-not (Get-Command fzf -ErrorAction SilentlyContinue)) {
    winget install --id junegunn.fzf --exact --source winget --accept-package-agreements --accept-source-agreements
}
if (-not (Get-Module -ListAvailable -Name PSFzf)) {
    Install-Module -Name PSFzf -Scope CurrentUser -Repository PSGallery -Force
}
Import-Module PSFzf

if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    winget install --id JanDeDobbeleer.OhMyPosh --exact --source winget --accept-package-agreements --accept-source-agreements
}
oh-my-posh init pwsh --config paradox | Invoke-Expression

if (-not (Get-Module -ListAvailable -Name PSReadLine)) {
    Install-Module -Name PSReadLine -Scope CurrentUser -Repository PSGallery -Force
}
Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView

fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

function get_gcloud_secret {
    param([string]$secret)
    gcloud secrets versions access latest --secret="$secret"
}
