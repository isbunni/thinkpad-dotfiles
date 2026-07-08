# 🐱 Breezy's Dotfiles — ThinkPad

> EndeavourOS · i3 · Polybar · Kitty · Kanagawa Theme

Sister repo to [mcfarlands-dotfiles](https://github.com/brendenbrscoe/mcfarlands-dotfiles) (desktop).

## What's Here

| What | Where |
|---|---|
| **i3 config** | `.config/i3/config` |
| **Polybar** | `.config/polybar/` |
| **Kitty terminal** | `.config/kitty/kitty.conf` |
| **Dunst notifications** | `.config/dunst/dunstrc` |
| **Picom compositor** | `.config/picom/picom.conf` |
| **Rofi launcher** | `.config/rofi/*.rasi` |
| **GTK/Qogir theme** | `.config/gtk-3.0/`, `.gtkrc-2.0` |
| **X resources** | `home/.Xresources` |
| **Shell (zsh)** | `home/.zshrc` |
| **Starship prompt** | `.config/starship/starship.toml` |
| **Neovim** | `.config/nvim/init.lua` |
| **Wallpapers** | `home/Pictures/wallpapers/*.jpg` |

## Bootstrap

```bash
cd ~/dotfiles && ./bootstrap.sh
```

Will symlink everything into place. **Make a backup first.**

## Theme

- **WM:** i3wm with 10px gaps, gruvbox-dark colors
- **Terminal:** Kitty 0.9 opacity with Kanagawa wave colors
- **Bar:** Polybar (top, Kanagawa-inspired palette)
- **Notifications:** Dunst (bottom-right, purple accent)
- **Compositor:** Picom with 12px rounded corners, blur, shadows
- **Launcher:** Rofi (drun mode, gruvbox-dark)
- **Font:** JetBrainsMono Nerd Font
- **Wallpaper:** Kanagawa wave 🌊