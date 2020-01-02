alias ,c="clear"
alias ,r="source ~/.zshrc && source ~/.zshenv && clear"
alias internet\?="ping 8.8.8.8"

alias sleep="pmset sleepnow" # mac-specific

alias ,ez="$EDITOR ~/.zshrc"
alias ,eze="$EDITOR ~/.zshenv"

alias h='history'
alias hsi='history | grep $* -i'

open_my_code() {
  eval "$EDITOR $CODE/$*"
}

alias c="open_my_code"


alias gitwho="git config user.name && git config user.email"
alias gitme="git config user.email vahid@hallaji.com"
alias gitbueno="git config user.email vhallaji@buenosystems.com.au"

alias dotfile="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias tdf="dotfile config --local status.showUntrackedFiles normal"
alias utdf="dotfile config --local status.showUntrackedFiles no"


# ```
# git log origin/master --shortstat --since "1 year ago" | \
#         grep "files changed" | \
#         awk '{files+=$1; inserted+=$4; deleted+=$6} END {print files, "files changed\n", inserted, "lines inserted\n", deleted, "lines deleted"}'
# ```

# ```
# git rev-list --count HEAD --since="1 year ago"
# ```

