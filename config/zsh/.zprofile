# ███████╗██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ╚══███╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#   ███╔╝ ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
#  ███╔╝  ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ███████╗██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

if [ ! -f ~/.env ] && [ -f ~/.env.example ]; then
  cp ~/.env.example ~/.env
fi

TEMPLATE_FILES=(
  ~/.bundle/config.template
  ~/.config/alacritty/colors.toml.template
  ~/.config/alfred/catamaran.alfredappearance.template
  ~/.config/gh-dash/config.yml.template
  ~/.config/lazygit/config.yml.template
  ~/.config/process-compose/theme.yaml.template
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
      awk '{
        while(match($0, /\$\{[^}]+\}/)) {
          var = substr($0, RSTART+2, RLENGTH-3)
          val = ENVIRON[var]
          $0 = substr($0, 1, RSTART-1) val substr($0, RSTART+RLENGTH)
        }
        print
      }' "$file" > "${file%.template}"
    fi
  fi
done
