# dotfiles

```yaml
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

### 1. Install Homebrew, Git, and Stow

[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) is a symlink manager used to link configuration packages into the home directory.

```shell
# mac
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git stow

# OR arch
sudo pacman -S git stow
```

### 2. Activate the SSH Agent in 1Password

Settings → Developer → SSH Agent → **Use the SSH Agent**

### 3. Clone the Repository

```shell
git clone git@github.com:hallaji/dotfiles.git ~/.dotfiles
```

## Setup

### 1. Symlink Packages

Use `stow` to symlink configuration packages into the home directory.

```shell
# Essential packages (required)
stow env bin gnustow

# Mac-specific
stow aerospace alfred borders skhd sketchybar yabai

# Linux-specific
stow hyprland

# Other packages
stow alacritty asdf aws bat bundler claude ctags curl devbox gh git gradle granted \
     gpg lazygit neovim nix npm oh-my-posh p10k pip process-compose ssh starship \
     tig tmux vim vimium zsh 1password
```

### 2. Configure Personal Settings

The `config/env` package contains base environment variables covering paths, editor
preferences, platform detection, and tool configuration. Run `dotup personal` to
interactively configure personal settings including tokens, signing keys, and user
information, stored outside the repo at `~/.local/personal/env`.

### 3. Provision Tools

The `dotup` command handles both fresh installs and ongoing maintenance of tools and configurations.

<!-- Keep this table in sync with the dotup dispatcher and _dotup_completion;
     tests/unit/dotup-sync.bats enforces it. -->

| Command          | Description                  |
| ---------------- | ---------------------------- |
| `dotup`          | Run all                      |
| `dotup arch`     | Arch-specific installations  |
| `dotup asdf`     | ASDF plugins                 |
| `dotup cli`      | CLI tools                    |
| `dotup doctor`   | Health checks                |
| `dotup mac`      | macOS-specific installations |
| `dotup personal` | Personal settings            |
| `dotup services` | System services              |
| `dotup shell`    | Shell installations          |
| `dotup vim`      | Vim/Neovim installations     |

---

> _Reload your terminal. Dotfiles are now fresh!_

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="24" height="24">
</a>
