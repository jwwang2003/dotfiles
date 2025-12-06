#!/bin/sh

HOST="$1"
PORT="$2"
MSG="$3"      # optional extra message
SILENT="$4"   # if non-empty => suppress all output

# Check if host $1 and port $2 are reachable
if nc -z -w 1 "$HOST" "$PORT" >/dev/null 2>&1; then
    # Reachable -> success
    if [ -z "$SILENT" ]; then
        printf '✅ %s:%s is reachable, connecting to it...\n' "$HOST" "$PORT" >&2
        if [ -n "$MSG" ]; then
            printf '%s\n' "$MSG" >&2
        fi
    fi
    exit 0
else
    # Unreachable
    if [ -z "$SILENT" ]; then
        printf '⚠️ %s:%s is NOT reachable, falling back...\n' "$HOST" "$PORT" >&2
    fi
    exit 1
fi

