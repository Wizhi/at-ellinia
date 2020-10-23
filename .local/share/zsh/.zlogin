{
	autoload -Uz zrecompile

	zrecompile -pq "${ZSH_CACHE}/zcompdump"
	zrecompile -pq "${ZDOTDIR}/.zshrc"
	zrecompile -pq "${ZDOTDIR}/.zshenv"
	zrecompile -pq "${ZDOTDIR}/.zlogin"

	for config in "${ZDOTDIR}"/rc.d/*.zsh; do
		zrecompile -pq "${config}"
	done
} &!
