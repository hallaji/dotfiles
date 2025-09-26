# dotfiles

```text
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

> These configurations are heavily tailored for my personal use.

## Prerequisites

The [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) is a symlink
manager that facilitates the creation of symbolic links from the `config`
directory to target directories (typically the home directory).

```shell
sudo pacman -S stow # arch
# OR
brew install stow # mac
```

## Setup

### 1. Environment Variables

The `config/env` package contains environment variables used by tools. Copy the
example file and replace values with your own.

```shell
cp config/env/.env.example config/env/.env
```

### 2. Stowing Configurations

```shell
# Essential packages
stow env bin gnustow

# Mac-specific
stow aerospace borders skhd sketchybar yabai

# Linux-specific
stow hyprland

# Other packages
stow alacritty asdf aws bundler claude ctags curl devbox gh git gradle granted \
     gpg lazygit neovim nix npm p10k pip process-compose ssh starship tig tmux \
     vim zsh 1password
```

### 3. Setup

The `dotup` command installs and updates tools and configurations.

```shell
dotup [arch|asdf|cli|mac|services|shell|vim]
```

---

> _Reload your terminal. Dotfiles are now fresh!_

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="24" height="24">
</a>
