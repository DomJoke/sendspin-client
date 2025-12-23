#!/usr/bin/env sh
set -e

OPTIONS="/data/options.json"

# Defaults (Docker / Portainer)
NAME="${SENDSPIN_NAME:-Sendspin Player}"
SERVER_IP="${SENDSPIN_SERVER_IP:-}"
PORT="${SENDSPIN_PORT:-8080}"
AUDIO_DEVICE="${SENDSPIN_AUDIO_DEVICE:-}"

# Home Assistant override (if options.json exists)
if [ -f "$OPTIONS" ]; then
  NAME="$(jq -r '.name' "$OPTIONS")"
  SERVER_IP="$(jq -r '.server_ip // empty' "$OPTIONS")"
  PORT="$(jq -r '.port // 8080' "$OPTIONS")"
  AUDIO_DEVICE="$(jq -r '.audio_device // ""' "$OPTIONS")"
fi

# Start building argument list
set -- \
  --headless \
  --name "$NAME"

# Only set audio device if environment variable is provided
if [ -n "$AUDIO_DEVICE" ]; then
  set -- "$@" --audio-device "$AUDIO_DEVICE"
fi

# Only set URL if server IP is provided
if [ -n "$SERVER_IP" ]; then
  URL="ws://$SERVER_IP:$PORT/sendspin"
  set -- "$@" --url "$URL"
fi

echo "Starting Sendspin with args: $*"
exec sendspin "$@"
