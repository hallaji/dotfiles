# dotfiles

```text
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

My dotfiles and shell configurations are managed by [fresh](https://freshshell.com).

## Prerequisites

* Back up and remove existing dotfiles e.g. `.zshrc`, `.vimrc`, `.gitconfig`, etc.
* Install [Homebrew](https://brew.sh/)

## Setup

### Environment Variables

Make a copy of `.envrc.example` to `.envrc` file in the root directory and set your own values. Then, load variables into your environemnt using a tool like [direnv](https://direnv.net).

```shell
❯ direnv allow .
```

### Cloning Dotfiles

This command checks for a `FRESH_LOCAL_SOURCE` variable and tries to clone the repo into `~/.dotfiles`. This means that the entire dotfiles can be set up on a brand new machine by simply running the command above.

> **Note:** If you have forked the repo, just specify your forked repo in `FRESH_LOCAL_SOURCE` variable.

```shell
❯ FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"
```

### Brewing Dependencies

Install and upgrade all dependencies from the freshed and global `~/.Brewfile`.

```shell
❯ brew bundle --global
```

## Fresh

### Install

Run `fresh` or `fresh install` to build shell configuration and relevant symlinks after any change in configurations.

```shell
❯ fresh
```

### Update

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
