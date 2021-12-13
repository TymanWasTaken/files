#---------------------------------------------------------------------------------#
### Powerlevel10k instant prompt
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#---------------------------------------------------------------------------------#
### Zsh autogenerated config
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history # Sets history file
HISTSIZE=1000 # Sets lines to save history for
SAVEHIST=1000 # Sets lines to save history for
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tyman/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#---------------------------------------------------------------------------------#
### Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme # Load theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # Load zsh config
#---------------------------------------------------------------------------------#
### Load nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#---------------------------------------------------------------------------------#
### Make everything colorful
alias ls="ls --color" # `ls` colors
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Syntax highlighting
#---------------------------------------------------------------------------------#
### Fixes
export GPG_TTY=$(tty) # Fix gpg signing
#---------------------------------------------------------------------------------#