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

```shell
cp config/env/.env.example config/env/.env
```

The `config/env` package contains environment variables used by tools. Copy the
example file and replace values with your own.

### 2. Stowing Configurations

```shell
# Required package
stow env

# Essential packages
stow bin freshshell gnustow homebrew

# Optional packages
stow 1password aerospace alacritty asdf aws borders bundler \
     ctags curl gh git gpg neovim npm pip skhd ssh starship \
     tig tmux vim yabai zsh granted
```

The [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) is a symlink
manager that facilitates the creation of symbolic links from the `config`
directory to target directories (typically the home directory).

### 3. Freshing Dependencies

```shell
fresh
```

The [Freshshell](https://freshshell.com) tool is used to fetch and integrate
external configurations such as completions, plugins, fonts, and more from
online repositories. During the build process, the [setup
script](config/bin/.local/bin/dotup) installs or updates tools, packages,
plugins, as well as CLI extensions.

---

> _Reload your terminal. The dotfiles are now fresh!_

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="24" height="24">
</a>
