# ██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
# ██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
# ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
# ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
# ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
# ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

# ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐   ┬   ┬ ┬┬┌┬┐┌─┐┌─┐┌┬┐┌─┐
# │ │├─┘ │ ││ ││││└─┐  ┌┼─  ││││ │││ ┬├┤  │ └─┐
# └─┘┴   ┴ ┴└─┘┘└┘└─┘  └┘   └┴┘┴─┴┘└─┘└─┘ ┴ └─┘

KEYTIMEOUT=20  # Snappy Esc->normal while keeping multi-key commands (dd/cc) typable

# `vv` (normal mode) opens the command line in $EDITOR
autoload -Uz edit-command-line; zle -N edit-command-line

# Ctrl-F: open the `,f` fzf directory picker, then refresh the prompt path
_fuzzy_cd_widget() {
  ,f
  local precmd; for precmd in $precmd_functions; do $precmd; done
  zle reset-prompt
}
zle -N _fuzzy_cd_widget

# Mirror vi yank/delete to the macOS clipboard (pbcopy); put pulls from pbpaste
for w in vi-yank vi-yank-eol vi-delete vi-delete-char vi-change vi-change-eol vi-kill-eol; do
  eval "_clip-$w() { zle .$w && printf '%s' \"\$CUTBUFFER\" | pbcopy }; zle -N $w _clip-$w"
done
unset w
_clip-vi-put-after()  { CUTBUFFER=$(pbpaste); zle .vi-put-after }
_clip-vi-put-before() { CUTBUFFER=$(pbpaste); zle .vi-put-before }
zle -N vi-put-after  _clip-vi-put-after
zle -N vi-put-before _clip-vi-put-before

# ┌┐ ┬┌┐┌┌┬┐┬┌┐┌┌─┐┌─┐
# ├┴┐││││ │││││││ ┬└─┐
# └─┘┴┘└┘─┴┘┴┘└┘└─┘└─┘

bindkey -v                                  # Enable vi keymap
bindkey -M viins '^?' backward-delete-char  # Backspace deletes past insert point
bindkey -M viins '^H' backward-delete-char  # Ctrl-H deletes past insert point
bindkey -M vicmd 'vv' edit-command-line     # Edit command line in $EDITOR
bindkey '^R' history-search-multi-word      # Fuzzy multi-word history search
bindkey '^P' history-search-backward        # Previous history match (by prefix)
bindkey '^N' history-search-forward         # Next history match (by prefix)
bindkey '^[[A' up-history                   # Up arrow: previous command
bindkey '^[[B' down-history                 # Down arrow: next command
bindkey '^F' _fuzzy_cd_widget               # Ctrl-F: fzf directory picker
bindkey '^A' beginning-of-line              # Jump to line start
bindkey '^E' end-of-line                    # Jump to line end
bindkey '^W' backward-kill-word             # Delete previous word
bindkey '^U' kill-whole-line                # Delete whole line
