tap "auth0/auth0-cli"
tap "hashicorp/tap"
tap "pulumi/tap"
# Tool for generating GNU Standards-compliant Makefiles
brew "automake"
# Bourne-Again SHell, a UNIX command interpreter (macOS ships 3.2; SDKMAN needs 4+)
brew "bash"
# Curl like simplicity to access AWS resources
brew "awscurl"
# GNU binary tools for native development
brew "binutils"
# Resource monitor. C++ version and continuation of bashtop and bpytop
brew "btop"
# Dependency manager for Cocoa projects
brew "cocoapods"
# Container runtimes on MacOS (and Linux) with minimal setup
brew "colima"
# Lightweight, framework-agnostic database migration tool
brew "dbmate"
# Collection of reusable C++ library artifacts developed at Facebook
brew "folly"
# C++14 implementation of the TLS-1.3 standard
brew "fizz"
# Modular, composable client/server abstractions framework
brew "wangle"
# Facebook's branch of Apache Thrift, including a new C++ server
brew "fbthrift"
# Thrift functions for querying information from a service
brew "fb303"
# Shared library for Watchman and Eden projects
brew "edencommon"
# Command-line tools for fly.io services
brew "flyctl"
# GitHub command-line tool
brew "gh"
# Distributed revision control system
brew "git"
# Quickly rewrite git repository history
brew "git-filter-repo"
# GNU Privacy Guard (OpenPGP)
brew "gnupg"
# Open source programming language to build simple/reliable/efficient software
brew "go"
# Improved top (interactive process viewer)
brew "htop"
# Generic library support script
brew "libtool"
# Tools and libraries to manipulate images in select formats
brew "imagemagick"
# CLI for Infisical
brew "infisical"
# Apache Kafka C/C++ library
brew "librdkafka"
# Generic command-line non-JVM Apache Kafka producer and consumer
brew "kcat"
# Lazier way to manage everything docker
brew "lazydocker"
# Simple terminal UI for git commands
brew "lazygit"
# Postgres C API library
brew "libpq"
# Mac App Store CLI (used in Brewfile to install Magnet etc.)
brew "mas"
# QUIC transport protocol implementation
brew "mvfst"
# Open source relational database management system
brew "mysql"
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim"
# OCaml package manager
brew "opam"
# Tool for managing OCI containers and pods
brew "podman"
# PDF rendering library (based on the xpdf-3.0 code base)
brew "poppler"
# Object-relational database system
brew "postgresql@17"
# Proof assistant for higher-order logic
brew "rocq"
# Easiest, most secure way to use WireGuard and 2FA
brew "tailscale"
# Executes a program periodically, showing output fullscreen
brew "watch"
# Watch files and take action when they change
brew "watchman"
# Command-line client for WebSockets
brew "websocat"
# Symlink farm manager — used by bootstrap.sh to install dotfiles
brew "stow"
# Programming language designed for robustness, optimality, and clarity
brew "zig"
# Cross-platform make
brew "cmake"
# Package compiler and linker metadata toolkit (provides pkg-config)
brew "pkgconf"
# Small build system for use with gyp or CMake
brew "ninja"
# Static analysis and lint tool, for (ba)sh scripts
brew "shellcheck"
# Autoformat shell script source code (used by the shell-format VS Code ext)
brew "shfmt"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Simple, fast and user-friendly alternative to find
brew "fd"
# Command-line fuzzy finder written in Go
brew "fzf"
# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# Modern, maintained replacement for ls
brew "eza"
# Display directories as trees (with optional color/HTML output)
brew "tree"
# Internet file retriever
brew "wget"
# GNU File, Shell, and Text utilities
brew "coreutils"
# GNU implementation of the famous stream editor
brew "gnu-sed"
# GNU awk utility
brew "gawk"
# Build, manage and test your Auth0 integrations from the command line
brew "auth0/auth0-cli/auth0"
# Terraform
brew "hashicorp/tap/terraform"
# Pulumi - Modern Infrastructure as Code. Any cloud, any language
brew "pulumi/tap/pulumi"
# --- editors / terminals ---
cask "cursor"
cask "ghostty"
cask "sublime-text"
cask "visual-studio-code"
cask "warp"
cask "zed"

# --- dev tools ---
cask "docker-desktop"
cask "msty"
cask "ollama-app"
cask "session-manager-plugin"
cask "wireshark-app"

# --- browsers ---
cask "arc"
cask "firefox"
cask "google-chrome"

# --- ai ---
cask "chatgpt"
cask "claude"
cask "claude-code"

# --- comms ---
cask "discord"
cask "linear"
cask "microsoft-teams"
cask "signal"
cask "slack"
cask "superhuman"
cask "telegram"
cask "whatsapp"
cask "zoom"

# --- utilities ---
cask "1password"
cask "adobe-acrobat-reader"
cask "google-drive"
cask "kap"
cask "notion"
cask "spotify"
cask "stats"
cask "tailscale-app"

# --- mac app store (needs `mas` CLI; brew installs that for us) ---
mas "Magnet", id: 441258766
vscode "1yib.rust-bundle"
vscode "adamsome.vscode-theme-gruvbox-minor"
vscode "amazonwebservices.aws-toolkit-vscode"
vscode "anthropic.claude-code"
vscode "dbaeumer.vscode-eslint"
vscode "dustypomerleau.rust-syntax"
vscode "esbenp.prettier-vscode"
vscode "fill-labs.dependi"
vscode "foxundermoon.shell-format"
vscode "github.vscode-github-actions"
vscode "mhutchie.git-graph"
vscode "ms-azuretools.vscode-containers"
vscode "ms-azuretools.vscode-docker"
vscode "ms-python.debugpy"
vscode "ms-python.isort"
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "ms-python.vscode-python-envs"
vscode "ms-toolsai.jupyter"
vscode "ms-toolsai.jupyter-keymap"
vscode "ms-toolsai.jupyter-renderers"
vscode "ms-vscode-remote.vscode-remote-extensionpack"
vscode "ms-vscode.vscode-typescript-next"
vscode "pkief.material-icon-theme"
vscode "redhat.java"
vscode "rust-lang.rust-analyzer"
vscode "vadimcn.vscode-lldb"
vscode "vscjava.vscode-java-pack"
vscode "yzhang.markdown-all-in-one"
# NOTE: cargo tools live in scripts/toolchains.sh, not here — they need
# `cargo install --locked` (nextest refuses to build without it; trunk's
# dep tree only compiles against its committed lockfile), which the Brewfile
# `cargo` directive can't express.
