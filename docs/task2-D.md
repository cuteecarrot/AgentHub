# 阶段2 - D窗口任务清单

## 1. 目标
实现 CLI 与启动器，确保 team 命令可用并能一键启动多窗口。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/cli/`
  - `src/launcher/`
  - `scripts/terminal/`
  - `scripts/iterm2/`（可选）
- 不得修改 protocol/storage/router 相关目录。

## 3. 任务清单
- 实现 CLI 命令：start/review/assign/ask/send/done/fail/status/trace。
- start 命令：启动 Router -> 打开窗口 -> 注入环境变量 -> 连接 Router 并发起 presence.register。
- 仅负责客户端侧连接与注册调用，Router 侧处理由 C 窗口实现。
- Terminal 启动脚本中必须包含 `codex --dangerously-bypass-approvals-and-sandbox`。
- 提供 CLI 参数示例与默认配置读取（配置文件或环境变量）。

## 4. 交付文件路径
- `src/cli/*`
- `src/launcher/*`
- `scripts/terminal/*`
- `scripts/iterm2/*`（可选）

## 5. 验收标准
- 一条命令可启动 MAIN + A/B/C/D 五窗口。
- 各窗口环境变量正确注入（TEAM_ROLE/TEAM_AGENT_ID/TEAM_SESSION/TEAM_EPOCH/TEAM_WINDOW_NAME）。
- CLI 可发送基础消息并返回 ACK 或错误提示。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：未提供
- 修改摘要：实现 CLI（team start/review/assign/ask/send/done/fail/status/trace）与配置加载；完成 launcher adapters（terminal/tmux/iterm2）与 Terminal/iTerm2 启动脚本，包含 codex --dangerously-bypass-approvals-and-sandbox；start 流程可启动 Router/打开窗口/注册 presence。
- 是否有遗留问题：无
