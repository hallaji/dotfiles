# dotfiles

```text
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

> Disclaimer: The configurations are specifically tailored for my personal use.
> Feel free to use them as a reference or inspiration for creating your own
> dotfiles.

## Prerequisites

- [Homebrew](https://brew.sh)
- Ensuring there are no [pre-existing dotfiles](config/bin/.local/bin/rm-symlinks) so that [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html)
  can create symlinks.

## Setup

### 1. Cloning Dotfiles

```shell
FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"
```

This command attempts to clone repository into `~/.dotfiles` and run the
`fresh` command. The [fresh](https://freshshell.com) is used to fetch and build
external configurations such as completions, plugins, fonts, etc from the
remote repositories.

### 2. Environment Variables

```shell
cp config/env/.env.example config/env/.env
```

The `config/env` package contains environment variables used by tools. Replace
values with your own.

### 3. Stowing Packages

```shell
# Essential package
stow env

# Optional packages
stow 1password aerospace alacritty asdf aws bin borders bundler \
     ctags curl gh git gpg homebrew neovim npm pip skhd stow \
     ssh starship tig tmux vim yabai zsh
```

The [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) is a symlink
manager that facilitates the creation of symbolic links from the `config`
directory to target directories (typically the home directory).

### 4. Running Setup

```shell
dotsetup
```

The [script](config/bin/.local/bin/dotsetup) installs Homebrew packages, ASDF,
Vim, Neovim, Tmux and NNN plugins, GitHub CLI extensions, and refreshes
external configurations.

---

> _Reload your terminal. The dotfiles are now fresh!_

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="24" height="24">
</a>
