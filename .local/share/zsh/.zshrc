setopt autocd extendedglob nomatch notify
unsetopt beep

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

eval "$(starship init zsh)"
