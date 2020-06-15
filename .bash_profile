. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file

_source_dot_file  ~/.profile

user_email="glenn.sisson@gmail.com"
user_name="Glenn Sisson"
work_github_account="IPGPTP"

if [ "$(uname)" != Darwin ]; then
  _source_dot_file  ~/.bash_profile_pc
  _leave_dot_file
  return
fi

_source_dot_file  ~/.bashrc

_leave_dot_file

# used by bash AND zsh (but incompatible formats!)
#HISTFILE=$HOME/tmp/.bash_history
