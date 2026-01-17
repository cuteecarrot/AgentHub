# 阶段3 - A窗口任务清单

## 1. 目标
扩展协议校验到“动作级”完整规则，确保所有消息类型都有可执行的字段校验。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/protocol/`
  - `src/validation/`
  - `fixtures/messages/`
- 不得修改 Router/Storage/CLI/Launcher 相关目录。

## 3. 任务清单
- 在校验器中补齐动作级校验：assign/clarify/verify/review_feedback/send/done/fail。
- 为每个动作明确 body 必填字段与类型检查（如 files/success_criteria 为数组）。
- 强化 review_deadline 必填规则与 reviewers=to 一致性校验。
- 补齐/更新示例消息（fixtures）以覆盖所有动作并通过校验。
- 提供一个最小自检脚本或说明，验证 fixtures 全部通过。

## 4. 交付文件路径
- `src/protocol/*`
- `src/validation/*`
- `fixtures/messages/*`

## 5. 验收标准
- 现有与新增 fixtures 全部校验通过。
- 动作级字段缺失时返回明确错误。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：未提供
- 修改摘要：已补齐动作级校验与 review_deadline 规则，新增 review/send fixtures 与自检脚本（check_fixtures.py 通过）。
- 是否有遗留问题：无
