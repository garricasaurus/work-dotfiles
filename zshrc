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
plugins=(autojump colored-man-pages git ssh-agent)

# ssh-agent settings
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 4h
zstyle :omz:plugins:ssh-agent quiet yes

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export _JAVA_AWT_WM_NONREPARENTING=1

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias mountnas="sudo mount -t nfs 192.168.0.235:/volume1/share /mnt/nas"
alias dropoff="sudo rsync -aP --remove-source-files $HOME/Download/*.torrent /mnt/nas/dropoff"
