# Do note, that any configuration _before_ loading the p10k instant prompt must
# not perform any I/O, otherwise it might break things.
#
# DISABLED DUE TO NO REAL REAL EFFECT WITH MY CURRENT SETUP.
# Enabling also causes a weird "blink" effect which, whilst minimal, annoys me.
#
# https://github.com/romkatv/powerlevel10k#how-do-i-enable-instant-prompt
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]
#  && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

[[ -f "${ZDOTDIR}/.p10k.zsh" ]] && source "${ZDOTDIR}/.p10k.zsh" 

source "${ZSH_PLUGINS}/powerlevel10k/powerlevel10k.zsh-theme"
