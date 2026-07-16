#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORT="${PORT:-8000}"
HOST="${HOST:-0.0.0.0}"
PID_FILE="${PID_FILE:-/tmp/bchforge-org-live-server.pid}"
LOG_FILE="${LOG_FILE:-/tmp/bchforge-org-browser-sync.log}"

cd "$ROOT_DIR"

if [[ -f "$PID_FILE" ]]; then
  existing_pid="$(cat "$PID_FILE")"
  if [[ -n "$existing_pid" ]] && kill -0 "$existing_pid" 2>/dev/null; then
    echo "BCH Forge live server is already running at http://$HOST:$PORT"
    echo "PID: $existing_pid"
    echo "Log: $LOG_FILE"
    exit 0
  fi
fi

if ss -ltn "sport = :$PORT" | grep -q LISTEN; then
  echo "Error: port $PORT is already in use. Run npm run stop or choose another port with PORT=8080 npm run dev." >&2
  exit 1
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx is not available. Install Node.js/npm to run the live development server." >&2
  exit 1
fi

nohup npx --yes browser-sync start \
  --server . \
  --files "index.html,styles.css,assets/**/*" \
  --host "$HOST" \
  --port "$PORT" \
  --no-open \
  --no-ui \
  >"$LOG_FILE" 2>&1 &
pid="$!"
printf '%s' "$pid" >"$PID_FILE"

echo "BCH Forge live server started at http://$HOST:$PORT"
echo "If using VS Code port forwarding, open the forwarded local port in your browser."
echo "This script does not kill existing processes. If the port is busy, it exits instead."
echo "PID: $pid"
echo "Log: $LOG_FILE"
