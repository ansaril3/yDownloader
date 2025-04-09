#!/bin/bash

# Check if yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "❌ yt-dlp is not installed. Please install it:"
    echo "   Linux/macOS: 'brew install yt-dlp' or 'pip install yt-dlp'"
    echo "   Windows: 'pip install yt-dlp' or download it from https://github.com/yt-dlp/yt-dlp"
    exit 1
fi

# Check if cartoons.txt exists
if [ ! -f "cartoons.txt" ]; then
    echo "❌ File cartoons.txt not found. Create it and add video or playlist links."
    exit 1
fi

# Check if the file is empty
if [ ! -s "cartoons.txt" ]; then
    echo "❌ File cartoons.txt is empty. Add video or playlist links."
    exit 1
fi

# Create a download folder if it doesn't exist
DOWNLOAD_DIR="downloads"
mkdir -p "$DOWNLOAD_DIR"

echo "🔍 Links found in cartoons.txt: $(wc -l < cartoons.txt)"
echo "⬇️ Starting download..."

# Read the file line by line and download videos or playlists
while IFS= read -r url || [[ -n "$url" ]]; do
    url=$(echo "$url" | xargs)  # Trim whitespace
    if [[ -z "$url" || "$url" == "#"* ]]; then
        continue  # Skip empty lines and comments
    fi

    echo "📥 Downloading: $url"

    # yt-dlp automatically detects if it's a playlist or a single video
    if yt-dlp -o "$DOWNLOAD_DIR/%(playlist_title,single_title)s/%(title)s.%(ext)s" "$url"; then
        echo "✅ Successfully downloaded: $url"
    else
        echo "❌ Error downloading: $url" >&2
    fi
done < "cartoons.txt"

echo "🎉 All links processed. Check the '$DOWNLOAD_DIR' folder."
