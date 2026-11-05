# dotfiles

My non-personal Gentoo Linux dotfiles.

The theme across the setup is **Belafonte Day** (a light palette); kitty,
Neovim, waybar, wofi, cmatrix and the 2bwm/Xresources colors are kept in sync.

## Install

```sh
git clone https://github.com/sxlar333/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh --dry-run   # optional: preview
./install.sh
```

`install.sh` symlinks each file from `home/` into `$HOME`. If a target file
already exists it is moved to `~/.dotfiles-backup-<timestamp>/` first, so
nothing is overwritten. Unrelated files in `~/.config` are left untouched.

To undo the symlinks:

```sh
cd ~/dotfiles && ./install.sh --uninstall
```

## What's included

| Path | Purpose |
| --- | --- |
| `.bashrc`, `.bash_profile`, `.bash_logout` | Bash shell config |
| `.mkshrc` | mksh shell config |
| `.tmux.conf` | tmux (C-Space prefix, vim-style panes) |
| `.vimrc` | Minimal Vim config |
| `.xinitrc`, `.Xresources` | X11 session + 2bwm colors |
| `.config/kitty/` | kitty terminal + Belafonte Day theme |
| `.config/hypr/` | Hyprland (hyprland.lua) |
| `.config/waybar/` | Waybar config, style, wifi/volume scripts |
| `.config/wofi/` | Wofi launcher |
| `.config/fastfetch/` | fastfetch layout |
| `.config/btop/`, `.config/htop/` | Resource monitors |
| `.config/cmatrix/` | cmatrix theme settings |
| `.config/opencode/cli.json` | OpenCode CLI prefs |
| `.config/nvim/` | Neovim config based on [NvChad/starter](https://github.com/NvChad/starter) |

For Vim autopairs, install the plugin separately:

```sh
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/plugin/auto-pairs
```

## Dependencies

Install the packages for the configs you use: `bash`, `mksh`, `tmux`, `vim`,
`neovim`, `kitty`, `hyprland`, `waybar`, `wofi`, `fastfetch`, `btop`, `htop`,
`cmatrix`, `2bwm`, `xorg-xrdb`, `pipewire`/`pactl`, `nmcli`, `grim`, `slurp`,
`playerctl`, `brightnessctl`.

Terminal font: **IosevkaTermSlab Nerd Font Mono**. Neovim bootstraps
`lazy.nvim` and NvChad on first launch; `lua/lazy-lock.json` pins plugins.

## Notes

- Hyprland starts `swaybg` with a wallpaper from `~/Downloads`; adjust that line
  if the image is not present.

