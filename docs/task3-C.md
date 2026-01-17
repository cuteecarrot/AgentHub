# 阶段3 - C窗口任务清单

## 1. 目标
将 Router 与协议校验、存储/状态模块对齐，并补齐在线状态服务端逻辑。

## 2. 负责范围（边界）
- 仅新增或修改以下目录：
  - `src/router/`
  - `src/api/`
- 不得修改 Protocol/Storage/CLI/Launcher 相关目录。

## 3. 任务清单
- 接入 A 的校验器：消息入站先校验再落盘。
- 接入 B 的存储/状态接口：替换 Router 自有落盘逻辑。
- 实现 presence/heartbeat 服务端：register/heartbeat、超时判离线（默认 30s 间隔、2 倍超时）。
- 保持 /messages /acks /status /trace /inbox 接口稳定，补充必要错误码。
- 添加一条集成 smoke test（send -> ack -> status/trace）。

## 4. 交付文件路径
- `src/router/*`
- `src/api/*`

## 5. 验收标准
- 通过校验器的消息才会入库与入队。
- 重启后状态可从存储恢复（依赖 B 的接口）。
- presence/heartbeat 行为可通过 API 调用验证。

## 6. 截止时间
- 启动后 1 天内完成。

## 7. 完成记录（填写）
- 开始时间：
- 完成时间：未提供
- 修改摘要：已接入校验器与存储/状态模块，新增 presence/heartbeat 服务端与集成 smoke test（python3 src/api/smoke_test.py 通过）。
- 是否有遗留问题：无
