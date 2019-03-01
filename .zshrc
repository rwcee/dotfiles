# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/campbell/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bullet-train"
ZSH_THEME="bullet-train"

# bullet-train opts
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
)
BULLETTRAIN_PROMPT_CHAR='❯'
BULLETTRAIN_CONTEXT_BG='green'
BULLETTRAIN_CONTEXT_FG='black'
BULLETTRAIN_DIR_BG='blue'
BULLETTRAIN_DIR_FG='black'
BULLETTRAIN_GIT_BG='253'

# powerlevel9k opts
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('context' 'dir' 'vcs')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator rbenv)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='green'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='white'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git ruby kitchen rbenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Environment exports
export EDITOR=vim
export GOPATH=/Users/campbell/code/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/usr/local/bin:$HOME/local/bin:/usr/local/sbin" # local libraries
export PATH="/opt/chefdk/bin:/opt/chefdk/embeded/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH" #chef

# Source zsh stuff
source ~/.zsh_aliases

######################################################
# fzf

export FZF_DEFAULT_OPTS='--height 30% --reverse --border'

# Use ag instead of the default find command for listing candidates.
# - The first argument to the function is the base path to start traversal
# - Note that ag only lists files not directories
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  ag -g "" "$1"
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf-tmux -d 15 +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# end fzf
######################################################

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
