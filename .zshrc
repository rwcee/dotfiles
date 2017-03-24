# Path to your oh-my-zsh installation.
export ZSH=/Users/rob.campbell/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rvm kitchen)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
#
# Path for local user binaries
export PATH="$HOME/local/bin:$PATH"

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

# end fzf
######################################################

# Path for chefdk ruby and bundle
export PATH="/opt/chefdk/bin:/opt/chefdk/embedded/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="~/.chefdk/gem/ruby/2.3.0/bin:$PATH"

# Chef Paths
export PM_CHEF="/path/to/chef"
export PM_DEVOPS_COOKBOOKS="/path/to/doc"
export JUMPCLOUD_CHEF_USERNAME="urname"
export PM_CHEF_USERNAME="urname"

# awscli autocomplete
source /usr/local/share/zsh/site-functions/_aws

# YAYLIASES
alias tma="tmux attach -t"
alias mtr="/usr/local/sbin/mtr"
alias vi="vim"
alias pmcode="cd ~/code/pm"
alias pmchef="cd ~/code/pm"
alias pmdoc="cd ~/code/pm"
alias pmtf="cd ~/code/pm"

# Random exports
export EDITOR='vim'
export PM_PROXY="true"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Install useful fzf things
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
