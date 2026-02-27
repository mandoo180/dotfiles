#!/usr/bin/env bash
# setup-vscode.sh — Symlink vscode/{settings,extensions}.json to VSCode user config
# Works on macOS, Linux, and Windows (Git Bash / MSYS2 / WSL)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VSCODE_DIR="$PROJECT_DIR/vscode"

# Resolve VSCode user settings directory per OS
case "$(uname -s)" in
    Darwin)
        TARGET_DIR="$HOME/Library/Application Support/Code/User"
        ;;
    Linux)
        if [ -n "${WSL_DISTRO_NAME:-}" ] || grep -qsi microsoft /proc/version 2>/dev/null; then
            # WSL: use Windows-side VSCode config
            WIN_HOME="$(wslpath "$(cmd.exe /C 'echo %APPDATA%' 2>/dev/null | tr -d '\r')")"
            TARGET_DIR="$WIN_HOME/Code/User"
        else
            TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/Code/User"
        fi
        ;;
    MINGW*|MSYS*|CYGWIN*)
        TARGET_DIR="$APPDATA/Code/User"
        ;;
    *)
        echo "error: unsupported OS '$(uname -s)'" >&2
        exit 1
        ;;
esac

echo "Project:  $VSCODE_DIR"
echo "Target:   $TARGET_DIR"
echo

# Verify source files exist
for file in settings.json extensions.json; do
    if [ ! -f "$VSCODE_DIR/$file" ]; then
        echo "error: $VSCODE_DIR/$file not found" >&2
        exit 1
    fi
done

# Create target directory if needed
mkdir -p "$TARGET_DIR"

# Link each file
for file in settings.json extensions.json; do
    src="$VSCODE_DIR/$file"
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
echo "done. Restart VSCode to apply."
