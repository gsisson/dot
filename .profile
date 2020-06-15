. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file

export NODENV_ROOT=/usr/local/var/nodenv
if which rbenv  > /dev/null 2>&1; then eval "$(rbenv  init -)"; fi
if which nodenv > /dev/null 2>&1; then eval "$(nodenv init -)"; fi

# this stuff moved to .zshrc (so that 'complete' and 'compdef' are defined after
# .oh-my-zsh/oh-my-zsh.sh gets loaded and example_profile doesn't show error)
#
#if [ "$(uname)" = Darwin ]; then
# #_source_dot_file ~/src/mashup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
# #_source_dot_file ~/src/mashup_scripts/lib/profile/example_profile 2>&1
# #unset GREP_OPTIONS # depricated for Gnu grep
# #export mash_check1="net.rb, ~/usr/bin, ~/src/mashup_scripts/bin"
# #export mash_check2="net.rb, ~/usr/ruby/lib, ~/src/mashup_scripts/lib"
# #export mash_check3="string_colorize.rb, ~/usr/ruby/lib, ~/src/mashup_scripts/lib"
# #_source_dot_file ~/src/mashup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
#  _source_dot_file ~/src/mashup_scripts/lib/profile/example_profile 2>&1
#  if [ -f ~/.profile_reveal_NO_CHECKIN ]; then
#    _source_dot_file ~/.profile_reveal_NO_CHECKIN
#  fi
#fi

unset AWS_PROFILE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY

      WHOVILLE_HPID_API_SECRET=get_from_beanstalk_staging_services
    WHOVILLE_LPP_API_CLIENT_ID=get_from_beanstalk_staging_services
WHOVILLE_LPP_API_CLIENT_SECRET=get_from_beanstalk_staging_services
            LPP_SCAN_CLIENT_ID=get_from_beanstalk_staging_services
        LPP_SCAN_CLIENT_SECRET=get_from_beanstalk_staging_services

_leave_dot_file
