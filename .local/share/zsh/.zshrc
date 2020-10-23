setopt autocd extendedglob nomatch notify
unsetopt beep

#zmodload zsh/zprof

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

bindkey -v

# Include interactive rc files
for conffile in "${ZDOTDIR}"/rc.d/*
do
	source "${conffile}"
done

unset config

#zprof
