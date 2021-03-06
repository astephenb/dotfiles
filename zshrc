# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump docker-compose zsh-autosuggestions zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh

# User configuration

# use nvim as the visual editor
export VISUAL='code -w'
export EDITOR=$VISUAL

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin:$HOME/bin"

# aliases
source ~/dotfiles/aliases

# load env variables with direnv
command -v direnv &>/dev/null && eval "$(direnv hook $0)"

if [[ "$(uname)" == "Darwin" ]]; then
  set_window_title() {
    echo -ne "\e]1;$(basename $1)\a"
  }

  set_window_git_title() {
    ref=$(git root 2> /dev/null)
    if [[ -n $ref ]]; then
      set_window_title $ref
    else
      set_window_title $(pwd)
    fi
  }

  source ~/.iterm2_shell_integration.zsh
  iterm2_print_user_vars() {
    basedir=${$(git root 2> /dev/null):-$(pwd)}
    iterm2_set_user_var project $(basename $basedir)
    iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
  }
fi

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

command -v rbenv &>/dev/null && eval "$(rbenv init -)"


# configure spaceship
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_EXEC_TIME_SHOW=false
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_EMBER_SHOW=false
export SPACESHIP_DOTNET_SHOW=false
export SPACESHIP_PYENV_SHOW=false
export SPACESHIP_CONDA_SHOW=false
export SPACESHIP_VENV_SHOW=false
export SPACESHIP_AWS_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_JULIA_SHOW=false
export SPACESHIP_HASKELL_SHOW=false
export SPACESHIP_RUST_SHOW=false
export SPACESHIP_PHP_SHOW=false
export SPACESHIP_GOLANG_SHOW=false
export SPACESHIP_SWIFT_SHOW_LOCAL=false
export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
