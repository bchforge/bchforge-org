#!/usr/bin/env bash
set -euo pipefail

PID_FILE="${PID_FILE:-/tmp/bchforge-org-live-server.pid}"

if [[ ! -f "$PID_FILE" ]]; then
  echo "BCH Forge live server is not running."
  exit 0
fi

pid="$(cat "$PID_FILE")"

if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
  kill "$pid"
  echo "Stopped BCH Forge live server (PID $pid)."
else
  echo "BCH Forge live server is not running."
fi

rm -f "$PID_FILE"
