#!/usr/bin/env bash
# setup-zed.sh — Symlink zed/{settings,keymap}.json to Zed user config
# Works on macOS and Linux

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ZED_DIR="$PROJECT_DIR/zed"

# Resolve Zed user settings directory per OS
case "$(uname -s)" in
    Darwin)
        TARGET_DIR="$HOME/.config/zed"
        ;;
    Linux)
        TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zed"
        ;;
    *)
        echo "error: unsupported OS '$(uname -s)'" >&2
        exit 1
        ;;
esac

echo "Project:  $ZED_DIR"
echo "Target:   $TARGET_DIR"
echo

# Verify source files exist
for file in settings.json keymap.json; do
    if [ ! -f "$ZED_DIR/$file" ]; then
        echo "error: $ZED_DIR/$file not found" >&2
        exit 1
    fi
done

# Create target directory if needed
mkdir -p "$TARGET_DIR"

# Link each file
for file in settings.json keymap.json; do
    src="$ZED_DIR/$file"
    dst="$TARGET_DIR/$file"

    if [ -L "$dst" ]; then
        current="$(readlink "$dst")"
        if [ "$current" = "$src" ]; then
            echo "skip:     $file (symlink already correct)"
            continue
        fi
        echo "relink:   $file (was -> $current)"
        rm "$dst"
    elif [ -f "$dst" ]; then
        echo "backup:   $file -> $file.bak"
        mv "$dst" "$dst.bak"
    fi

    ln -s "$src" "$dst"
    echo "linked:   $dst -> $src"
done

echo
echo "done. Restart Zed to apply."
