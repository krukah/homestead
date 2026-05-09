# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Skip oh-my-zsh's compinit security audit. Brew-owned dirs on $fpath
# trip the warning on fresh installs and chmod can't fully resolve it.
ZSH_DISABLE_COMPFIX="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/opt/homebrew/opt/libpq/bin"
export PATH="$HOME/.local/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Code/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Code/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Code/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Code/google-cloud-sdk/completion.zsh.inc"; fi


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"           # haskell (ghcup)
[ -f "$HOME/.elan/env" ] && . "$HOME/.elan/env"              # lean (elan)
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && . "$HOME/.sdkman/bin/sdkman-init.sh"  # jvm (sdkman)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"  # uv (installed by toolchains.sh)

# API keys redacted from repo. Real values live in ~/.zshrc.local (gitignored).
# TODO Phase 2: pull from Keychain or 1Password CLI via chezmoi template.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Custom git aliases
alias gca='git commit --amend'              # git commit append (amend)
alias gcan='git commit --amend --no-edit'   # amend without changing message
alias gco='git checkout'                     # git checkout (already in oh-my-zsh git plugin but explicit here)
alias gcb='git checkout -b'                  # checkout new branch
alias gst='git status'                       # git status
alias gp='git push'                          # git push
alias gpl='git pull'                         # git pull
alias glog='git log --oneline --graph --decorate' # pretty git log

# AWS Prompt - Show account in CLI
aws_prompt_info() {
  if [ -n "$AWS_PROFILE" ]; then
    # Check SSO cache OR valid credentials
    if [ -d ~/.aws/sso/cache ] && [ -n "$(find ~/.aws/sso/cache -type f -mmin -60 2>/dev/null)" ]; then
      echo "%F{green}☁ $AWS_PROFILE%f "
    elif grep -q "aws_access_key_id" ~/.aws/credentials 2>/dev/null; then
      echo "%F{green}☁ $AWS_PROFILE%f "
    else
      echo "%F{red}☁ $AWS_PROFILE%f "
    fi
  else
    echo "%F{yellow}☁ none%f "
  fi
}
setopt PROMPT_SUBST
PROMPT='$(aws_prompt_info)'$PROMPT
