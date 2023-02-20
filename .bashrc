. ~/usr/bin/functions/dotfile.tracker.fn
if [ -n "$SLASH_ETC_BASHRC_PROCESSED" ]; then
  _say_something "[GLOBAL /etc/bashrc just finished loading]"
fi
_enter_dot_file 2>/dev/null || true

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
#    _source_dot_file ~/src/squishup_scripts/lib/profile/example_profile
#    unset LSCOLORS
#    unset LS_COLORS
#  fi
#fi

if which brew >/dev/null 2>&1; then
  export PAGER=$(brew --prefix)/bin/less # brew 'less' (uses ~/.lesskey; allows key remaping)
else
  export PAGER=less                     # apple 'less' (doesn't use ~/.lesskey)
fi

#export LESS=-MRi-+X-F  #  -F:       quit-if-one-screen
export LESS=-MRi-+X-+F # -+F: never quit-if-one-screen

_source_dot_file ~/.bashrc.pyenv       2>/dev/null || true
_source_dot_file ~/.bashrc.colors      2>/dev/null || true
_source_dot_file ~/.bashrc.functions   2>/dev/null || true
_source_dot_file ~/.bashrc.completions 2>/dev/null || true
_source_dot_file ~/.bashrc.aliases     2>/dev/null || true
_source_dot_file ~/.bashrc.aliases.aws 2>/dev/null || true

case "$(uname)" in
  *Darwin*) _source_dot_file ~/.bashrc.mac 2>/dev/null || true;;
         *) _source_dot_file ~/.bashrc.pc  2>/dev/null || true;;
esac

export PC=glenn

# umask u=rwx,g=rwx,o=rx

#G_ENABLE_DIAGNOSTIC=0 # 1
#GTK_THEME=Adwaita
 GTK_THEME="Adwaita:dark"

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
export AWS_REGION="us-west-2"

_leave_dot_file 2>/dev/null || true


