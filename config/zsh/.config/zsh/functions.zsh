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

# Pick a figlet font via fzf (favorites first) and render the given text in it
figlet_show() {
  local favorites=(
    "ANSI Shadow"
    "ANSI Regular"
    "Calvin S"
    "halfiwi"
    "wideterm"
  )
  local all_fonts=$(ls ~/.config/figlet/*.flf | sed 's|.*/||; s|\.flf$||')
  local other_fonts=$(echo "$all_fonts" | grep -vxF -f <(printf '%s\n' "${favorites[@]}"))
  local font=$(
    {
      printf '%s\n' "${favorites[@]}"
      echo "$other_fonts"
    } | fzf --prompt="Select font: "
  )

  if [[ -n "$font" ]]; then
    echo ""
    figlet -d ~/.config/figlet/ -f "$font" "$@"
  fi
}

# ┌─┐┬┬  ┌─┐┌─┐
# ├┤ ││  ├┤ └─┐
# └  ┴┴─┘└─┘└─┘

# List candidate code directories under $CODE (tilde-abbreviated)
code_dirs() {
  find "$CODE" -type d -not -path "*/\.*" -maxdepth 2 | sed "s|^$HOME|~|"
}

# Select a directory under $CODE via fzf (args seed the query), cd into it, and add to zoxide
function ,f() {
  local selected_dir=$(
    code_dirs | fzf --prompt="Select directory: " --with-nth=1 --query="$*" | sed "s|^~|$HOME|"
  )

  if [[ -n "$selected_dir" ]]; then
    cd "$selected_dir" && zoxide add "$(pwd)"
  fi
}

# Open the best fuzzy match for the args in $EDITOR (no picker); falls back to ,f when ambiguous
function ,o() {
  local dir=""
  (( $# )) && dir=$(code_dirs | fzf --filter="$*" | head -1 | sed "s|^~|$HOME|")

  if [[ -n "$dir" ]]; then
    cd "$dir" && zoxide add "$(pwd)" && $EDITOR
  else
    ,f "$@" && $EDITOR
  fi
}

# Restow every package under $DOTFILES_HOME/config with GNU Stow (stow -R)
stow_dotfiles() {
  packages=($(basename -a "$DOTFILES_HOME"/config/*/))
  cd "$DOTFILES_HOME"
  for package in "${packages[@]}"; do
    stow -R "$package"
  done
  cd "$OLDPWD"
}

# Append Go's $GOPATH/bin to PATH
add_gopath() {
  export PATH="$PATH:$(go env GOPATH)/bin"
}

# ┌─┐┬ ┬┌─┐
# ├─┤│││└─┐
# ┴ ┴└┴┘└─┘

# Print sorted profile names from an AWS config file (arg, default ~/.aws/config)
aws_profile_names() {
  local config="${1:-$HOME/.aws/config}"
  grep -E '\[profile .+]' "$config" | sed -E 's/\[profile (.+)\]/\1/g' | sort
}

# Select an AWS profile via fzf, export AWS_PROFILE, and sso-login if the session is invalid
change_aws_profile() {
  profile=$(aws_profile_names | fzf)
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
}

# Select an EC2 instance via fzf and open an AWS SSM session to it
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

# Decorate a granted SSO config (stdin) with CLTRMP region/icon lines (stdout)
aws_config_decorate() {
  sed -e '/^\[profile.*-eu\// s/$/\nregion = eu-west-1/g' \
      -e '/^\[profile.*-au\// s/$/\nregion = ap-southeast-2/g' \
      -e '/^\[profile.*-production/ s/$/\ngranted_icon = dollar/g'
}

# Generate ~/.aws/config from Granted SSO, decorated with CLTRMP regions/icons
generate_aws_config() {
  granted sso generate --sso-region us-west-2 https://cultureamp.awsapps.com/start \
    | aws_config_decorate \
    > ~/.aws/config
  echo "CLTRMP AWS config generated at ~/.aws/config"
}

# ┌─┐┌─┐┌─┐
# │ ┬│  ├─┘
# └─┘└─┘┴

# Select a gcloud configuration via fzf and activate it
change_gcloud_config() {
  config=$(gcloud config configurations list | cut -d' ' -f1 | sed 1d | fzf)
  if [[ -n $config ]] ; then
    echo "Switching to $config…"
    gcloud config configurations activate $config
  else
    echo 'No GCloud config provided!'
  fi
  zle && { zle reset-prompt; zle -R }
}

# ┌─┐┬ ┬┌─┐┌┬┐┌─┐┌┬┐
# └─┐└┬┘└─┐ │ ├┤ │││
# └─┘ ┴ └─┘ ┴ └─┘┴ ┴

# Toggle SketchyBar and match the aerospace top gap (46 shown / 20 hidden), then reload
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

# ┌┬┐┌─┐┌┬┐┬ ┬┌─┐
#  │││ │ │ │ │├─┘
# ─┴┘└─┘ ┴ └─┘┴

# Tab-completion for dotup subcommands (see config/bin/.local/bin/dotup).
# Keep these options in sync with the dotup dispatcher and the README table;
# tests/unit/dotup-sync.bats enforces it.
_dotup_completion() {
  local -a options
  options=(
    'arch:Arch-specific installations'
    'asdf:ASDF plugins'
    'cli:CLI tools'
    'doctor:Health checks'
    'mac:MacOS-specific installations'
    'personal:Manage personal settings'
    'services:System services'
    'shell:Shell installations'
    'vim:Vim/Neovim installations'
  )
  _describe 'Dotup options' options
}

compdef _dotup_completion dotup
