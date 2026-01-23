#!/bin/bash

# 指定你的笔记文件夹绝对路径
TARGET_DIR="/Users/yixinyue/Documents/GitHub/yxyobsidian3.0"

# 进入目录
cd "$TARGET_DIR" || exit

echo "--- 开始自动同步 [$(date '+%Y-%m-%d %H:%M:%S')] ---"

# 处理可能导致同步失败的嵌套仓库问题
if [ -d "ob/.git" ]; then
    echo "清理嵌套 Git 目录..."
    rm -rf "ob/.git"
fi

# 清理缓存，确保 .gitignore 里的插件文件夹被排除
git rm -r --cached . > /dev/null 2>&1

# 添加所有笔记更改
git add .

# 检查是否有内容需要提交
if git diff-index --quiet HEAD --; then
    echo "没有检测到新更改，跳过同步。"
else
    # 提交更改
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # 推送至 GitHub
    echo "正在推送到 GitHub..."
    git push origin main
    echo "同步成功！"
fi