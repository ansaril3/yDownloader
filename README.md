# YouTube Downloader Script

Этот Bash-скрипт автоматически скачивает видео с YouTube, указанные в файле `cartoons.txt`, с помощью [yt-dlp](https://github.com/yt-dlp/yt-dlp). Он также конвертирует длинные YouTube-ссылки в короткий формат (`https://youtu.be/VIDEO_ID`).

## 📦 Требования

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)  
- Bash (предустановлен на macOS и большинстве Linux-дистрибутивов)

### Установка `yt-dlp` (для macOS через Homebrew):

```bash
brew install yt-dlp
```

## 📄 Структура

- `cartoons.txt` — текстовый файл со списком YouTube-ссылок (по одной в строке).
- `download.sh` — основной скрипт для загрузки.

## 📥 Использование

1. Убедитесь, что установлен `yt-dlp`.
2. Создайте файл `cartoons.txt` в той же директории и добавьте в него ссылки на видео. Пример:

    ```txt
    https://www.youtube.com/watch?v=dQw4w9WgXcQ
    https://youtu.be/abc123xyz
    ```

3. Сделайте скрипт исполняемым:

    ```bash
    chmod +x download.sh
    ```

4. Запустите скрипт:

    ```bash
    ./download.sh
    ```

## 🔧 Что делает скрипт

- Проверяет наличие `yt-dlp` в системе.
- Проверяет наличие файла `cartoons.txt`.
- Построчно читает `cartoons.txt`, преобразует длинные ссылки в короткие (`youtu.be/...`), если необходимо.
- Скачивает каждое видео с помощью `yt-dlp`.
- Выводит статус каждого скачивания.

## 📝 Пример вывода

```
Скачивание: https://youtu.be/dQw4w9WgXcQ
[youtube] dQw4w9WgXcQ: Downloading webpage
...
Успешно скачано: https://youtu.be/dQw4w9WgXcQ
```

## 📁 Выходные файлы

Скачанные видео сохраняются в директорию, откуда был запущен скрипт.

## 🛠 Возможные улучшения

- Добавить поддержку выбора качества.
- Добавить лог-файл.
- Поддержка плейлистов.
