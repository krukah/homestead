#!/usr/bin/env bash
# New Mac, from scratch. Run this once. Re-runnable if anything fails partway.
#
#   curl -fsSL https://raw.githubusercontent.com/krukah/homestead/main/bootstrap.sh | bash
#
set -euo pipefail

REPO_URL="https://github.com/krukah/homestead.git"
REPO_DIR="$HOME/Code/homestead"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

step() { printf "\n\033[1;34m==>\033[0m %s\n" "$*"; }

step "Xcode CLT"
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Re-run when the install completes."
  exit 0
fi

step "Homebrew"
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

step "Clone repo"
mkdir -p "$(dirname "$REPO_DIR")"
[[ -d "$REPO_DIR/.git" ]] || git clone "$REPO_URL" "$REPO_DIR"
cd "$REPO_DIR"

step "brew bundle"
brew bundle install --file=Brewfile

step "gh auth"
gh auth status >/dev/null 2>&1 || gh auth login

step "oh-my-zsh + plugins"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [[ ! -d "$ZSH_CUSTOM/plugins/you-should-use" ]]; then
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \
    "$ZSH_CUSTOM/plugins/you-should-use"
fi

step "Stow dotfiles"
# git only preserves the executable bit, so re-tighten sensitive files first.
chmod 0600 home/.ssh/config home/.aws/config
stow --target="$HOME" home
[[ -d "$HOME/.ssh" ]] && chmod 0700 "$HOME/.ssh"

step "Toolchains"
bash scripts/toolchains.sh

step "macOS defaults"
bash scripts/defaults.sh

step "VS Code extensions"
command -v code >/dev/null && xargs -L1 code --install-extension < vscode-extensions.txt

step "Done. Manual leftovers:"
cat <<'EOF'
  - SSH/GPG keys (1Password 8 SSH agent recommended)
  - ~/.zshrc.local with OPENAI_API_KEY, ANTHROPIC_API_KEY
  - aws configure sso
  - gcloud auth login (if needed)
  - 1Password: op signin
  - iCloud, Mac App Store, fonts
EOF
