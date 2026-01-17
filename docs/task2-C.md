# 阶段2 - C窗口任务清单

## 1. 目标
实现 Router 服务，负责消息路由、ACK、重试与状态查询。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/router/`
  - `src/api/`（Router 对外接口）
- 不得修改 protocol/storage/CLI/launcher 相关目录。

## 3. 任务清单
- 实现消息接收流程：校验 -> 补齐 seq/id/ts -> 落盘 -> 入队 -> ACK。
- 实现 ACK 接收与状态更新（delivered/accepted）。
- 实现重试与超时逻辑（含升级提醒钩子）。
- 提供状态与追踪接口：status/trace。

## 4. 交付文件路径
- `src/router/*`
- `src/api/*`

## 5. 验收标准
- 消息可正确投递到 inbox，并生成 ACK。
- 超时/重试规则可触发并记录。
- status/trace 可查询到任务与消息链路。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：2026-01-17 13:56
- 修改摘要：完成 Router 核心（落盘、inbox、ACK、重试、失败升级钩子、status/trace）与 HTTP API（/messages /acks /status /trace /inbox）及轻量客户端。
- 是否有遗留问题：发现 src/protocol/src/storage/src/state/src/validation 目录已出现但未对齐，暂不改动，等待统一接口。
