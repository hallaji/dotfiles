# ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
# ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#   ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#  ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
# ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝
# ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝

[ -f ~/.env ] && source ~/.env
[ -f "${XDG_PERSONAL_HOME}/env" ] && source "${XDG_PERSONAL_HOME}/env"
source "${XDG_CONFIG_HOME}/zsh/profile.zsh"

# Set profile based on hostname
export PROFILE="$(detect_profile)"

# Ensure /usr/local/bin is in PATH
export PATH="/usr/local/bin:$PATH"
