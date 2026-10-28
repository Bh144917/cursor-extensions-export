Cursor 扩展导出
导出时间: 2026-10-26
来源电脑: 当前这台 Windows

这份文件夹只包含扩展和 Cursor 插件名单，不含账号、令牌或 MCP 密钥。

一、编辑器扩展（48 个，可用脚本安装）
家里电脑先安装 Cursor，并登录同一个账号。
Windows: 在本文件夹打开 PowerShell，执行
  powershell -ExecutionPolicy Bypass -File .\install-extensions.ps1
Mac / Linux:
  chmod +x install-extensions.sh && ./install-extensions.sh
如果提示找不到 cursor，在 Cursor 里按 Ctrl+Shift+P（Mac 为 Cmd+Shift+P），
执行 Shell Command: Install "cursor" command in PATH，然后重新打开终端。
脚本安装的是市场最新版，不锁死当前电脑上的旧版本。
对照版本见 extensions-versions.txt。
装完后完全退出 Cursor 再打开。

二、Cursor 插件（10 个，需在界面里安装）
打开 Cursor → Settings → Plugins，按 cursor-plugins.txt 里的名字搜索并安装。
Gmail、Outlook、GitHub、GitLab、Postman、Telegram 装好后要重新登录授权。

  cursor-public / postman
  cursor-public / gmail
  cursor-public / outlook
  claude-plugins-official / frontend-design
  claude-plugins-official / github
  claude-plugins-official / gitlab
  claude-plugins-official / mcp-server-dev
  claude-plugins-official / playwright
  claude-plugins-official / telegram
  claude-plugins-official / terraform

三、不用再装（Cursor 自带）
  anysphere.remote-ssh
  ms-vscode.remote-explorer
  ms-vscode-remote.remote-ssh-edit

四、扩展名单
  Better Comments                          aaron-bond.better-comments
  Qoder CN（原通义灵码）                    alibaba-cloud.tongyi-lingma
  Claude Code                              anthropic.claude-code
  Tailwind CSS IntelliSense                bradlc.vscode-tailwindcss
  Turbo Console Log                        chakrounanas.turbo-console-log
  npm Intellisense                         christian-kohler.npm-intellisense
  Translator X                             codexu.x-translator
  markdownlint                             davidanson.vscode-markdownlint
  ESLint                                   dbaeumer.vscode-eslint
  SVG-Viewer                               dheovani.svg-viewer
  GitLens                                  eamodio.gitlens
  EditorConfig                             editorconfig.editorconfig
  Prettier                                 esbenp.prettier-vscode
  Auto Rename Tag                          formulahendry.auto-rename-tag
  Code Runner                              formulahendry.code-runner
  Todo Tree                                gruntfuggly.todo-tree
  Vue 3 Snippets                           hollowtree.vue-snippets
  REST Client                              humao.rest-client
  Path Autocomplete                        ionutvmi.path-autocomplete
  Image preview                            kisstkondoros.vscode-gutter-preview
  Remove Unused Imports                    kuscamara.remove-unused-imports
  MasterGo                                 mastergo.mastergo
  Git Graph                                mhutchie.git-graph
  JavaScript and TypeScript Nightly        ms-vscode.vscode-typescript-next
  Color Highlight                          naumovs.color-highlight
  Pinia Snippets                           nicholashsiang.vscode-pinia-snippets
  Material Icon Theme                      pkief.material-icon-theme
  Cursor 简体中文语言包                     polang233.cursor-language-pack
  Unused CSS Classes                       rcore.rcore-unused-css-classes
  Language Support for Java                redhat.java
  Live Server                              ritwickdey.liveserver
  Roo Code                                 rooveterinaryinc.roo-cline
  nginx.conf                               shanoor.vscode-nginx
  Trailing Spaces                          shardulm94.trailing-spaces
  Code Spell Checker                       streetsidesoftware.code-spell-checker
  Stylelint                                stylelint.vscode-stylelint
  Error Lens                               usernamehw.errorlens
  IntelliCode                              visualstudioexptteam.vscodeintellicode
  Gradle for Java                          vscjava.vscode-gradle
  Debugger for Java                        vscjava.vscode-java-debug
  Project Manager for Java                 vscjava.vscode-java-dependency
  Extension Pack for Java                  vscjava.vscode-java-pack
  Test Runner for Java                     vscjava.vscode-java-test
  Maven for Java                           vscjava.vscode-maven
  Vue (Official)                           vue.volar
  TODO Highlight                           wayou.vscode-todo-highlight
  JavaScript (ES6) code snippets           xabikos.javascriptsnippets
  IntelliSense for CSS class names         zignd.html-css-class-completion

Java 相关扩展体积较大，家里电脑需要先装好 JDK。
通义灵码、Claude Code、Roo Code 装好后要重新登录。
## 离线 VSIX 安装（推荐，家里装不上市场扩展时用）

仓库内 six/ 目录含 36 个常用扩展离线包（约 36MB），不含通义/Claude/Java 等大包。

`powershell
git clone https://github.com/Bh144917/cursor-extensions-export.git
cd cursor-extensions-export
powershell -ExecutionPolicy Bypass -File .\install-vsix.ps1
`

装完后完全退出 Cursor 再打开。详见 VSIX使用说明.txt。
