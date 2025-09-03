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

### arch

```shell
sudo bash -c "$(curl -sL https://get.freshshell.com)"
sudo pacman -S stow
```

### macOS

```shell
bash -c "$(curl -sL https://get.freshshell.com)"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow
```

## Setup

### 1. Environment Variables

The `config/env` package contains environment variables used by tools. Copy the
example file and replace values with your own.

```shell
cp config/env/.env.example config/env/.env
```

### 2. Stowing Configurations

The [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) is a symlink
manager that facilitates the creation of symbolic links from the `config`
directory to target directories (typically the home directory).

```shell
# Required package
stow env

# Essential packages
stow bin freshshell gnustow

# Mac-specific
stow aerospace borders skhd sketchybar yabai

# Linux-specific
stow hyprland

# Other packages
stow alacritty asdf aws bundler ctags curl devbox gh git gradle granted gpg \
     neovim nix npm p10k pip process-compose ssh starship tig tmux vim zsh \
     1password
```

### 3. Freshing Dependencies

The [Freshshell](https://freshshell.com) tool is used to fetch and integrate
external configurations such as completions, plugins, fonts, and more from
online repositories. During the build process, the [setup
script](config/bin/.local/bin/dotup) installs or updates tools, packages,
plugins, as well as CLI extensions.

```shell
fresh
```

---

> _Reload your terminal. The dotfiles are now fresh!_

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="24" height="24">
</a>
