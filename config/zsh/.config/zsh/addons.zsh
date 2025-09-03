#  █████╗ ██████╗ ██████╗  ██████╗ ███╗   ██╗███████╗
# ██╔══██╗██╔══██╗██╔══██╗██╔═══██╗████╗  ██║██╔════╝
# ███████║██║  ██║██║  ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══██║██║  ██║██║  ██║██║   ██║██║╚██╗██║╚════██║
# ██║  ██║██████╔╝██████╔╝╚██████╔╝██║ ╚████║███████║
# ╚═╝  ╚═╝╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝

# ┌─┐┬┌┐┌┬┌┬┐
# ┌─┘│││││ │
# └─┘┴┘└┘┴ ┴
# https://github.com/zdharma-continuum/zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

# ┌─┐┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
# │  │ ││││├─┘│  ├┤  │ ││ ││││└─┐
# └─┘└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘└─┘

zinit light zsh-users/zsh-completions
type brew &>/dev/null && fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
type assume &>/dev/null && fpath=(~/.granted/zsh_autocomplete/assume/ $fpath)
type granted &>/dev/null && fpath=(~/.granted/zsh_autocomplete/granted/ $fpath)

autoload -Uz compinit && compinit

# ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
# ├─┘│  │ ││ ┬││││└─┐
# ┴  ┴─┘└─┘└─┘┴┘└┘└─┘

zinit light Aloxaf/fzf-tab # https://github.com/Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting # https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
zinit load zdharma-continuum/history-search-multi-word # https://github.com/zdharma-continuum/history-search-multi-word

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit snippet OMZP::brew
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::common-aliases
zinit snippet OMZP::git
zinit snippet OMZP::vi-mode
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# ┌─┐┌┬┐┬ ┬┬  ┌─┐┌─┐
# └─┐ │ └┬┘│  ├┤ └─┐
# └─┘ ┴  ┴ ┴─┘└─┘└─┘

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Set list-colors to enable filename colorizing
zstyle ':completion:*' menu no # Disable completion menu
zstyle ':completion:*:git-checkout:*' sort false # Disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]' # Set descriptions format to enable group support
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # Preview directory's content
zstyle ':fzf-tab:*' switch-group '<' '>' # Switch between groups using `<` and `>`
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup # Open fzf-tab in a tmux popup window
zstyle ':fzf-tab:*' use-fzf-default-opts yes # Follow FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' popup-min-size 60 10 # Set minimum popup size (width, height)

# ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
# ├─┤│└─┐ │ │ │├┬┘└┬┘
# ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴

# Shell variables
HISTSIZE=10000 # Number of commands to remember in the command history
HISTFILE=~/.zsh_history # File to save command history
SAVEHIST=$HISTSIZE # Number of history entries to save to the history file
HISTDUP=erase # When a duplicate command is added, remove the previous instance

# Shell options (on/off states)
setopt inc_append_history # Write to the history file immediately, not when the shell exits
setopt append_history # Allow multiple sessions to append to one Zsh command history
setopt share_history # Share history between different instances of the shell
setopt extended_history # Show timestamp in history
setopt hist_expire_dups_first # Expire a duplicate event first when trimming history
setopt hist_find_no_dups # Do not display a previously found event
setopt hist_ignore_dups # Do not record an event that was just recorded again
setopt hist_ignore_all_dups # Remove older duplicate entries from history
setopt hist_ignore_space # Do not record an event starting with a space
setopt hist_reduce_blanks # Remove superfluous blanks from history items
setopt hist_save_no_dups # Do not write a duplicate event to the history file
setopt hist_verify # Do not execute immediately upon history expansion
setopt hist_beep # Beep when accessing non-existent history entry
setopt hist_fcntl_lock # Use fcntl for file locking (safer)
setopt hist_no_functions # Don't save function definitions to history
setopt hist_no_store # Remove 'history' command from history
