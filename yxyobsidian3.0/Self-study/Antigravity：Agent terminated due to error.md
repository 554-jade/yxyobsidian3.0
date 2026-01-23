---
tags:
  - 教程
---
尝试过的：（无用）

1、换agent

2、登出重新登陆

3、改节点改tun模式

4、卸载重新下载

5、清理缓存（在mac终端）：
> rm -rf ~/.gemini/antigravity/context_state && rm -rf ~/.gemini/antigravity/scratch && mkdir -p ~/.gemini/antigravity/context_state && mkdir -p ~/.gemini/antigravity/scratch

> mkdir -p ~/.gemini/antigravity/old_conversations_backup
> find ~/.gemini/antigravity/conversations -name "*.pb" -size +5M -exec mv {} ~/.gemini/antigravity/old_conversations_backup/ \;

最终解决方案：

步骤一：下载拓展cockpit，点自动唤醒

步骤二：

- 在 Antigravity 中按下 `Cmd + Shift + P`。
- 输入并选择：`Antigravity: Reset onboarding`。
- **重新登录**