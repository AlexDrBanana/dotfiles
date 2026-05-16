Import-Module Terminal-Icons
Import-Module posh-git
Import-Module PSFzf

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/paradox.omp.json" | Invoke-Expression

Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView
