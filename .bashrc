. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file

# allow expanding aliases in functions
if [ -n "$BASH_VERSION" ]; then
  shopt -s expand_aliases
fi
if [ -n "$ZSH_VERSION" ]; then
  setopt aliases
fi

# this stuff moved to .zshrc (so that 'complete' and 'compdef' are defined after
# .oh-my-zsh/oh-my-zsh.sh gets loaded and example_profile doesn't show error)
#
#if [ "$(uname)" = Darwin ]; then
#  if [ -z "$scripts_dir" ]; then
#    _source_dot_file ~/src/mashup_scripts/lib/profile/example_profile
#    unset LSCOLORS
#    unset LS_COLORS
#  fi
#fi

export LESS=-R # allow less to pass colors through

_source_dot_file ~/.bashrc.colors
_source_dot_file ~/.bashrc.functions
_source_dot_file ~/.bashrc.aliases

case "$(uname)" in
  *CYGWIN*) _source_dot_file ~/.bashrc.pc;;
  *Darwin*) _source_dot_file ~/.bashrc.mac;;
esac

export PC=glenn

_leave_dot_file

