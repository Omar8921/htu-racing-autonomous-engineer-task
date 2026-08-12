#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: ./visualize.sh <lidar_frame>"
    exit 1
fi

FIXED_FRAME="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP_RVIZ="$(mktemp /tmp/recruitment_rviz_XXXXXX.rviz)"

RVIZ_PID=""
RQT_PID=""

cleanup() {
    [ -n "$RVIZ_PID" ] && kill "$RVIZ_PID" 2>/dev/null || true
    [ -n "$RQT_PID" ] && kill "$RQT_PID" 2>/dev/null || true
    rm -f "$TMP_RVIZ"
}
trap cleanup EXIT INT TERM

sed "s|__FIXED_FRAME__|${FIXED_FRAME}|g"     "$SCRIPT_DIR/recruitment.rviz" > "$TMP_RVIZ"

rviz2 -d "$TMP_RVIZ" &
RVIZ_PID=$!

ros2 run rqt_image_view rqt_image_view  &
RQT_PID=$!

wait "$RVIZ_PID" "$RQT_PID"
