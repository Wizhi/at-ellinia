fpath+="${ZSH_PLUGINS}/zsh-completions/src"

autoload -Uz compinit

zstyle ':completion:*' menu yes select=10
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Case-insensitive completion
unsetopt CASE_GLOB
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zmodload zsh/complist

# Only dump completion cache once a day
# https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n "${ZSH_CACHE}"/zcompdump(#qN.mh+24) ]]; then
	compinit -d "${ZSH_CACHE}/zcompdump"
else
	compinit -d "${ZSH_CACHE}/zcompdump" -C
fi
