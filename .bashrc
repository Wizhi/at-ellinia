#!/usr/bin/env bash

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Drop into elvish for interactive shells.
# Since Arch kind of relies on /etc/profile, we can't just use elvish as the
# default shell, since that results in various things being misconfigured.
exec elvish
