#!/usr/bin/env sh

# An SSH agent should be running as a systemd user service.
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Machine specific environment variables may be defined.
[ -f ~/.profile.machine ] && . ~/.profile.machine
