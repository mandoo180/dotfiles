#Requires -Version 5.1
<#
.SYNOPSIS
    Symlink vscode/{settings,extensions}.json to VSCode user config (Windows).
.DESCRIPTION
    PowerShell equivalent of setup-vscode.sh.
    Requires Developer Mode enabled or an elevated (Administrator) terminal
    to create symbolic links.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ScriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Definition
$ProjectDir = Split-Path -Parent $ScriptDir
$VscodeDir  = Join-Path $ProjectDir 'vscode'
$TargetDir  = Join-Path $env:APPDATA 'Code\User'

Write-Host "Project:  $VscodeDir"
Write-Host "Target:   $TargetDir"
Write-Host

# Verify source files exist
foreach ($file in @('settings.json', 'extensions.json')) {
    $src = Join-Path $VscodeDir $file
    if (-not (Test-Path $src)) {
        Write-Error "error: $src not found"
    }
}

# Create target directory if needed
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

# Link each file
foreach ($file in @('settings.json', 'extensions.json')) {
    $src = Join-Path $VscodeDir $file
    $dst = Join-Path $TargetDir $file

    if (Test-Path $dst) {
        $item = Get-Item $dst -Force
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            $current = $item.Target
            if ($current -eq $src) {
                Write-Host "skip:     $file (symlink already correct)"
                continue
            }
            Write-Host "relink:   $file (was -> $current)"
            Remove-Item $dst -Force
        } else {
            Write-Host "backup:   $file -> $file.bak"
            Move-Item $dst "$dst.bak" -Force
        }
    }

    New-Item -ItemType SymbolicLink -Path $dst -Target $src | Out-Null
    Write-Host "linked:   $dst -> $src"
}

Write-Host
Write-Host 'done. Restart VSCode to apply.'
