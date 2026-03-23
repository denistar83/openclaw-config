#!/bin/bash
PROFILE=$1
OPENCLAW_DIR="/root/.openclaw"
CONFIG_DIR="/root/openclaw-config/configs"

if [[ "$PROFILE" != "openrouter" && "$PROFILE" != "gcli2api" ]]; then
    echo "Usage: ./switch.sh [openrouter|gcli2api]"
    echo "Current configs: openrouter, gcli2api"
    exit 1
fi

echo "🔄 Switching to: $PROFILE"

# Копируем конфиги из репозитория
cp "$CONFIG_DIR/$PROFILE/openclaw.json" "$OPENCLAW_DIR/openclaw.json"
cp "$CONFIG_DIR/$PROFILE/models.json" "$OPENCLAW_DIR/agents/main/agent/models.json"

# auth-profiles НЕ трогаем — там реальные ключи которых нет в репозитории
echo "⚠️  auth-profiles.json не тронут (содержит реальные ключи)"

systemctl --user restart openclaw-gateway
sleep 3
systemctl --user status openclaw-gateway | grep Active

echo "✅ Switched to $PROFILE"
