#zmodload zsh/zprof
zmodload zsh/complist

setopt autocd extendedglob nomatch notify
unsetopt beep

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

for config in "${ZDOTDIR}"/rc.d/*; do
	source "${config}"
done

unset config
#zprof
