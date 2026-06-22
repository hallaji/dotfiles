# ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
# ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#   ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#  ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
# ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝
# ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝

[ -f ~/.env ] && source ~/.env
[ -f "${XDG_PERSONAL_HOME}/env" ] && source "${XDG_PERSONAL_HOME}/env"

# Set profile based on hostname
case "$(hostname)" in
  vhallaji-41NW96)
    export PROFILE="CLTRMP"
    ;;
  *)
    export PROFILE="PRSNL"
    ;;
esac

# Ensure /usr/local/bin is in PATH
export PATH="/usr/local/bin:$PATH"
