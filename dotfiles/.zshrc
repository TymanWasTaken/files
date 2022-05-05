#---------------------------------------------------------------------------------#
### Powerlevel10k instant prompt
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#---------------------------------------------------------------------------------#
### Load nvm (node version manager)
source /usr/share/nvm/init-nvm.sh
#---------------------------------------------------------------------------------#
### Add things to PATH
path+=("$HOME/.pyenv/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/Android/Sdk/platform-tools")
path+=("$HOME/.cargo/bin")
export PATH
#--------------------------------------------------------------------------------#
### Zsh config
# Configure command history saving
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# Configure emacs keys
bindkey -e
#---------------------------------------------------------------------------------#
### Load pyenv
if ls "$HOME/.pyenv" &> /dev/null; then
    eval "$(pyenv init -)"
fi
#---------------------------------------------------------------------------------#
### Aliases
source "$HOME/.zsh_aliases"
eval $(thefuck --alias) # `fuck` alias
#---------------------------------------------------------------------------------#
### Setup zinit
# Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# End of Zinit's installer chunk
[[ ! -f ~/.zinit.zsh ]] || source ~/.zinit.zsh # Load zinit plugins and themes
#---------------------------------------------------------------------------------#
### Fixes
export GPG_TTY=$(tty) # Fix gpg signing
## A giant handful of key fixes
bindkey "^[[3~" delete-char
bindkey "^[[3;2~" delete-char
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey "^Z" undo
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
#---------------------------------------------------------------------------------#
