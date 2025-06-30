#!/bin/bash

set -e

# Função para criar symlink com backup opcional
link_file() {
  src="$1"
  dest="$2"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "[!] Found existing file: $dest — creating backup as $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  if [ -L "$dest" ]; then
    echo "[i] Symlink already exists: $dest"
  else
    ln -s "$src" "$dest"
    echo "[+] Linked $dest → $src"
  fi
}

echo "=== Linking dotfiles from ~/Documents/manjaro ==="

# i3 config
link_file "$HOME/Documents/manjaro/.config/i3/config" "$HOME/.config/i3/config"

# Alacritty
link_file "$HOME/Documents/manjaro/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# xprofile
link_file "$HOME/Documents/manjaro/.xprofile" "$HOME/.xprofile"

# Vim
link_file "$HOME/Documents/manjaro/.vimrc" "$HOME/.vimrc"

echo "=== Done. Configs linked. ==="

