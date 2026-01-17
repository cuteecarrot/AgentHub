# 阶段3 - B窗口任务清单

## 1. 目标
提供 Router 可直接调用的存储/状态接口，降低后续集成成本。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/storage/`
  - `src/state/`
- 不得修改 Router/Protocol/CLI/Launcher 相关目录。

## 3. 任务清单
- 提供高层接口函数（facade），用于 Router 写入消息/ACK/inbox。
- 明确接口输入/输出与错误处理（缺路径/非法 epoch/写入失败）。
- 补充 tasks 状态读写接口（task_id -> status/owner/deadline/retries）。
- 为恢复流程提供单入口函数（加载 session + router_state + inbox）。
- 添加简短使用示例（可在 README 或注释中）。

## 4. 交付文件路径
- `src/storage/*`
- `src/state/*`

## 5. 验收标准
- Router 可仅依赖 facade 完成落盘与恢复，不需要了解底层文件结构。
- 新接口与现有 layout/jsonio 不冲突。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：未提供
- 修改摘要：已新增 Router 可调用的 storage/state facade、任务读写接口与恢复入口，并补充使用示例。
- 是否有遗留问题：未提供
