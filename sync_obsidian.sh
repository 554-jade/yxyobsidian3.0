#!/bin/bash

# 1. 进入笔记目录（请确保脚本放在笔记根目录）
cd "$(dirname "$0")"

echo "开始自动同步..."

# 2. 预处理：防止嵌套仓库导致的同步失败
if [ -d "ob/.git" ]; then
    echo "发现嵌套 Git 目录，正在清理..."
    rm -rf ob/.git
fi

# 3. 拉取远程更新，防止冲突
git pull origin main --rebase

# 4. 添加所有更改（会根据你的 .gitignore 自动忽略插件）
git add .

# 5. 如果没有更改则跳过提交
if git diff-index --quiet HEAD --; then
    echo "没有检测到新更改，无需同步。"
else
    # 6. 提交更改，附带当前时间戳
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"

    # 7. 推送至 GitHub
    # 注意：如果之前有密钥拦截，第一次运行可能仍需在软件界面点一次 Bypass
    git push origin main
    echo "同步完成！"
fi