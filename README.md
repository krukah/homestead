# homestead

My Mac, in a repo.

Run `./bootstrap.sh` on a fresh machine. Walk away. Come back to a working laptop.

## What's here

```
homestead/
├── Brewfile                 brew bundle dump --describe
├── vscode-extensions.txt    code --list-extensions
├── bootstrap.sh             the one script that does everything
├── home/                    dotfiles, mirror of $HOME
└── scripts/
    ├── defaults.sh          macOS prefs (grow this as I notice things)
    └── toolchains.sh         rust, node, uv, go, haskell, zig, lean, java, scala
```

`home/` is stow'd into `$HOME`. No prefix magic. The repo's `home/.zshrc`
becomes `~/.zshrc` (a symlink, but you don't have to think about that).

## Day to day

- New brew formula: `brew bundle dump --describe --force` and commit.
- New dotfile worth tracking: drop it in `home/`, `cd ~/Code/homestead && stow -R home`.
- New macOS pref: capture the `defaults write` line in `scripts/defaults.sh`.
- Fix something on the live machine: edit `home/foo` directly (it's the same file via symlink), commit.

## What's not here

OAuth tokens (`gh`, `gcloud`, `auth0`, `github-copilot`), AWS creds + SSO, Claude
session state, Zed embeddings, SSH/GPG private keys. All of those re-auth or get
restored from 1Password on a new machine.

`~/.aws/config` and `~/.ssh/config` are also intentionally untracked. Tools
rewrite them in place (`aws configure sso`, adding a `Host` block), and a
tracked symlink would mean those edits get committed back to a public repo.
Run `aws configure sso` and edit `~/.ssh/config` directly on each machine.

Chrome PWAs (Google Docs/Sheets/Slides launchers) — open Chrome, navigate to the
service, three-dot menu → Cast/Save/Share → Install page as App.

## Secrets

`home/.zshrc` doesn't hold any. API keys live in `~/.zshrc.local` (gitignored).
On a new machine: sign into 1Password, put the keys in `~/.zshrc.local`, done.

## If you fork this

Two things to swap before running `bootstrap.sh`:

- `bootstrap.sh` — change `REPO_URL` to your fork.
- `home/.gitconfig` — your `name` and `email`.

Everything else uses `$HOME` and works on any macOS account.

## License

MIT. Steal what's useful.
