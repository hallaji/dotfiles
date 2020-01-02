# dotfiles

My dotfiles are managed by [fresh](https://freshshell.com).

## Installation

#### Automatic
```
$ sh setup.sh
```

#### Manual

First, install [Zplugin](https://github.com/zdharma/zplugin) zsh plugin manager on `~/.zplugin/bin` directory.
```
ZPLUGIN_DIR=~/.zplugin/bin \
  && mkdir -p "$ZPLUGIN_DIR" \
  && git clone https://github.com/zdharma/zplugin.git "$ZPLUGIN_DIR"
```
Then, install [fresh shell](https://freshshell.com) through utilising local files relative to `~/.dotfiles`
as a source. if the directory does not exist, it will clone from the repo. Github is the
default repository if no full Git URL is specified.
```
FRESH_LOCAL_SOURCE=hallaji/dotfiles bash -c "`curl -sL https://get.freshshell.com`"
```

## Usage

```
# Build shell configuration and relevant symlinks.
fresh [install]

# Update sources either remotely or locally using `--local`. This will run fresh install as well.
fresh update --local

# Remove dead symlinks and source repos.
fresh clean

# Search fresh directory `https://github.com/freshshell/fresh/wiki/directory`.
fresh search <something>

# Output each line of `~/.freshrc` along with every source file those lines match.
fresh show
```
