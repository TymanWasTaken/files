#---------------------------------------------------------------------------------#
### Powerlevel10k instant prompt
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#---------------------------------------------------------------------------------#
### Add things to PATH
path+=("$HOME/.pyenv/bin")
path+=("$HOME/.local/bin")
export PATH
#--------------------------------------------------------------------------------#
### Zsh config
# Configure command history saving
HISTFILE=~/.zsh_history # Sets history file
HISTSIZE=1000 # Sets lines to save history for
SAVEHIST=1000 # Sets lines to save history for
# Configure emacs keys
bindkey -e
# Configure completion settings
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#---------------------------------------------------------------------------------#
### Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme # Load theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # Load zsh config
#---------------------------------------------------------------------------------#
### Load nvm (node version manager)
if ls "$HOME/.nvm" &> /dev/null; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
#---------------------------------------------------------------------------------#
### Load pyenv
if ls "$HOME/.pyenv" &> /dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
fi
#---------------------------------------------------------------------------------#
### Make everything colorful
alias ls="ls --color" # `ls` colors
# Find syntax highlighting location and start it (apt and pacman are different)
if ls "/usr/share/zsh/plugins/zsh-syntax-highlighting/" &> /dev/null; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif ls "/usr/share/zsh-syntax-highlighting" &> /dev/null; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
#---------------------------------------------------------------------------------#
### Fixes
export GPG_TTY=$(tty) # Fix gpg signing
#---------------------------------------------------------------------------------#
