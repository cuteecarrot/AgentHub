# 阶段2 - B窗口任务清单

## 1. 目标
实现存储与状态模块，确保会话、日志、inbox 与恢复流程可落地。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/storage/`
  - `src/state/`
  - `data/.codex_team/`（本地数据目录模板或初始化逻辑）
- 不得修改 Router/CLI/Launcher 相关目录。

## 3. 任务清单
- 实现会话初始化与读取：session_id/epoch/seq 持久化。
- 实现消息与 ACK 日志追加（messages-<epoch>.jsonl/acks-<epoch>.jsonl）。
- 实现 inbox 写入/读取（按 agent 分文件或索引）。
- 实现恢复流程：从日志重建 inbox 与 task 状态。

## 4. 交付文件路径
- `src/storage/*`
- `src/state/*`
- `data/.codex_team/*`（或初始化脚本/模板）

## 5. 验收标准
- 重启后可恢复 last_seq、inbox 与 task 状态。
- 日志与 inbox 按设计文档结构落盘。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：2026-01-17 13:37
- 修改摘要：已完成存储/状态模块与 .codex_team 模板目录（session/seq、日志、inbox、恢复落盘），包含 storage（JSONL I/O/session/logs/inbox/blob）、state（router_state/tasks/recovery）与 data/.codex_team 目录骨架。
- 是否有遗留问题：发现非本人创建的 src/router/ src/protocol/ src/validation/ src/api 目录，暂不对齐，待统一接口后处理。
