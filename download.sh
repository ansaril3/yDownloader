#!/bin/bash

# Проверка наличия yt-dlp
if ! command -v yt-dlp &> /dev/null; then
    echo "❌ yt-dlp не установлен. Установите его:"
    echo "   Linux/macOS: 'brew install yt-dlp' или 'pip install yt-dlp'"
    echo "   Windows: 'pip install yt-dlp' или скачайте с https://github.com/yt-dlp/yt-dlp"
    exit 1
fi

# Проверка наличия файла cartoons.txt
if [ ! -f "cartoons.txt" ]; then
    echo "❌ Файл cartoons.txt не найден. Создайте его и добавьте ссылки на видео."
    exit 1
fi

# Проверка, пуст ли файл
if [ ! -s "cartoons.txt" ]; then
    echo "❌ Файл cartoons.txt пуст. Добавьте ссылки на видео."
    exit 1
fi

# Создаем папку для загрузок, если её нет
DOWNLOAD_DIR="downloads"
mkdir -p "$DOWNLOAD_DIR"

echo "🔍 Найдено ссылок в cartoons.txt: $(wc -l < cartoons.txt)"
echo "⬇️ Начинаю загрузку..."

# Чтение файла построчно и скачивание видео
while IFS= read -r url || [[ -n "$url" ]]; do
    url=$(echo "$url" | xargs)  # Удаляем лишние пробелы
    if [[ -z "$url" || "$url" == "#"* ]]; then
        continue  # Пропускаем пустые строки и комментарии
    fi

    echo "📥 Скачиваю: $url"
    if yt-dlp -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$url"; then
        echo "✅ Успешно: $url"
    else
        echo "❌ Ошибка при скачивании: $url" >&2
    fi
done < "cartoons.txt"

echo "🎉 Все видео обработаны. Проверьте папку '$DOWNLOAD_DIR'."