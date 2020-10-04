. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file 2>/dev/null || true

_source_dot_file  ~/.profile 2>/dev/null || true

user_email="glenn.sisson@gmail.com"
user_name="Glenn Sisson"

if [ "$(uname)" != Darwin ]; then
    _source_dot_file  ~/.bash_profile_pc 2>/dev/null || true
    _leave_dot_file 2>/dev/null || true
    return
fi

_source_dot_file ~/.bashrc 2>/dev/null || true

_leave_dot_file 2>/dev/null || true

# used by bash AND zsh (but incompatible formats!)
#HISTFILE=$HOME/tmp/.bash_history

# allow multiple Pythons and python environments
#   see ~/usr/bin/help.python.install
if pyenv --version > /dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

