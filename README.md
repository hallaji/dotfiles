# dotfiles

```text
╭─────────────────────────────────────────────────────────────────╮
│  ●  ●  ●                 ~/.dotfiles                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗  │
│  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝  │
│  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗  │
│  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║  │
│  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║  │
│  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝  │
│                                                                 │
│   ❯ home is where the $HOME is — stow it, source it, ship it.   │
╰─────────────────────────────────────────────────────────────────╯
```

> These configurations are heavily tailored for my personal use.

## Prerequisites

Install [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html), a symlink manager used to link configuration packages into the home directory.

```shell
sudo pacman -S stow # arch
# OR
brew install stow # mac
```

## Setup

### 1. Symlink Packages

Use `stow` to symlink configuration packages into the home directory.

```shell
# Essential packages (required)
stow env bin gnustow

# Mac-specific
stow aerospace borders skhd sketchybar yabai

# Linux-specific
stow hyprland

# Other packages
stow alacritty asdf aws bat bundler claude ctags curl devbox gh git gradle granted \
     gpg lazygit neovim nix npm p10k pip process-compose ssh starship tig tmux \
     vim zsh 1password
```

### 2. Configure Personal Settings

The `config/env` package contains base environment variables covering paths, editor
preferences, platform detection, and tool configuration. Run `dotup personal` to
interactively configure personal settings including tokens, signing keys, and user
information, stored outside the repo at `~/.local/personal/env`.

### 3. Provision Tools

The `dotup` command handles both fresh installs and ongoing maintenance of tools and configurations.

| Command           | Description                    |
| ----------------- | ------------------------------ |
| `dotup`           | Run all                        |
| `dotup arch`      | Arch-specific installations    |
| `dotup asdf`      | ASDF plugins                   |
| `dotup cli`       | CLI tools                      |
| `dotup mac`       | macOS-specific installations   |
| `dotup personal`  | Personal settings              |
| `dotup services`  | System services                |
| `dotup shell`     | Shell installations            |
| `dotup vim`       | Vim/Neovim installations       |

---

> _Reload your terminal. Dotfiles are now fresh!_

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="24" height="24">
</a>
