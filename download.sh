#!/bin/bash

# Проверка наличия yt-dlp
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp не установлен. Установите его с помощью 'brew install yt-dlp'."
    exit 1
fi

# Проверка наличия файла cartoons.txt
if [ ! -f "cartoons.txt" ]; then
    echo "Файл cartoons.txt не найден."
    exit 1
fi

# Чтение файла построчно и скачивание видео
while IFS= read -r url; do
    if [ -n "$url" ]; then
        echo "Скачивание: $url"
        yt-dlp "$url"
        if [ $? -eq 0 ]; then
            echo "Успешно скачано: $url"
        else
            echo "Ошибка при скачивании: $url"
        fi
    fi
done < "cartoons.txt"

echo "Все видео скачаны."