export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

# CASE_SENSITIVE="true"                 # case sensitive completion
# HYPHEN_INSENSITIVE="true"             # hyphen sensitive completion
# COMPLETION_WAITING_DOTS="true"        # completion waiting dots

zstyle ':omz:update' mode auto          # auto update mode: auto | reminder | disabled 
zstyle ':omz:update' frequency 7        # auto update frequency in days

DISABLE_AUTO_TITLE="true"               # auto terminal title
ENABLE_CORRECTION="true"                # command auto-correction

# DISABLE_UNTRACKED_FILES_DIRTY="true"  # don't mark untracked files dirty

HIST_STAMPS="yyyy-mm-dd"                # history ts format (strftime) 

# plugins to load 
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
