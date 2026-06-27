# ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
# ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
# ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

# Profile detection — maps the machine hostname to a profile name.
# Mirrored by detectProfile in tools/doctor/profile.go; profile_test.go fails if
# the two drift. Keep this fast (no subshells/forks) — it runs on every shell start.
detect_profile() {
  local host="${1:-$(hostname)}"
  case "$host" in
    vhallaji-41NW96) echo "CLTRMP" ;;
    *)               echo "PRSNL" ;;
  esac
}
