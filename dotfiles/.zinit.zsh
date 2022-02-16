zinit ice depth=1; zinit light romkatv/powerlevel10k; # Powerlevel10k theme
zinit light anatolykopyl/doas-zsh-plugin; # Double-escape adds doas to command
zinit light Tarrasch/zsh-command-not-found; # Shows command suggestions on invalid
zinit light Game4Move78/zsh-bitwarden; # Bitwarden cli utilities
zinit light ianthehenry/zsh-autoquoter; # Auto adds quotes around some commands
zinit light zdharma-continuum/fast-syntax-highlighting; # Syntax highlighting
zinit light zsh-users/zsh-autosuggestions # Command suggestions

export ZSH_AUTOSUGGEST_STRATEGY=(history completion) # Use history when available, then completion
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # Load Powerlevel10k config
