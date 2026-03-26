#!/bin/bash
# scripts/spawn-agent.sh
# Purpose: Spawn a background research agent for a specific topic.

TOPIC="$1"
BASE_DIR="/Users/mac/AI Projects/reseacher"
ANTIGRAVITY_BIN="/Users/mac/.antigravity/antigravity/bin/antigravity"
LOG_FILE="$BASE_DIR/orchestrator/log.md"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

if [ -z "$TOPIC" ]; then
    echo "Error: No topic provided."
    exit 1
fi

echo "[$DATE] 🚀 SPAWNING BACKGROUND AGENT for: $TOPIC" >> "$LOG_FILE"

# Kích hoạt instance mới. Lệnh chat sẽ mở tab mới và thực hiện research tự động.
# Sử dụng nohup để đảm bảo tiến trình tiếp tục nếu phiên hiện tại bị gián đoạn.
nohup "$ANTIGRAVITY_BIN" chat --mode agent "/research $TOPIC" > /dev/null 2>&1 &

echo "[$DATE] ✅ Spawned background process for: $TOPIC" >> "$LOG_FILE"
