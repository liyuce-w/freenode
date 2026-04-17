#!/bin/bash
set -e  # 出错即停止

# 获取当前日期（UTC 时间，如需北京时间可加 TZ 环境变量）
YEAR=$(date +'%Y')
MONTH=$(date +'%m')
DATE8=$(date +'%Y%m%d')

# 构造目标 URL
URL="https://node.freeclashnode.com/uploads/${YEAR}/${MONTH}/0-${DATE8}.yaml"

# 输出文件路径（项目根目录）
OUTPUT_FILE="./freenode.yaml"

echo "Downloading from: $URL"
# 使用 curl 下载，-L 跟随重定向，-f 使 HTTP 错误时返回非零退出码
curl -L -f "$URL" -o "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Successfully saved to $OUTPUT_FILE"
else
    echo "Download failed (HTTP error or file not found)"
    exit 1
fi
