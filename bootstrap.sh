#!/usr/bin/env bash
# New Mac, from scratch. Run this once. Re-runnable if anything fails partway.
#
#   curl -fsSL https://raw.githubusercontent.com/krukah/homestead/main/bootstrap.sh | bash
#
# Ordering matters: get the shell wired up (stow + oh-my-zsh) before the big
# `brew bundle`, so a single bad formula doesn't leave us with no dotfiles.
set -euo pipefail

REPO_URL="https://github.com/krukah/homestead.git"
REPO_DIR="$HOME/Code/homestead"

step() { printf "\n\033[1;34m==>\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m!!\033[0m %s\n" "$*"; }

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

step "Essentials (stow + gh)"
# Need these before the dotfile + bundle steps. Keep this list tiny.
brew install stow gh

step "Stow dotfiles"
# git only preserves the executable bit, so re-tighten sensitive files first.
chmod 0600 home/.ssh/config home/.aws/config
# --restow makes this idempotent: removes existing symlinks and re-creates them.
stow --restow --target="$HOME" home
[[ -d "$HOME/.ssh" ]] && chmod 0700 "$HOME/.ssh"

step "oh-my-zsh"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

step "brew bundle (non-fatal — partial failures are OK)"
# A single broken formula shouldn't kill the rest of bootstrap. Re-run
# `brew bundle install --file=Brewfile` later to retry stragglers.
brew bundle install --file=Brewfile || warn "brew bundle had failures; review above and re-run later"

step "gh auth"
gh auth status >/dev/null 2>&1 || gh auth login

step "Toolchains"
bash scripts/toolchains.sh || warn "toolchains.sh had failures; re-run after fixing"

step "macOS defaults"
bash scripts/defaults.sh || warn "defaults.sh had failures"

step "VS Code extensions"
if command -v code >/dev/null; then
  xargs -L1 code --install-extension < vscode-extensions.txt || warn "some vscode extensions failed"
else
  warn "vscode (code CLI) not on PATH — skipping extensions"
fi

step "Done. Manual leftovers:"
cat <<'EOF'
  - SSH/GPG keys (1Password 8 SSH agent recommended)
  - ~/.zshrc.local with OPENAI_API_KEY, ANTHROPIC_API_KEY
  - aws configure sso
  - gcloud auth login (if needed)
  - 1Password: op signin
  - iCloud, Mac App Store, fonts
  - Open a new terminal: oh-my-zsh prompt should be live
EOF
