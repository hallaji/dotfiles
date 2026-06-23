# ███████╗██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
# ╚══███╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#   ███╔╝ ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗
#  ███╔╝  ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝
# ███████╗██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

# Files rendered from ${VAR} placeholders. Tag with ":hex" for tools that need
# alpha-prefixed hex (SketchyBar, JankyBorders): their substituted #rrggbb values
# get converted to 0xffrrggbb afterwards, since envsubst can't do that itself.
TEMPLATE_FILES=(
  ~/.bundle/config.template
  ~/.config/alacritty/colors.toml.template
  ~/.config/alfred/catamaran.alfredappearance.template
  ~/.config/borders/colors.sh.template:hex
  ~/.config/gh-dash/config.yml.template
  ~/.config/lazygit/config.yml.template
  ~/.config/process-compose/theme.yaml.template
  ~/.config/sketchybar/colors.sh.template:hex
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
for entry in "${TEMPLATE_FILES[@]}"; do
  file="${entry%%:*}"
  [ -f "$file" ] || continue
  out="${file%.template}"

  if type envsubst >/dev/null 2>&1; then
    envsubst <"$file" >"$out"
  else
    awk '{
      while(match($0, /\$\{[^}]+\}/)) {
        var = substr($0, RSTART+2, RLENGTH-3)
        val = ENVIRON[var]
        $0 = substr($0, 1, RSTART-1) val substr($0, RSTART+RLENGTH)
      }
      print
    }' "$file" >"$out"
  fi

  if [[ "$entry" == *:hex ]]; then
    sed 's/#\([0-9a-fA-F]\{6\}\)/0xff\1/g' "$out" >"$out.tmp" && mv "$out.tmp" "$out"
  fi
done
