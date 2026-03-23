# OpenClaw Config
Настройки и workspace для OpenClaw агента Skyler.

## Содержимое
- workspace/ — память, скиллы, инструкции бота
- openclaw.json — основной конфиг

## Переезд на новый сервер
1. git clone этого репо
2. cp -r workspace/ ~/.openclaw/
3. cp openclaw.json ~/.openclaw/
4. Установить openclaw, obsidian-cli, gh
5. node dist/entry.js gateway restart
