#!/usr/bin/env bash
# Install language toolchains. Idempotent — safe to re-run.
# Assumes Homebrew is already installed (handled by bootstrap.sh).
set -euo pipefail

echo "==> rustup (stable + nightly)"
if ! command -v rustup >/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
  source "$HOME/.cargo/env"
fi
rustup toolchain install stable nightly --profile default

echo "==> nvm + node LTS"
if [[ ! -d "$HOME/.nvm" ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install --lts

echo "==> uv (handles Python — no pyenv, no pip, no conda)"
if ! command -v uv >/dev/null; then
  brew install uv
fi
uv python install 3.12 3.13

echo "==> go"
if ! command -v go >/dev/null; then
  brew install go
fi

echo "==> Haskell (ghcup: ghc, cabal, stack, hls)"
if ! command -v ghcup >/dev/null; then
  BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
  BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
  BOOTSTRAP_HASKELL_ADJUST_BASHRC=N \
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
fi

echo "==> Zig"
if ! command -v zig >/dev/null; then
  brew install zig
fi

echo "==> Lean (elan)"
if ! command -v elan >/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf \
    https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | sh -s -- -y --default-toolchain stable --no-modify-path
fi

echo "==> Java (SDKMAN — manages multiple JDKs)"
if [[ ! -d "$HOME/.sdkman" ]]; then
  # rcupdate=false: don't let SDKMAN edit ~/.zshrc — the repo owns it.
  curl -s "https://get.sdkman.io?rcupdate=false" | bash
fi
# shellcheck disable=SC1091
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && . "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.5-tem </dev/null || true   # idempotent: errors if already installed

echo "==> Scala (Coursier — installs scala, sbt, scala-cli, scalafmt to ~/.local/bin)"
if ! command -v cs >/dev/null; then
  brew install coursier
fi
# Skip `cs setup` (modifies shell rc); install tools directly to ~/.local/bin.
mkdir -p "$HOME/.local/bin"
cs install --install-dir "$HOME/.local/bin" \
  scala sbt scala-cli scalafmt 2>/dev/null || true

echo "==> done"
