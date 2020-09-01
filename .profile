. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file

export NODENV_ROOT=/usr/local/var/nodenv
if which rbenv  > /dev/null 2>&1; then eval "$(rbenv  init -)"; fi
if which nodenv > /dev/null 2>&1; then eval "$(nodenv init -)"; fi

# this stuff moved to .zshrc (so that 'complete' and 'compdef' are defined after
# .oh-my-zsh/oh-my-zsh.sh gets loaded and example_profile doesn't show error)
#
#if [ "$(uname)" = Darwin ]; then
# #_source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
# #_source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>&1
# #unset GREP_OPTIONS # depricated for Gnu grep
# #export s_check1="net.rb, ~/usr/bin, ~/src/squishup_scripts/bin"
# #export s_check2="net.rb, ~/usr/ruby/lib, ~/src/squishup_scripts/lib"
# #export s_check3="string_colorize.rb, ~/usr/ruby/lib, ~/src/squishup_scripts/lib"
# #_source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
#  _source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>&1
#fi

unset AWS_PROFILE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY

# allow multiple Pythons and python environments
#   see ~/usr/bin/help.python.install
if pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

_leave_dot_file
