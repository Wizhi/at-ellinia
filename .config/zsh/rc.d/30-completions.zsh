fpath+="${ZSH_PLUGINS}/zsh-completions/src"

autoload -Uz compinit

zstyle ':completion:*' menu yes select=10
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zmodload zsh/complist

# Only dump completion cache once a day
# https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n "${ZSH_CACHE}"/zcompdump(#qN.mh+24) ]]; then
	compinit -d "${ZSH_CACHE}/zcompdump"
else
	compinit -d "${ZSH_CACHE}/zcompdump" -C
fi
