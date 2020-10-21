{
	autoload -Uz zrecompile

	zrecompile -pq "${ZSH_CACHE}/zcompdump"
	zrecompile -pq "${ZDOTDIR}/.zshrc"
	zrecompile -pq "${ZDOTDIR}/.zshenv"
	zrecompile -pq "${ZDOTDIR}/.zlogin"
	zrecompile -pq "${ZDOTDIR}/rc.d/*.zsh"
} &!
