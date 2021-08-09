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

* Back up and delete the [listed dotfiles](docs/FRESH.md) from your machine to let [fresh](https://freshshell.com) create symlinks.
* Install [Homebrew](https://brew.sh/).

## Setup

### 1. Cloning Dotfiles

This command checks for a `FRESH_LOCAL_SOURCE` variable and tries to clone the repo into `~/.dotfiles`. This means that the entire dotfiles can be set up on a brand new machine by simply running the command below.

> **Note:** If you have forked the repo, just specify your forked repo in `FRESH_LOCAL_SOURCE` variable.

```shell
❯ FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"
```

The `fresh` command is now available to run globally and will symlink your further editions from `~/.dotfiles` to your home directory.


### 2. Brewing Dependencies

A fresh Brewfile is symlinked into home directory `~/.Brewfile`. Install and upgrade all the dependencies using the command below.

```shell
❯ brew bundle --global
```

### 3. Freshing Dotfiles with Environment Variables

Make a copy of `.envrc.example` to `.envrc` under `~/.dotfiles` and set your own values. Then, load variables into your environemnt using a tool like [direnv](https://direnv.net).

```shell
❯ cd ~/.dotfiles
❯ cp .envrc.example .envrc
❯ direnv edit .
❯ direnv allow .
```

You need to make sure you have your environemnt variables loaded before running `fresh` command. The `direnv` may unload variables if you run away from `~/.dotfiles`.
In this case, run the command from `~/.dotfiles` to refresh them with your environemnt variables.

```shell
❯ fresh
```

## Further Editions on Dotfiles

### Fresh Install

After any further change in `~/.dotfiles`, you can run `fresh` or `fresh install` to build shell configuration and relevant symlinks.

```shell
❯ fresh
```

### Fresh Update

Running `fresh update` will update dotfiles itself and all integrated sources from GitHub repositories. In addition, it will run `fresh install` to rebuild them.

```shell
❯ fresh update
```

Specify `--local` option to just pull any changes made in dotfiles repo into `~/.dotfiles`.

```shell
❯ fresh update --local
```

### More Options

```shell
❯ fresh help
clean    -- Removes dead symlinks and source repos
edit     -- Open freshrc for editing
help     -- Show this help
install  -- Build shell configuration and relevant symlinks (default)
search   -- Search the fresh directory
show     -- Show source references for freshrc lines
update   -- Update from source repos and rebuild
```

*Reload your terminal. Your dot files are now `fresh`.*
