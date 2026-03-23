# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.

## Obsidian Vault
- Vault path: `/root/vault`
- CLI tool: `obsidian-cli`
- Default vault: `vault`

### Команды
- `obsidian-cli list` — список всех заметок
- `obsidian-cli print "имя"` — читать заметку
- `obsidian-cli create "имя" --content "текст"` — создать заметку
- `obsidian-cli search-content "запрос"` — поиск по содержимому
- `obsidian-cli move "старое" "новое"` — переименовать заметку

### Синхронизация
- GitHub: `https://github.com/denistar83/obsidian.git`
- Каждый час автоматически: сервер ↔ GitHub ↔ Windows

## Как работать с Obsidian
Для выполнения команд obsidian используй coding-agent или прямой bash.
Пример запроса: "запусти в терминале: obsidian-cli list"

Подтверждено что работает:
- obsidian-cli list ✓
- obsidian-cli print "имя" ✓
- obsidian-cli create "имя" --content "текст" ✓

## Голосовые сообщения
Когда пользователь присылает голосовое сообщение (файл .ogg, .mp3, .m4a):
1. Скачай файл
2. Транскрибируй: `~/openclaw/skills/openai-whisper-api/scripts/transcribe.sh /путь/к/файлу.ogg`
3. Прочитай результат и ответь на содержимое
- API: Groq Whisper (whisper-large-v3-turbo)
- Ключ: уже в OPENAI_API_KEY
