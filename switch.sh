#!/bin/bash
PROFILE=$1
OPENCLAW_DIR="/root/.openclaw"
CONFIG_DIR="/root/openclaw-config/configs"

if [[ "$PROFILE" != "openrouter" && "$PROFILE" != "gcli2api" ]]; then
    echo "Usage: ./switch.sh [openrouter|gcli2api]"
    exit 1
fi

echo "Switching to: $PROFILE"

cp "$CONFIG_DIR/$PROFILE/openclaw.json" "$OPENCLAW_DIR/openclaw.json"
cp "$CONFIG_DIR/$PROFILE/models.json" "$OPENCLAW_DIR/agents/main/agent/models.json"
cp "$CONFIG_DIR/$PROFILE/auth-profiles.json" "$OPENCLAW_DIR/agents/main/agent/auth-profiles.json"

systemctl --user restart openclaw-gateway
sleep 3
systemctl --user status openclaw-gateway | grep Active

echo "✅ Switched to $PROFILE"
