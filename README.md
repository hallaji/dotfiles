# dotfiles

```text
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

My dotfiles including configurations for both the shell and Vim are managed by [fresh](https://freshshell.com).
Read [cheat sheet](docs/CHEATSHEET.md) for current key bindings and commands.

## Prerequisites

- Ensure there are no [pre-existing dotfiles](bin/rm-symlinks) to allow [fresh](https://freshshell.com)
  to create symlinks.
- Install [Homebrew](https://brew.sh).

## Setup

### 1. Cloning Dotfiles

```shell
FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"
```

This command checks for a repository slug in `FRESH_LOCAL_SOURCE` environment variable
and tries to clone it into `~/.dotfiles`. The entire dotfiles can be set up on a
brand new machine by simply running the command above.

### 2. Running Setup Binary

```
dotsetup
```

This script is now accessible and automates the process of setting up and configuring
a development environment. It handles plugin and tool management using the ASDF
version manager, installs Homebrew packages, installs Vim plugins, GitHub CLI
extensions, and more such as nnn plugins. Additionally, it initiates specific
services like yabai, skhd, and sketchybar.

> Note: Brew can facilitate dependencies installations because of a fresh Brewfile
> symlinked into home directory `~/.Brewfile`.

### 3. Loading Environment Variables

```shell
cd ~/.dotfiles
cp .envrc.example .envrc
direnv edit .
direnv allow .
```

Make a copy of `.envrc.example` to `.envrc` under `~/.dotfiles` if it hasn't been
done already, set your own values and load variables into your environemnt using
[direnv](https://direnv.net). The exports from the `.envrc` file will also be loaded
globally through the `direnvrc` and `.zshenv` file.

### 4. Freshing Dotfiles

```shell
fresh
```

The `fresh` or `fresh install` command is available globally and will build shell
configuration and relevant symlinks of your further editions from `~/.dotfiles`
to your home directory. However, you need to make sure you have your environemnt
variables loaded before running `fresh` command -- `direnv` may unload variables
if you run away from `~/.dotfiles` directory.

```shell
fresh update
fresh update --local
```

Running `fresh update` will pull all of the integrated sources from thier repositories
and remote changes of dotfiles. In addition, it will run `fresh install` to rebuild
them. Specify `--local` option just to pull remote changes made in dotfiles itself.

---

> _Reload your terminal. Your dot files are now `fresh`._

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="48" height="48">
</a>
