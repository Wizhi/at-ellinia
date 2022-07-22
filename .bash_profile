#
# ~/.bash_profile
#

# See systemd --user ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -f ~/.bashrc ]] && . ~/.bashrc
