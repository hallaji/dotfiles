#!/usr/bin/env bash
# ██████╗ ██████╗ ███████╗██╗    ██╗
# ██╔══██╗██╔══██╗██╔════╝██║    ██║
# ██████╔╝██████╔╝█████╗  ██║ █╗ ██║
# ██╔══██╗██╔══██╗██╔══╝  ██║███╗██║
# ██████╔╝██║  ██║███████╗╚███╔███╔╝
# ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝

# @see https://formulae.brew.sh/

brew tap homebrew/core
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers


cat <<-MESSAGE
┌─┐┌─┐┬─┐┌┬┐┬ ┬┬  ┌─┐┌─┐
├┤ │ │├┬┘││││ ││  ├─┤├┤
└  └─┘┴└─┴ ┴└─┘┴─┘┴ ┴└─┘
MESSAGE
FORMULAE=(
  zsh                        # UNIX shell (command interpreter)
  neovim                     # Ambitious Vim-fork focused on extensibility and agility
  vim                        # Vi 'workalike' with many additional features
  gnupg                      # GNU Pretty Good Privacy (PGP) package
  fzf                        # Command-line fuzzy finder written in Go
  pinentry-mac               # Pinentry for GPG on Mac
  git                        # Distributed revision control system
  tig                        # Text interface for Git repositories
  awscli                     # Official Amazon AWS command-line interface
  wget                       # Internet file retriever
  nmap                       # Port scanning utility for large networks
  jo                         # JSON output from a shell
  jq                         # Lightweight and flexible command-line JSON processor
  tldr                       # Simplified and community-driven man pages
  links                      # Lynx-like WWW browser that supports tables, menus, etc.
  calc                       # Arbitrary precision calculator
  watch                      # Executes a program periodically, showing output fullscreen
  figlet                     # Banner-like program prints strings as ASCII art
  sqlite                     # Command-line interface for SQLite
  starship                   # Cross-shell prompt for astronauts
  tree                       # Display directories as trees
  tmux                       # Terminal multiplexer
  direnv                     # Load/unload environment variables based on $PWD
  docker                     # Pack, ship and run any application as a lightweight container
  gnupg                      # GNU Pretty Good Privacy (PGP) package
  htop                       # Improved top (interactive process viewer)
  ctop                       # Top-like interface for container metrics
  jenv                       # Manage your Java environment
  maven                      # Java-based project management
  nvm                        # Manage multiple Node.js versions
  poetry                     # Python package management tool
  pyenv                      # Python version management
  pyenv-virtualenv           # Pyenv plugin to manage virtualenv
  typescript                 # Language for application scale JavaScript development
  dfu-programmer             # Device firmware update based USB programmer for Atmel chips
  dfu-util                   # USB programmer
  imagemagick                # Tools and libraries to manipulate images in many formats
  ddgr                       # DuckDuckGo from the terminal
  googler                    # Google from the terminal
  coreutils                  # GNU File, Shell, and Text utilities
  showkey                    # Simple keystroke visualizer
  gopls                      # Language server for the Go language https://github.com/golang/tools/tree/master/gopls
)
brew install ${FORMULAE[@]}


cat <<-MESSAGE
┌─┐┌─┐┌─┐┬┌─┌─┐
│  ├─┤└─┐├┴┐└─┐
└─┘┴ ┴└─┘┴ ┴└─┘
MESSAGE
CASKS=(
  alacritty                  # GPU-accelerated terminal emulator
  iterm2                     # Terminal emulator as alternative to Apple's Terminal app
  gpg-suite                  # Tools to protect your emails and files
  google-cloud-sdk           # Set of tools to manage resources and applications hosted on Google Cloud
  hey                        # Email provider
  google-chrome              # Google chrome web browser
  firefox                    # Firefox web browser
  1password                  # Password manager
  sketch                     # Digital design and prototyping platform
  slack                      # Team communication and collaboration software
  discord                    # Voice and text chat software
  skype                      # Video chat, voice call and instant messaging application
  zoom                       # Video communication and virtual meeting platform
  visual-studio-code         # Open-source code editor
  dbeaver-community          # Universal database tool and SQL client
  docker                     # App to build and share containerized applications and microservices
  little-snitch              # Host-based application firewall
  micro-snitch               # Monitors and reports any microphone and camera activity
  istat-menus                # System monitoring app
  miro                       # Online collaborative whiteboard platform
  notion                     # App to write, plan, collaborate, and get organized
  fork                       # GIT client
  github                     # Desktop client for GitHub repositories
  hyper                      # Terminal built on web technologies
  postman                    # Collaboration platform for API development
  insomnia                   # HTTP and GraphQL Client
  alfred                     # Application launcher and productivity software
  launchbar                  # Productivity tool
  gifox                      # GIF recording and sharing app
  the-unarchiver             # Unpacks archive files
  virtualbox                 # Free and open-source hosted hypervisor for x86 virtualization
  commander-one              # Two-panel file manager
  kindle                     # Interface for reading and syncing eBooks
  spotify                    # Music streaming service
  steam                      # Video game digital distribution service
  qmk-toolbox                # A Toolbox companion for QMK Firmware
  openvpn-connect            # OpenVPN Connect client
)
brew install --cask ${CASKS[@]}


cat <<-MESSAGE
┌─┐┌─┐┌┐┌┌┬┐┌─┐
├┤ │ ││││ │ └─┐
└  └─┘┘└┘ ┴ └─┘
MESSAGE
FONTS=(
  font-jetbrains-mono
  font-fira-code
  font-fira-code-nerd-font
  # Roboto
  # Ubuntu mono
  # DroidSerif
)
brew install --cask ${FONTS[@]}
