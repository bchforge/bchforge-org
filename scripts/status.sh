#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8000}"
HOST="${HOST:-0.0.0.0}"
PID_FILE="${PID_FILE:-/tmp/bchforge-org-live-server.pid}"
LOG_FILE="${LOG_FILE:-/tmp/bchforge-org-browser-sync.log}"

if [[ -f "$PID_FILE" ]]; then
  pid="$(cat "$PID_FILE")"
  if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
    echo "BCH Forge live server is running."
    echo "URL: http://$HOST:$PORT"
    echo "Local browser URL: http://127.0.0.1:$PORT"
    echo "PID: $pid"
    echo "Log: $LOG_FILE"
    exit 0
  fi
fi

echo "BCH Forge live server is not running."
exit 1
