#!/bin/bash

# --- CONFIGURATION ---
BASE_DIR="/Users/mac/AI Projects/reseacher"
QUEUE_FILE="$BASE_DIR/RESEARCH_QUEUE.txt"
COMPLETED_FILE="$BASE_DIR/RESEARCH_COMPLETED.txt"
LOG_FILE="$BASE_DIR/orchestrator/cron_log.md"
ANTIGRAVITY_BIN="/Users/mac/.antigravity/antigravity/bin/antigravity"
MAX_PARALLEL=3  # Thay đổi số lượng task song song tại đây
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# --- INITIALIZATION ---
touch "$COMPLETED_FILE"
mkdir -p "$(dirname "$LOG_FILE")"

# --- MAIN LOGIC ---
if [ ! -s "$QUEUE_FILE" ]; then
    echo "[$DATE] No topics in queue. Skipping." >> "$LOG_FILE"
    exit 0
fi

# Đọc N topics đầu tiên (ignore empty lines)
TOPICS=$(grep -v '^$' "$QUEUE_FILE" | head -n "$MAX_PARALLEL")

if [ -z "$TOPICS" ]; then
    echo "[$DATE] No valid topics found. Skipping." >> "$LOG_FILE"
    exit 0
fi

echo "---" >> "$LOG_FILE"
echo "## [$DATE] Cron Trigger: Starting $MAX_PARALLEL Parallel Tasks" >> "$LOG_FILE"

# Duyệt từng topic và kích hoạt
echo "$TOPICS" | while IFS= read -r TOPIC; do
    if [ -n "$TOPIC" ]; then
        echo "[$DATE] [Parallel] Triggering: '$TOPIC'" >> "$LOG_FILE"
        
        # Gọi CLI Antigravity
        "$ANTIGRAVITY_BIN" chat --mode agent "/research $TOPIC" >> "$LOG_FILE" 2>&1
        
        if [ $? -eq 0 ]; then
             echo "[$DATE] ✅ Started research for: $TOPIC" >> "$LOG_FILE"
             echo "[$DATE] $TOPIC" >> "$COMPLETED_FILE"
             
             # Xóa khỏi queue
             grep -v "^$TOPIC$" "$QUEUE_FILE" > "$QUEUE_FILE.tmp" && mv "$QUEUE_FILE.tmp" "$QUEUE_FILE"
        else
             echo "[$DATE] ❌ Failed to start research for: $TOPIC" >> "$LOG_FILE"
        fi
        
        # Nhịp nghỉ nhẹ để tránh xung đột UI khi mở nhiều tab
        sleep 2
    fi
done
