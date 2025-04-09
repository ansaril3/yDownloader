# YouTube Downloader Script

This Bash script automatically downloads videos from YouTube listed in the `cartoons.txt` file using [yt-dlp](https://github.com/yt-dlp/yt-dlp). It also converts long YouTube URLs into the short format (`https://youtu.be/VIDEO_ID`).

## 📦 Requirements

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)  
- Bash 

### Install `yt-dlp` (for macOS via Homebrew):

```bash
brew install yt-dlp
```

## 📄 Structure

- `cartoons.txt` — a text file containing a list of YouTube URLs (one per line).
- `download.sh` — the main script for downloading.

## 📥 Usage

1. Make sure `yt-dlp` is installed.
2. Open `cartoons.txt` file and add video URLs to it. Example:

    ```txt
    https://www.youtube.com/watch?v=dQw4w9WgXcQ
    https://youtu.be/abc123xyz
    ```

3. Make the script executable:

    ```bash
    chmod +x download.sh
    ```

4. Run the script:

    ```bash
    ./download.sh
    ```

## 🔧 What the Script Does

- Checks if `yt-dlp` is installed.
- Checks if `cartoons.txt` exists.
- Reads `cartoons.txt` line by line, converts long YouTube URLs to short ones if needed.
- Downloads each video using `yt-dlp`.
- Displays the status of each download.

## 📝 Example Output

```
Downloading: https://youtu.be/dQw4w9WgXcQ
[youtube] dQw4w9WgXcQ: Downloading webpage
...
Successfully downloaded: https://youtu.be/dQw4w9WgXcQ
```

## 📁 Output Files

Downloaded videos are saved in the downloads directory.

