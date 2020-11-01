fpath+="${ZSH_PLUGINS}/zsh-users/zsh-completions/src"

autoload -Uz compinit

# Only dump completion cache once a day
# https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n "${ZSH_CACHE}"/zcompdump(#qN.mh+24) ]]; then
	compinit -d "${ZSH_CACHE}/zcompdump"
else
	compinit -d "${ZSH_CACHE}/zcompdump" -C
fi
