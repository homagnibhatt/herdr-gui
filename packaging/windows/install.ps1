# Per-user install of herdr-gui. Run with -Uninstall to remove.
param([switch]$Uninstall)
$ErrorActionPreference = 'Stop'
$dir = Join-Path $env:LOCALAPPDATA 'Programs\herdr-gui'
$lnk = Join-Path ([Environment]::GetFolderPath('Programs')) 'herdr-gui.lnk'
if ($Uninstall) {
    Remove-Item $lnk -ErrorAction SilentlyContinue
    Remove-Item $dir -Recurse -ErrorAction SilentlyContinue
    'herdr-gui removed.'; return
}
New-Item -ItemType Directory -Force $dir | Out-Null
Copy-Item (Join-Path $PSScriptRoot 'herdr-gui.exe'), (Join-Path $PSScriptRoot 'LICENSE') $dir -Force
$s = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk)
$s.TargetPath = Join-Path $dir 'herdr-gui.exe'; $s.WorkingDirectory = $dir; $s.Save()
"Installed to $dir with a Start menu shortcut."
if (-not (Get-Command herdr -ErrorAction SilentlyContinue)) { 'Note: herdr itself is not on PATH; herdr-gui needs a running herdr server.' }
