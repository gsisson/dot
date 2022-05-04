. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file 2>/dev/null || true

export SHELL=/bin/zsh

# allow bash-style 'command completion' scripts to be used (there are some
# in ~/src/squishup_scripts/bin/ that get loaded)
autoload -U +X bashcompinit && bashcompinit

if [ -f /opt/homebrew/bin/brew ]; then`
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# check for gnu ls not being installed
if ! command -v gls >/dev/null 2>&1; then
  echo -e "\033[1;91m# gls (gnu ls) not found - you may want to brew install coreutils\033[0m" 1>&2
fi

_source_dot_file ~/.bash_profile 2>/dev/null || true

_leave_dot_file 2>/dev/null || true
