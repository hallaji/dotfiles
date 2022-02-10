# Installations

## Command Line Tools (CLT) for macOS

Update CLT from Software Update in System Preferences or run:

```shell
❯ softwareupdate --all --install --force
```

## Homebrew

```shell
❯ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## ASDF

Managing multiple runtime versions.

```shell
❯ asdf install <name> <version> [<version>...]
```

### Go

```shell
❯ asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
❯ asdf install golang latest
❯ asdf global golang latest
```

### Node

```shell
❯ asdf plugin-add nodejs
❯ asdf install nodejs latest
❯ asdf global nodejs latest
```

### Ruby

```shell
❯ asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
❯ asdf install ruby latest
❯ asdf global ruby latest
```

## COC

[Language servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

```shell
:CocInstall coc-tsserver
:CocInstall coc-json
:CocInstall coc-prettier
:CocInstall coc-go
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

## Manual Installations

Check out [MAC.md](MAC.md) for a list of macOS-specific apps and extensions.
