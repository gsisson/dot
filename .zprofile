. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file

export SHELL=/bin/zsh

# allow bash-style 'command completion' scripts to be used (there are some
# in ~/src/squishup_scripts/bin/ that get loaded)
autoload -U +X bashcompinit && bashcompinit

_source_dot_file ~/.bash_profile

_leave_dot_file
