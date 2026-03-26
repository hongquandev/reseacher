#!/bin/bash

# --- CONFIGURATION ---
BASE_DIR="/Users/mac/AI Projects/reseacher"
QUEUE_FILE="$BASE_DIR/RESEARCH_QUEUE.txt"
COMPLETED_FILE="$BASE_DIR/RESEARCH_COMPLETED.txt"
LOG_FILE="$BASE_DIR/orchestrator/cron_log.md"
ANTIGRAVITY_BIN="/Users/mac/.antigravity/antigravity/bin/antigravity"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# --- INITIALIZATION ---
touch "$COMPLETED_FILE"
mkdir -p "$(dirname "$LOG_FILE")"

# --- MAIN LOGIC ---
if [ ! -s "$QUEUE_FILE" ]; then
    echo "[$DATE] No topics in queue. Skipping." >> "$LOG_FILE"
    exit 0
fi

# Đọc topic đầu tiên (ignore empty lines)
TOPIC=$(grep -v '^$' "$QUEUE_FILE" | head -n 1)

if [ -z "$TOPIC" ]; then
    echo "[$DATE] Empty queue found. Skipping." >> "$LOG_FILE"
    exit 0
fi

echo "---" >> "$LOG_FILE"
echo "## [$DATE] Cron Trigger: Researching '$TOPIC'" >> "$LOG_FILE"

# Thực hiện lệnh (đẩy vào chat mode agent)
# Lưu ý: Lệnh này sẽ mở VS Code và bắt đầu research tự động.
"$ANTIGRAVITY_BIN" chat --mode agent "/research $TOPIC" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "[$DATE] ✅ Started research for: $TOPIC" >> "$LOG_FILE"
    
    # Di chuyển sang completed và xóa khỏi queue (macOS compatible sed)
    echo "[$DATE] $TOPIC" >> "$COMPLETED_FILE"
    # Dùng mẫu temp file để tương thích macOS sed
    grep -v "^$TOPIC$" "$QUEUE_FILE" > "$QUEUE_FILE.tmp" && mv "$QUEUE_FILE.tmp" "$QUEUE_FILE"
else
    echo "[$DATE] ❌ Failed to start research for: $TOPIC" >> "$LOG_FILE"
    exit 1
fi
