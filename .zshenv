# XDG basedir spec compliance
if [[ ! -v XDG_CONFIG_HOME ]]; then
	export XDG_CONFIG_HOME"=${HOME}/.config"
fi

if [[ ! -v XDG_CACHE_HOME ]]; then
	export XDG_CACHE_HOME="${HOME}/.cache"
fi

if [[ ! -v XDG_DATA_HOME ]]; then
	export XDG_DATA_HOME="${HOME}/.local/share"
fi

if [[ ! -v XDG_RUNTIME_DIR ]]; then
	export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}/runtime-${USER}"
fi

if [[ ! -v ZDOTDIR ]]; then
	ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
fi

ZSH_PLUGINS="${ZDOTDIR}/plugins"
ZSH_CACHE="${XDG_CACHE_HOME}/zsh"

typeset -U path

path+="$HOME/.local/bin"
