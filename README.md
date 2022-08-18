# dotfiles

```text
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

My dotfiles and shell configurations are managed by [fresh](https://freshshell.com). Read [cheat sheet](docs/CHEATSHEET.md)
for current key bindings and commands.

## Prerequisites

- Back up and delete the [listed dotfiles](bin/rm-symlinks) from your machine to let [fresh](https://freshshell.com) create symlinks.
- Install [Homebrew](https://brew.sh/).

## Setup

### 1. Cloning Dotfiles

```shell
❯ FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"
```

This command checks for a repository slug in `FRESH_LOCAL_SOURCE` environment variable and tries to clone it into
`~/.dotfiles`. The entire dotfiles can be set up on a brand new machine by simply running the command above.

### 2. Brewing Dependencies

```shell
❯ brew bundle --global
```

Brew can now facilitate dependencies installations because of a fresh Brewfile symlinked into home directory `~/.Brewfile`.

### 3. Loading Environment Variables

```shell
❯ cd ~/.dotfiles
❯ cp .envrc.example .envrc
❯ direnv edit .
❯ direnv allow .
```

Make a copy of `.envrc.example` to `.envrc` under `~/.dotfiles`, set your own values and load variables into your
environemnt using a tool like [direnv](https://direnv.net).

### 4. Freshing Dotfiles

```shell
❯ fresh
```

The `fresh` or `fresh install` command is available globally and will build shell configuration and relevant symlinks
of your further editions from `~/.dotfiles` to your home directory. However, you need to make sure you have your
environemnt variables loaded before running `fresh` command -- `direnv` may unload variables if you run away from
`~/.dotfiles` directory.

```shell
❯ fresh update
❯ fresh update --local
```

Running `fresh update` will pull all of the integrated sources from thier repositories and remote changes of dotfiles.
In addition, it will run `fresh install` to rebuild them. Specify `--local` option just to pull remote changes
made in dotfiles itself.

---

> _Reload your terminal. Your dot files are now `fresh`._

<a href="https://hallaji.com">
  <img src="https://hallaji.com/assets/fav/fav.svg" widht="48" height="48">
</a>
