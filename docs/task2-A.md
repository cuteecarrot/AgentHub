# 阶段2 - A窗口任务清单

## 1. 目标
实现协议与校验模块，保证所有消息按规范生成/校验，可被 Router 与 CLI 复用。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/protocol/`
  - `src/validation/`
  - `fixtures/messages/`（示例消息）
- 不得修改 Router/Storage/Launcher 相关目录。

## 3. 任务清单
- 定义消息结构与枚举（type/action/category/severity/reason）。
- 实现校验器：必填字段、body 编码、reviewers 与 to 一致性、corr 规则。
- 提供消息构造函数（review/assign/ask/send/done/fail），允许 Router 补齐 seq/id/ts。
- 增加 6 条以上消息样例到 `fixtures/messages/`（clarify/review_feedback/assign/verify/done/fail）。

## 4. 交付文件路径
- `src/protocol/*`
- `src/validation/*`
- `fixtures/messages/*`

## 5. 验收标准
- CLI/Router 可直接调用校验器与构造函数，无需额外转换。
- 样例消息均可通过校验（json + 业务规则）。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：2026-01-17 13:56
- 修改摘要：新增协议枚举与构造函数、实现校验器并添加6条示例消息；Router/CLI 可直接按规范构建与校验消息。
- 是否有遗留问题：无
