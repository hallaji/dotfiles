# ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
# ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
# ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝
# Keep it fast as it runs on every shell start.

# Maps the machine hostname to a profile name.
detect_profile() {
  local host="${1:-$(hostname)}"
  case "$host" in
    vhallaji-41NW96) echo "CLTRMP" ;;
    *)               echo "PRSNL" ;;
  esac
}

# Maps the machine hostname to a friendly display name.
display_hostname() {
  local host="${1:-$(hostname)}"
  case "$(echo "$host" | tr '[:upper:]' '[:lower:]')" in
    vhallaji-41nw96) echo "Monomaran" ;;
    catamaran.local) echo "Catamaran" ;;
    *)               echo "$host" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}' ;;
  esac
}
