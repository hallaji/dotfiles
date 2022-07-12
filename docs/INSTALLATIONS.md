# Installations

## Command Line Tools (CLT) for macOS

Update macOS using command line software update tool.

```shell
❯ softwareupdate --all --install --force
```

Download and install the latest Xcode command-line tools.

```shell
❯ xcode-select --install
```

## Homebrew

```shell
❯ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## ASDF

Add plugin via the short-name association in the plugins repository.

```shell
❯ asdf plugin add <name>
```

Install version.

```shell
❯ asdf install <name> <version> [<version>...]
```

Set current version.

- `global` writes the version to $HOME/.tool-versions.
- `shell` set the version to an environment variable named `ASDF_${LANG}_VERSION`, for the current shell session only.
- `local` writes the version to `$PWD/.tool-versions`, creating it if needed.

```shell
❯ asdf global <name> <version> [<version>...]
❯ asdf shell <name> <version> [<version>...]
❯ asdf local <name> <version> [<version>...]
```

### ASDF Plugins

```shell
# `golang`, `nodejs`, `java`, `kotlin`, `python`, `ruby`

❯ asdf plugin add golang
❯ asdf install golang latest
❯ asdf global golang latest
```

## Plug

Install or update vim plugins.

```text
:PlugInstall
:PlugUpdate
```

## COC

[Language servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

```shell
:CocInstall coc-tsserver coc-go coc-kotlin coc-pyright
:CocInstall ccoc-json coc-yaml coc-html coc-css coc-prettier coc-eslint
```

## Tmux Appearance

Run the following commands in vim after any preset update in Tmuxline or theme
change in Airline. It generates a snapshot of current Tmuxline style into a
Tmux config file. Then, `fresh` dotfiles. This results in a same Tmux
statusline in vim and non-vim mode.

```text
:TmuxlineSnapshot! config/tmux/colors.conf
```

## Brew Services

```shell
brew services start yabai
brew services start skhd
brew services start postgresql
```

## SKHD

Trigger a manual reload of the config file.

```shell
skhd --reload
```

Output keycode and modifiers of event

```shell
skhd --observe
```

## Installing/Upgrading Github CLI Extensions

```shell
❯ gh extension install dlvhdr/gh-dash
❯ gh extension install mislav/gh-contrib
❯ gh extension upgrade --all
```

## Manual Installations

- Check out [MAC.md](MAC.md) for a list of macOS-specific apps and extensions.
- Set [shortcuts](./CHEATSHEET.md#mac-specific) for apps.
