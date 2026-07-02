# ██╗███╗   ██╗██╗████████╗
# ██║████╗  ██║██║╚══██╔══╝
# ██║██╔██╗ ██║██║   ██║
# ██║██║╚██╗██║██║   ██║
# ██║██║ ╚████║██║   ██║
# ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝

# ┌─┐┌┬┐┌─┐┌┐┌┬┌─
# ├─┘ │ ├┤ │││├┴┐
# ┴   ┴ └─┘┘└┘┴ ┴
# https://github.com/romkatv/powerlevel10k

# Enable Powerlevel10k instant prompt — only when p10k is the selected prompt
if [[ "$PROMPT_ENGINE" == "p10k" ]] &&
  [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ┌─┐ ┬ ┬┌─┐┌┬┐┌─┐
# │─┼┐│ ││ │ │ ├┤
# └─┘└└─┘└─┘ ┴ └─┘
# Greet with a quote once per session.
if [[ -z "${_QUOTE_SHOWN:-}" ]] && command -v quote &>/dev/null; then
  quote 2>/dev/null && _QUOTE_SHOWN=1
fi
