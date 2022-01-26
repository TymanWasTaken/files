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
path+=("$HOME/Android/Sdk/platform-tools")
path+=("$HOME/.cargo/bin")
export PATH
#--------------------------------------------------------------------------------#
### Zsh config
# Configure command history saving
HISTFILE=~/.zsh_history # Sets history file
HISTSIZE=1000 # Sets lines to save history for
SAVEHIST=1000 # Sets lines to save history for
# Configure emacs keys
bindkey -e
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
    eval "$(pyenv init -)"
fi
#---------------------------------------------------------------------------------#
### Aliases
alias ls="exa" # `exa` instead of `ls`
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
#---------------------------------------------------------------------------------#
### Zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k # Powerlevel10k
zinit light zsh-users/zsh-autosuggestions # Autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting # Syntax highlighting

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
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
