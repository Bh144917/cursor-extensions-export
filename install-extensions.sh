#!/bin/sh
# 在家里的 Mac / Linux 终端进入本文件夹后执行:
#   chmod +x install-extensions.sh && ./install-extensions.sh
cd "$(dirname "$0")" || exit 1
if ! command -v cursor >/dev/null 2>&1; then
  echo "找不到 cursor 命令。请先安装 Cursor，并在命令面板执行 Shell Command: Install cursor command in PATH。"
  exit 1
fi
ok=0
fail=0
while IFS= read -r id; do
  [ -z "$id" ] && continue
  case "$id" in \#*) continue ;; esac
  echo "安装 $id"
  if cursor --install-extension "$id"; then
    ok=$((ok + 1))
  else
    echo "失败: $id"
    fail=$((fail + 1))
  fi
done < extensions.txt
echo "完成: 成功 $ok，失败 $fail"
echo "装完后完全退出 Cursor 再打开。Cursor 插件请按 使用说明.txt 在设置里手动安装。"