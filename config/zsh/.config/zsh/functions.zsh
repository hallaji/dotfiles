# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

# ┌─┐┬┌─┐┬  ┌─┐┌┬┐
# ├┤ ││ ┬│  ├┤  │
# └  ┴└─┘┴─┘└─┘ ┴
# http://www.figlet.org

# Display text in a selected figlet font
figlet_show() {
  local favorites=(
    "ANSI Shadow"
    "ANSI Regular"
    "Calvin S"
    "halfiwi"
    "wideterm"
  )
  local all_fonts=$(ls ~/.figlet/*.flf | sed 's|.*/||; s|\.flf$||')
  local other_fonts=$(echo "$all_fonts" | grep -vxF -f <(printf '%s\n' "${favorites[@]}"))
  local font=$(
    {
      printf '%s\n' "${favorites[@]}"
      echo "$other_fonts"
    } | fzf --prompt="Select font: "
  )

  if [[ -n "$font" ]]; then
    echo ""
    figlet -d ~/.figlet/ -f "$font" "$@"
  fi
}

# ┌─┐┬┬  ┌─┐┌─┐
# ├┤ ││  ├┤ └─┐
# └  ┴┴─┘└─┘└─┘

# Find a code directory
function ,f() {
  local selected_dir=$(
    find "$CODE" -type d -not -path "*/\.*" -maxdepth 2 \
      | sed "s|^$HOME|~|" \
      | fzf --prompt="Select directory: " --with-nth=1 \
      | sed "s|^~|$HOME|"
  )

  if [[ -n "$selected_dir" ]]; then
    cd "$selected_dir" && zoxide add "$(pwd)"
  fi
}

# Find a code directory and open in the default editor
function ,o() {
  ,f && $EDITOR
}

# Restow all dotfile packages using GNU Stow
stow_dotfiles() {
  packages=($(basename -a "$DOTFILES_HOME"/config/*/))
  cd "$DOTFILES_HOME"
  for package in "${packages[@]}"; do
    stow -R "$package"
  done
  cd "$OLDPWD"
}

# Add Go binaries path to PATH environment variable
add_gopath() {
  export PATH="$PATH:$(go env GOPATH)/bin"
}

# ┌─┐┬ ┬┌─┐
# ├─┤│││└─┐
# ┴ ┴└┴┘└─┘

# Switch AWS profile using fzf selection from config file
change_aws_profile() {
  profile=$(grep -E '\[profile .+]' ~/.aws/config | sed -E 's/\[profile (.+)\]/\1/g' | sort | fzf)
  if [[ -n $profile ]] ; then
    export AWS_PROFILE=$profile
    echo "Switching to $profile…"
    aws sts get-caller-identity > /dev/null 2>&1
    if [ "$?" != "0" ]; then
      aws sso login
    fi
  else
    echo 'No AWS account provided!'
  fi
  zle && { zle reset-prompt; zle -R }
  p10k display -a
}

# Start AWS SSM session with selected EC2 instance
start_ec2_session() {
  INSTANCE_ID=$(
    aws ec2 describe-instances \
      --query "Reservations[*].Instances[*].[InstanceId, State.Name, Tags[?Key=='Name'].Value | [0]]" \
      --output text |
    fzf --header "Select an EC2 Instance" |
    awk '{print $1}'
  )
  if [ -n "$INSTANCE_ID" ]; then
    echo "Starting SSM session with instance ID: $INSTANCE_ID"
    aws ssm start-session --target "$INSTANCE_ID"
  else
    echo "No instance selected."
  fi
}

# ┌─┐┌─┐┌─┐
# │ ┬│  ├─┘
# └─┘└─┘┴

# Switch Google Cloud configuration using fzf selection
change_gcloud_config() {
  config=$(gcloud config configurations list | cut -d' ' -f1 | sed 1d | fzf)
  if [[ -n $config ]] ; then
    echo "Switching to $config…"
    gcloud config configurations activate $config
  else
    echo 'No GCloud config provided!'
  fi
  zle && { zle reset-prompt; zle -R }
  p10k display -a
}

# ┌─┐┬ ┬┌─┐┌┬┐┌─┐┌┬┐
# └─┐└┬┘└─┐ │ ├┤ │││
# └─┘ ┴ └─┘ ┴ └─┘┴ ┴

# Toggle SketchyBar visibility and adjust aerospace window margins
toggle_sketchybar() {
  local config_file="$DOTFILES_HOME/config/aerospace/.aerospace.toml"

  if sketchybar --query bar | grep -q '"hidden": "off"'; then
    echo "Turning off SketchyBar…"
    sketchybar --bar hidden=on
    sed -i '' 's/outer\.top[[:space:]]*=[[:space:]]*.*/outer.top = 20/' "$config_file"
    aerospace reload-config
  else
    echo "Turning on SketchyBar…"
    sketchybar --bar hidden=off
    sed -i '' 's/outer\.top[[:space:]]*=[[:space:]]*.*/outer.top = 46/' "$config_file"
    aerospace reload-config
  fi
}
