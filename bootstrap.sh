#!/usr/bin/env bash
#
# bootstrap.sh — Symlink dotfiles into place
# Run from ~/dotfiles after backing up originals
#

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🔧 Breezy ThinkPad Dotfiles Bootstrap"
echo "====================================="
echo ""

# Files at the home level (home/* → ~/.*)
echo "📁 Installing home dotfiles..."
for f in "$DOTFILES_DIR"/home/*; do
  name=".$(basename "$f")"
  target="$HOME/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$target" "$BACKUP_DIR/$name"
    echo "  ✱ backed up $name"
  fi

  ln -sf "$f" "$target"
  echo "  ✓ $name"
done

# Wallpapers
echo ""
echo "🖼️  Installing wallpapers..."
mkdir -p "$HOME/Pictures/wallpapers"
for f in "$DOTFILES_DIR"/home/Pictures/wallpapers/*; do
  name="$(basename "$f")"
  target="$HOME/Pictures/wallpapers/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mkdir -p "$BACKUP_DIR/Pictures/wallpapers"
    cp "$target" "$BACKUP_DIR/Pictures/wallpapers/$name"
    echo "  ✱ backed up $name"
  fi

  ln -sf "$f" "$target"
  echo "  ✓ $name"
done

# .config/* files
echo ""
echo "⚙️  Installing .config files..."
for dir in "$DOTFILES_DIR"/.config/*/; do
  dirname="$(basename "$dir")"
  target_dir="$HOME/.config/$dirname"
  mkdir -p "$target_dir"

  for f in "$dir"*; do
    name="$(basename "$f")"
    target="$target_dir/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      mkdir -p "$BACKUP_DIR/.config/$dirname"
      cp "$target" "$BACKUP_DIR/.config/$dirname/$name"
      echo "  ✱ backed up .config/$dirname/$name"
    fi

    ln -sf "$f" "$target"
    echo "  ✓ .config/$dirname/$name"
  done
done

echo ""
echo "✨ Done!"
if [ -d "$BACKUP_DIR" ]; then
  echo "  Backups saved to: $BACKUP_DIR"
fi
echo ""
echo "🚀 Reload i3:  \$mod+Shift+c"
echo "🔒 Lock test:  loginctl lock-session"