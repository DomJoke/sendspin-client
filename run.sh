#!/usr/bin/env sh
set -e

OPTIONS="/data/options.json"

# Defaults (for Portainer / Docker)
NAME="${SENDSPIN_NAME:-Sendspin Player}"
SERVER_IP="${SENDSPIN_SERVER_IP:-}"
PORT="${SENDSPIN_PORT:-8080}"

# If Home Assistant options.json exists, use it
if [ -f "$OPTIONS" ]; then
  NAME="$(jq -r '.name' "$OPTIONS")"
  SERVER_IP="$(jq -r '.server_ip // empty' "$OPTIONS")"
  PORT="$(jq -r '.port // 8080' "$OPTIONS")"
fi

set -- \
  --headless \
  --name "$NAME" \
  --audio-device default

if [ -n "$SERVER_IP" ]; then
  URL="ws://$SERVER_IP:$PORT/sendspin"
  set -- "$@" --url "$URL"
fi

echo "Starting Sendspin with args: $*"
exec sendspin "$@"
