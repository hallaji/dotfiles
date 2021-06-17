# Installations

## Command Line Tools (CLT) for macOS

Update CLT from Software Update in System Preferences or run:

```shell
❯ softwareupdate --all --install --force
```

If that doesn't show you any updates, run:

```shell
❯ sudo rm -rf /Library/Developer/CommandLineTools
❯ sudo xcode-select --install
```

## Installing pre-built homebrew packages

```shell
❯ bash -c "`curl -sL https://raw.githubusercontent.com/hallaji/dotfiles/master/brew.sh`"
```

## Installing dependencies from source

```shell
❯ bash -c "`curl -sL https://raw.githubusercontent.com/hallaji/dotfiles/master/source.sh`"
```

## ASDF - Managing multiple runtime versions

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

## SDKMAN - Managing parallel versions of multiple SDK

### Java

```shell
❯ sdk install java x.y.z-adpt
```

### Kotlin

```shell
❯ sdk install kotlin
```

## Manual installations for macOS

Check out [MAC.md](MAC.md) for a list of macOS-specific apps.
