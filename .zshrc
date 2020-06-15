. ~/usr/bin/functions/dotfile.tracker.fn
_enter_dot_file

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# from ~/.oh-my-zsh/themes/
ZSH_THEME="glenn"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"   # print -Pn "\e]2;WINDOW\a"   ;  print -Pn "\e]1;TAB\a"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_IGNORE_SPACE="true"

HIST_STAMPS="yyyy-mm-dd"

# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
BUNDLED_COMMANDS=(rubocop)
plugins=(glenn wd gem git bundler brew heroku rake rails) # rbenv #rake-fast rake per-directory-history

# Handle problems of oh-my-zsh overriding things ----------------------------------------------
  #type gst > /dev/null && eval alias _$(alias gst)            # save mashup's 'gst' alias    |
  _LSCOLORS="$LSCOLORS"                                        # save LSCOLORS
  # Now load oh-my-zsh stuff
  if [ ! -f ~/.oh-my-zsh/plugins/glenn/glenn.plugin.zsh -o \
       ! -f ~/.oh-my-zsh/themes/glenn.zsh-theme        ]; then
    echo "WARNING: unable to find ~/.oh-my-zsh/glenn* files!"
    echo "         (maybe you need to run ~/.zsh/add.symlinks.to.oh-my-zsh)"
  fi
  _source_dot_file $ZSH/oh-my-zsh.sh
  LSCOLORS="$_LSCOLORS"                                        # restore LSCOLORS
  #type _gst > /dev/null && eval alias gst=$(alias _gst|sed -e 's:.*=::') # restore
  #type _gst > /dev/null && unalias _gst                                  # restore           |
# Done handling problems of oh-my-zsh overriding things ---------------------------------------

# enable ^p ^n to search history based on text before the cursor
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P"   up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

setopt share_history

# allow pound sign to start comments when in interactive shell
setopt interactivecomments

# failed globs should NOT stop the command USING the globs
#   rm existing_file nonexisting_file_* # null_glob makes sure 'existing_file' gets removed
unsetopt null_glob

# install support for shell completion with the AWS 'aws' CLI
file=/usr/local/bin/aws_zsh_completer.sh
if [ -f $file ]; then
  # source $file # BUG? this just causes the shell to exit!?  fix on next line...
  eval $(cat $file | tail +2 | sed -e 's/ exec /; source /')
fi
unset file

# The next line doesn't work in zsh :-(
# source /usr/local/bin/eb_completion.bash

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Mashup Scripts ------------------------------------------------------------------------------
  # this stuff moved here from .profile (and was also in .bashrc) because otherwise           |
  # errors come from mashup_scripts's example_profile when the bash-style command completion  |
  # commands are run.  Putting it here ensures that .oh-my-zsh/oh-my-zsh.sh has been          |
  # loaded and the support for bash-style command completion will work.                       |
  #
  if [ "$(uname)" = Darwin ]; then
   #_source_dot_file ~/src/mashup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
   #_source_dot_file ~/src/mashup_scripts/lib/profile/example_profile
   #unset GREP_OPTIONS # depricated for Gnu grep
   #export mash_check1="net.rb, ~/usr/bin, ~/src/mashup_scripts/bin"
   #export mash_check2="net.rb, ~/usr/ruby/lib, ~/src/mashup_scripts/lib"
   #export mash_check3="string_colorize.rb, ~/usr/ruby/lib, ~/src/mashup_scripts/lib"
   #_source_dot_file ~/src/mashup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
    local _EDITOR=$EDITOR  # save EDITOR, which mashup scripts profile changes
    _source_dot_file ~/src/mashup_scripts/lib/profile/example_profile
    unset GREP_OPTIONS # depricated for Gnu grep
    if [ -f ~/.profile_reveal_NO_CHECKIN ]; then
      _source_dot_file ~/.profile_reveal_NO_CHECKIN
    fi
    EDITOR=$_EDITOR  # restore EDITOR
  fi
# Mashup Scripts ------------------------------------------------------------------------------

_source_dot_file ~/.bashrc.zsh.fixup # fix things zsh messed up

_leave_dot_file
