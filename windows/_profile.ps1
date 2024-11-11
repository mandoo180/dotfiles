oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression

Set-Alias -Name "ll" ls
Set-Alias -Name "l" ls
Set-Alias -Name "vi" nvim

Set-PSReadLineOption -EditMode Emacs

$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:XDG_DATA_HOME = "$HOME\.local"
