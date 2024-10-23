# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

find_in_directory() {
  dir=$(find $1 -type d -not -path '*/\.*' -maxdepth 2 | fzf)
  if [ $? -eq 0 ]; then
    cd $dir
    if [ ! -z "$2" ] && [ "$2" = "--edit" ]; then
      eval "$EDITOR +Startify"
    fi
  else
    echo 'No directory provided!'
  fi
  zle && { zle reset-prompt; zle -R }
}

change_source_directory() {
  find_in_directory $CODE
}

edit_source_directory() {
  find_in_directory $CODE --edit
}

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
}

start_ec2_session() {
  INSTANCE_ID=$(
    aws ec2 describe-instances \
      --query "Reservations[*].Instances[*].[InstanceId, State.Name, Tags[?Key=='Name'].Value | [0]]" \
      --output table |
    fzf --header "Select an EC2 Instance" |
    awk '{print $2}' |
    sed 's/|$//'
  )
  if [ -n "$INSTANCE_ID" ]; then
    echo "Starting SSM session with instance ID: $INSTANCE_ID"
    aws ssm start-session --target "$INSTANCE_ID"
  else
    echo "No instance selected."
  fi
}

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

add_gopath() {
  export PATH="$PATH:$(go env GOPATH)/bin"
}

stow_dotfiles() {
  packages=($(basename -a "$DOTFILES_HOME"/config/*/))
  cd "$DOTFILES_HOME"
  for package in "${packages[@]}"; do
    stow -R "$package"
  done
  cd "$OLDPWD"
}

fl_fonts() {
  for font in ~/.figlet/*.flf; do
    fontname=$(basename "$font")
    echo "$fontname"
    figlet -d ~/.figlet/ -f "$fontname" "$1"
    echo ""
  done
}
