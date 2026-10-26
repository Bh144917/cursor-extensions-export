# 在家里电脑的 PowerShell 中，进入本文件夹后执行:
#   powershell -ExecutionPolicy Bypass -File .\install-extensions.ps1
$ErrorActionPreference = "Continue"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$list = Join-Path $here "extensions.txt"
if (-not (Test-Path $list)) { throw "找不到 extensions.txt" }

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
  throw "找不到 cursor 命令。请先安装 Cursor，并在命令面板执行 Shell Command: Install cursor command in PATH。"
}
$cursorCmd = if ($cursor -is [string]) { $cursor } else { $cursor.Source }

$ids = Get-Content $list | Where-Object { $_ -and -not $_.StartsWith("#") }
$ok = 0
$fail = @()
foreach ($id in $ids) {
  Write-Host "安装 $id"
  & $cursorCmd --install-extension $id
  if ($LASTEXITCODE -eq 0) { $ok++ } else { $fail += $id }
}
Write-Host ""
Write-Host "完成: 成功 $ok / $($ids.Count)"
if ($fail.Count -gt 0) {
  Write-Host "未装上:"
  $fail | ForEach-Object { Write-Host "  $_" }
}
Write-Host "装完后完全退出 Cursor 再打开。Cursor 插件请按 使用说明.txt 在设置里手动安装。"