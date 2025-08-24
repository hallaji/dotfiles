# ███████╗██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ╚══███╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#   ███╔╝ ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
#  ███╔╝  ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ███████╗██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

TEMPLATE_FILES=(
  ~/.bundle/config.template
  ~/.config/alacritty/colors.toml.template
  ~/.gitconfig.template
  ~/.gitmessage.template
  ~/.gnupg/gpg-agent.conf.template
  ~/.gnupg/gpg.conf.template
  ~/.gradle/gradle.properties.template
  ~/.netrc.template
  ~/.npmrc.template
  ~/.ssh/config.template
)

# Replace placeholders for environment variables in template files
for file in "${TEMPLATE_FILES[@]}"; do
  if [ -f "$file" ]; then
    if type envsubst >/dev/null 2>&1; then
      envsubst <"$file" >"${file%.template}"
    else
      cat "$file" >"${file%.template}"
    fi
  fi
done

if [ ! -f ~/.env ] && [ -f ~/.env.example ]; then
  cp ~/.env.example ~/.env
fi
