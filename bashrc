#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Bash History
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=10000
# http://www.linuxjournal.com/content/using-bash-history-more-efficiently-histcontrol
# The ignorespace flag tells bash to ignore commands that start with spaces.
# The other flag, ignoredups, tells bash to ignore duplicates.
# You can concatenate and separate the values with a colon, ignorespace:ignoredups,
# if you wish to specify both values, or you can just specify ignoreboth.
export HISTCONTROL=ignoreboth


# Bash Completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# Colors
if [ -f ~/.dir_colors ]; then
    eval $(dircolors -b ~/.dir_colors)
fi


# Attribute codes:
# 00=none
# 01=bold
# 04=underscore
# 05=blink
# 07=reverse
# 08=concealed
# Text color codes:
# 30=black
# 31=red
# 32=green
# 33=yellow
# 34=blue
# 35=magenta
# 36=cyan
# 37=white
# Background color codes:
# 40=black
# 41=red
# 42=green
# 43=yellow
# 44=blue
# 45=magenta
# 46=cyan
# 47=white


## list of color for prompt and Bash
## https://wiki.archlinux.org/index.php/Color_Bash_Prompt#List_of_colors_for_prompt_and_Bash
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
## examples
# echo -e "${txtblu}test"
# echo -e "${bldblu}test"
# echo -e "${undblu}test"
# echo -e "${bakblu}test"

#PS1="[\u@\h \W]${bldwht}\$?${txtrst} "
PS1="[\u@\h \W]\$? "

export EDITOR='vim'
export PAGER='less'


## # colorful man pages
## man() {
##     env \
##         LESS_TERMCAP_mb=$(printf "\e[1;37m") \
##         LESS_TERMCAP_md=$(printf "\e[1;34m") \
##         LESS_TERMCAP_me=$(printf "\e[0m") \
##         LESS_TERMCAP_se=$(printf "\e[0m") \
##         LESS_TERMCAP_so=$(printf "\e[1;35m") \
##         LESS_TERMCAP_ue=$(printf "\e[0m") \
##         LESS_TERMCAP_us=$(printf "\e[1;36m") \
##             man "$@"
## }

# colorful man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[01;31m") \
        LESS_TERMCAP_md=$(printf "\e[01;38;5;74m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[01;38;5;198m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[04;38;5;146m") \
            man "$@"
}

## # Less Colors for Man Pages
## export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
## export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
## export LESS_TERMCAP_me=$'\E[0m'           # end mode
## export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
## export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
## export LESS_TERMCAP_ue=$'\E[0m'           # end underline
## export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


# blank lines
alias b='echo -en "\n\n\n\n\n"'

alias -- -='cd -'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'


# petar marinov, http:/geocities.com/h2428, this is public domain
# http://linuxgazette.net/109/marinov.html
cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}
alias cd=cd_func
# bind to Ctrl-g
bind -x "\"\C-g\":cd_func -- ;"


# all about ls
alias ls='ls -hF --color=auto --group-directories-first'
alias lr='ls -R'
alias la='ls -A'
alias ll='ls -l'
#alias lA="find -maxdepth 1 -regex '^\.\/\..+' -ls | awk '{print \$3,\$4,\$5,\$6,\$7,\"\t\",\$8,\$9,\$10,\"\t\",\$11}'"
alias lA='ls -lA'
alias lx='lA -BX'      # sort by extension
alias lz='lA -rS'      # sort by size
alias lt='lA -rt'      # sort by modification time
alias lu='lt -u'       # sort by access time

alias du='du -csh'
alias df='df -h'
alias mkdir='mkdir -p -v'

# safety features
alias rm='rm -dIv'
alias cp='cp -ipv'
alias mv='mv -iv'
alias ln='ln -iv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias startx='startx &> ~/.xlog'

alias less='less -ir'           # case insensitive when search
alias l='less'
alias grep='grep --color=auto -i'
alias g='grep'
alias hl='ack --noenv --color --passthru'
# highlight pattern in a file
# grep -E --color 'pattern|' file

alias sudo='sudo '      # so that sudo works with aliases

alias xmount='sudo mount -o uid=1000,gid=100'     # mount as user:group
alias umount='sudo umount'

# list filesystems
alias lsfs='lsblk --fs'

# aliases for ps
alias psg='ps aux | head -1; ps aux | grep $1'   # TODO: improve me - do it with one ps
alias psc="ps xawf -eo ppid,pid,tt,user,group,etime,stat,args"


# editors
alias em='emacs'
alias vi='vim'

# xclip
alias xc='xclip'
alias xcc='xclip -sel clip'     # usage: $ xcc < /path/to/file

# cal/date
alias cal='cal -y'              # show this year
alias d1='date +%Y%m%d'
alias d2='date +%H%M%S'
alias d3='date +%Y%m%d-%H%M%S'

alias oo='xdg-open'
alias diff='vimdiff'
alias srm='srm --dod -vv'
alias locate='locate -i'
alias mupdf='mupdf -r144'       # default resolution 144dpi
#alias feh='feh -F --info "exiv2 %F"'
alias feh='feh -. --info "exiv2 %F" --draw-tinted 2>/dev/null'
alias mtr='mtr -b'
alias netports='netstat --all --programs --numeric-ports --tcp --udp --extend --extend --verbose'


# shorthand for simple find
function f { find -iregex ".*${1}.*"; }


# fix directory or files permission
function fixperm() {
    if [ -d $1 ]; then
        find $1 -type d -exec chmod 755 {} \;
        find $1 -type f -exec chmod 644 {} \;
    elif [ -f $1 ]; then
        chmod 644 $1
    else
        echo "fixperm failed."
    fi
}


# find an unused unprivileged TCP port
function findtcp() {
    (netstat  -atn | awk '{printf "%s\n%s\n", $4, $4}' | grep -oE '[0-9]*$'; seq 32768 61000) | sort -n | uniq -u | head -n 1
}


# Lookup a word
# http://www.dict.org/rfc2229.txt
function dic() { curl dict://dict.org/"$@" ; }
function wn() { curl dict://dict.org/d:${1}:wn; }
function gcide() { curl dict://dict.org/d:${1}:gcide; }
function spanish() { curl dict://dict.org/d:"$@":eng-spa ; }


# Marks for directory paths
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function j  { \cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"; }
function m  { /usr/bin/mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"; }
function mm { ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo; }
#function xm { rm -i "$MARKPATH/$1"; }


# personal fun
export PATH="$HOME/b:$PATH"


##
## keyboard and mouse rate
##
# TODO
# TODO check xinit is already running
# TODO
xset r rate 200 55
xset m 1/1 0


# other stuff
source $HOME/.bash/secret
source $HOME/.bash/pastebinhack
source $HOME/.bash/sshkeychain
source $HOME/.bash/appsexport
source $HOME/.bash/uglyhacks
