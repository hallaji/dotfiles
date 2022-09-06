
# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

find_in_directory() {
  dir=$(find $1 -type d -not -path '*/\.*' -maxdepth 2 | fzf)
  cd $dir
  if [ ! -z "$2" ] && [ "$2" = "--edit" ]; then
    eval "$EDITOR ."
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
    zle && { zle reset-prompt; zle -R }
  else
    echo 'no AWS account provided!'
    exit 1
  fi
}

change_gcloud_config() {
  config=$(gcloud config configurations list | cut -d' ' -f1 | sed 1d | fzf)
  if [[ -n $config ]] ; then
    gcloud config configurations activate $config
    zle && { zle reset-prompt; zle -R }
  else
    echo 'no Gcloud config provided!'
    exit 1
  fi
}
