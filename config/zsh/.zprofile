# ███████╗██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ╚══███╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#   ███╔╝ ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
#  ███╔╝  ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ███████╗██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

TEMPLATE_FILES=(
  ~/.netrc.template
  ~/.gitconfig.template
  ~/.gitmessage.template
  ~/.gnupg/gpg-agent.conf.template
  ~/.gnupg/gpg.conf.template
  ~/.bundle/config.template
)

# Replace placeholders for environment variables in template files
for file in "${TEMPLATE_FILES[@]}"; do
  if [ -f "$file" ]; then
    if type envsubst >/dev/null 2>&1; then
      envsubst < "$file" > "${file%.template}"
    else
      cat "$file" > "${file%.template}"
    fi
  fi
done
