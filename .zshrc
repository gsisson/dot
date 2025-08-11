. ~/usr/bin/functions/dotfile.tracker.fn
if [ -n "$SLASH_ETC_ZSHRC_PROCESSED" ]; then
  _say_something "[GLOBAL /etc/zshrc just finished loading]"
fi
_enter_dot_file 2>/dev/null || true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="glenn"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true" # print -Pn "\e]2;WINDOW\a"   ;  print -Pn "\e]1;TAB\a"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
HIST_IGNORE_SPACE="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(zsh-syntax-highlighting zsh-autosuggestions)
#plugins=(glenn wd gem git git-prune bundler brew heroku rake rails) # rbenv #rake-fast rake per-directory-history
#plugins=(glenn wd     git                   brew                  ) # rbenv #rake-fast rake per-directory-history
 plugins=(glenn wd git colored-man-pages colorize pip python aws autojump ) # rbenv #rake-fast rake per-directory-history

# Handle problems of oh-my-zsh overriding things ----------------------------------------------
  _LSCOLORS="$LSCOLORS"                                        # save LSCOLORS
  # Now load oh-my-zsh stuff
  if [ ! -f ~/.oh-my-zsh/plugins/glenn/glenn.plugin.zsh -o \
       ! -f ~/.oh-my-zsh/themes/glenn.zsh-theme        ]; then
    echo "WARNING: unable to find ~/.oh-my-zsh/glenn* files!"
    echo "         (maybe you need to run ~/.zsh/add.symlinks.to.oh-my-zsh)"
  fi
  _source_dot_file $ZSH/oh-my-zsh.sh 2>/dev/null || true
  LSCOLORS="$_LSCOLORS"                                        # restore LSCOLORS
  #type _gst > /dev/null && eval alias gst=$(alias _gst|sed -e 's:.*=::') # restore
  #type _gst > /dev/null && unalias _gst                                  # restore           |
# Done handling problems of oh-my-zsh overriding things ---------------------------------------

# User configuration

# enable ^p ^n to search history based on text before the cursor
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P"   up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# Appends every command to the history file once it is executed
  setopt inc_append_history
# Reloads the history whenever you use it
unsetopt share_history

# allow pound sign to start comments when in interactive shell
setopt interactivecomments

# failed globs should NOT stop the command USING the globs
#   rm existing_file nonexisting_file_* # null_glob makes sure 'existing_file' gets removed
unsetopt null_glob

# make env vars with spaces in them act like they do in bash when used on the command line
# i.e. files="file1 file2"; ls $files; # will look for file1 and file2 not for "file1 file2"
setopt sh_word_split

# allow bash-style '#' from the command line to make a comment
setopt interactivecomments

# write HISTFILE immediately, rather than waiting until shell exit
setopt INC_APPEND_HISTORY

# install support for shell completion with the AWS 'aws' CLI
file=/usr/local/bin/aws_zsh_completer.sh
if [ -f $file ]; then
  # source $file # BUG? this just causes the shell to exit!?  fix on next line...
  eval $(cat $file | tail +2 | sed -e 's/ exec /; source /')
fi
unset file

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Squishup Scripts ------------------------------------------------------------------------------
  # this stuff moved here from .profile (and was also in .bashrc) because otherwise           |
  # errors come from squishup_scripts's example_profile when the bash-style command completion  |
  # commands are run.  Putting it here ensures that .oh-my-zsh/oh-my-zsh.sh has been          |
  # loaded and the support for bash-style command completion will work.                       |
  #
  if [ "$(uname)" = Darwin ]; then
   #_source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
   #_source_dot_file ~/src/squishup_scripts/lib/profile/example_profile
   #unset GREP_OPTIONS # depricated for Gnu grep
   #export mash_check1="net.rb, ~/usr/bin, ~/src/squishup_scripts/bin"
   #export mash_check2="net.rb, ~/usr/ruby/lib, ~/src/squishup_scripts/lib"
   #export mash_check3="string_colorize.rb, ~/usr/ruby/lib, ~/src/squishup_scripts/lib"
   #_source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>&1 | grep -v GREP_OPTIONS
    local _EDITOR=$EDITOR  # save EDITOR, which squishup scripts profile changes
    if [ -f ~/src/squishup_scripts/lib/profile/example_profile ]; then
      _source_dot_file ~/src/squishup_scripts/lib/profile/example_profile 2>/dev/null || true
    fi
    unset GREP_OPTIONS # depricated for Gnu grep
    EDITOR=$_EDITOR  # restore EDITOR
  fi
# Squishup Scripts ------------------------------------------------------------------------------

# terraform tab completion ----------------------------------------------------------------------
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $(brew --prefix)/bin/terraform terraform


# iterm2 shell integration
if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
   _source_dot_file "${HOME}/.iterm2_shell_integration.zsh"
fi

# mcfly
eval "$(mcfly init zsh)"

# zsh fixup -------------------------------------------------------------------------------------
_source_dot_file ~/.bashrc.zsh.fixup 2>/dev/null || true # fix things zsh messed up

# leave window title alone, but set tab titles
DISABLE_AUTO_TITLE="true"   # print -Pn "\e]2;WINDOW\a"   ;  print -Pn "\e]1;TAB\a"
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
#_source_dot_file ~/.brazil_completion/zsh_completion
#export JAVA_HOME="/opt/homebrew/Cellar/openjdk/20.0.1/libexec/openjdk.jdk/Contents/Home"

#export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
#export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
#export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

#export PATH="/opt/homebrew/opt/node@14/bin:$PATH"     # export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/node@14/lib"      # export LDFLAGS="-L/opt/homebrew/opt/node@18/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/node@14/include" # export CPPFLAGS="-I/opt/homebrew/opt/node@18/include"
#export BRAZIL_NODE18X_PATH="/opt/homebrew/opt/node@14/bin/node"
function enable-account() {
  type=$3
  if [ "$type" != EC2 -a "$type" != ECR -a "$type" != LAMBDA ]; then
    echo "usage: enable-account ACCOUNT_ID REGION EC2|ECR|LAMBDA"
    return
  fi
  echo + ada credentials update --account=$1 --provider=isengard --role=Admin --once
         ada credentials update --account=$1 --provider=isengard --role=Admin --once --profile=enabler
  echo + aws inspector2 enable --resource-types $type --region $2
         aws inspector2 enable --resource-types $type --region $2 --profile=enabler | grep -iE '(ABL|accountId|failedAccounts)'
}

_leave_dot_file 2>/dev/null || true

# Added by GDK bootstrap
source /Users/gsisson/.asdf/asdf.sh
