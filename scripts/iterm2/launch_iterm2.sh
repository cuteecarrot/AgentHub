#!/bin/bash
set -e

if [ "$#" -lt 7 ]; then
  echo "usage: launch_iterm2.sh <workspace> <codex_cmd> <session> <epoch> <role> <agent_id> <window_name> [role agent_id window_name ...]" 1>&2
  exit 1
fi

workspace=$1
codex_cmd=$2
session=$3
epoch=$4
shift 4

root_dir=$(cd "$(dirname "$0")/../.." && pwd)

run_iterm() {
  app_name=$1
  cmd=$2
  win_name=$3
  osascript - "$app_name" "$cmd" "$win_name" <<'APPLESCRIPT'
on run argv
  set appName to item 1 of argv
  set cmd to item 2 of argv
  set winName to item 3 of argv
  tell application appName
    activate
    set newWindow to (create window with default profile)
    tell current session of newWindow
      write text cmd
      try
        set name to winName
      end try
    end tell
  end tell
end run
APPLESCRIPT
}

# 角色职责描述
get_role_description() {
  case "$1" in
    MAIN)
      echo "你是项目经理(MAIN)。职责：1)任务规划分配 2)文档更新 3)进度追踪。不要写代码！"
      ;;
    A|B|C|D)
      echo "你是编码Agent $1。完成后回复格式：名字/问题/代码路径/文档路径"
      ;;
    *)
      echo "你是执行 Agent"
      ;;
  esac
}


while [ "$#" -gt 0 ]; do
  role=$1
  agent_id=$2
  window_name=$3
  shift 3

  mkdir -p "${HOME}/.codex_team"
  
  role_desc=$(get_role_description "$role")
  
  initial_prompt="你是 Agent [${role}]，ID: ${agent_id}。

团队: MAIN(主控), A/B/C/D(执行)

  # 通用原则
  principles="
1. 【待命原则】启动后不要主动执行任务！
   - MAIN: 等待用户输入指令。
   - A/B/C/D: 等待 MAIN 分配任务。
2. 【沟通原则】不懂就问！
   - 遇到文档歧义、需求不轻、路径错误，立刻发消息询问。
   - 不要猜测！不要由于不确定而写出错误代码。
3. 【用户体验优先】
   - 思考开发方案时，优先考虑用户体验和易用性。
   - 检查文档是否有冲突。
"

  # 针对角色的具体提示
  if [ "$role" == "MAIN" ]; then
      specific_prompt="你是 MAIN (项目经理)。
当前状态: [等待用户指令]
你的工作:
1. 询问用户想做什么。
2. 分析需求，确认清楚后再分配给 A/B/C/D。
3. 如果需求不清晰，先问用户，不要急着分配。
4. 汇总各 Agent 的进度，向用户汇报。"
  else
      specific_prompt="你是 Agent ${role} (执行者)。
当前状态: [待命]
你的工作:
1. 等待 MAIN 的消息 (shell_proxy 会自动显示)。
2. 收到任务后，先检查是否清晰。如果不清晰，回复 MAIN 询问。
3. 确认无误后才开始执行。
4. 完成后向 MAIN 汇报。"
  fi

  # 创建最终提示词
  initial_prompt="你是 Agent [${role}]，ID: ${agent_id}。

${principles}

${specific_prompt}

  # 定义工具的绝对路径
  # 我们通过环境变量 TEAM_TOOL 传递给 AI

  # 创建最终提示词
  initial_prompt="你是 Agent [${role}]。

${principles}

${specific_prompt}

工具路径 (环境变量):
\$TEAM_TOOL

发消息示例:
python3 \$TEAM_TOOL say --from ${role} --to [目标] --text \"[内容]\"

请回复: \"${role} 已就绪，等待指令。\""




  cmd="export TEAM_TOOL='${root_dir}/src/cli/team.py'; export TEAM_ROLE='${role}' TEAM_AGENT_ID='${agent_id}' TEAM_SESSION='${session}' TEAM_EPOCH='${epoch}' TEAM_WINDOW_NAME='${window_name}' ROUTER_URL='http://127.0.0.1:8765'; printf '\\033]0;${window_name}\\007'; cd '${workspace}'; python3 '${root_dir}/src/launcher/shell_proxy.py' -- ${codex_cmd} --dangerously-bypass-approvals-and-sandbox -C '${workspace}' '${initial_prompt}'"


  if ! run_iterm "iTerm" "$cmd" "$window_name"; then
    if ! run_iterm "iTerm2" "$cmd" "$window_name"; then
      echo "iTerm not available" 1>&2
      exit 1
    fi
  fi

  sleep 0.5
done



