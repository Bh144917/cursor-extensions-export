# Install all .vsix in .\vsix on this machine (run at home)
$ErrorActionPreference = "Continue"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$vsixDir = Join-Path $here "vsix"

if (-not (Test-Path $vsixDir)) { throw "找不到 vsix 文件夹: $vsixDir" }

$cursor = Get-Command cursor -ErrorAction SilentlyContinue
if (-not $cursor) {
  $candidates = @(
    "$env:LOCALAPPDATA\Programs\cursor\resources\app\bin\cursor.cmd",
    "$env:LOCALAPPDATA\Programs\Cursor\resources\app\bin\cursor.cmd"
  )
  foreach ($c in $candidates) {
    if (Test-Path $c) { $cursor = $c; break }
  }
}
if (-not $cursor) {
  throw "找不到 cursor 命令。请先安装 Cursor，并在命令面板执行: Shell Command: Install cursor command in PATH"
}
$cursorCmd = if ($cursor -is [string]) { $cursor } else { $cursor.Source }

$files = Get-ChildItem $vsixDir -Filter "*.vsix" | Sort-Object Name
if ($files.Count -eq 0) { throw "vsix 文件夹里没有 .vsix 文件" }

$ok = 0
$fail = @()
foreach ($f in $files) {
  Write-Host "安装 $($f.Name)"
  & $cursorCmd --install-extension $f.FullName
  if ($LASTEXITCODE -eq 0) { $ok++ } else { $fail += $f.Name }
}

Write-Host ""
Write-Host "完成: 成功 $ok / $($files.Count)"
if ($fail.Count -gt 0) {
  Write-Host "未装上:"
  $fail | ForEach-Object { Write-Host "  $_" }
}
Write-Host "装完后请完全退出 Cursor 再打开。"
