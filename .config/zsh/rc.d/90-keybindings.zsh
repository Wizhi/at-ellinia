bindkey -v

bindkey '^?' backward-delete-char
bindkey '^l' clear-screen

# Adds vi-like search, keeping in mind that we more often than not wish to look 
# backwards in history.
bindkey -M vicmd '/' vi-history-search-backward
bindkey -M vicmd '?' vi-history-search-forward
bindkey -M vicmd 'n' vi-repeat-search
bindkey -M vicmd 'N' vi-rev-repeat-search
bindkey -M viins '^N' history-beginning-search-backward
bindkey -M viins '^P' history-beginning-search-forward

# Buffer history control
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo

# Edit buffer in $EDITOR
# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/edit-command-line
autoload -Uz edit-command-line

zle -N edit-command-line

bindkey -M vicmd '"' edit-command-line

# Change surrounding character pair
# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/surround
autoload -Uz surround

zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround

bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# URL magic for convenience
# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/bracketed-paste-url-magic
# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/url-quote-magic
autoload -Uz url-quote-magic
autoload -Uz bracketed-paste-url-magic

zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-url-magic
