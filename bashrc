BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN="\033[0;33m"
BLUE="\033[0;34m"           # DraculaPurple
PURPLE="\033[0;35m"         # DraculaPink
CYAN="\033[0;36m"
GRAY="\033[0;37m"

BOLD_GRAY="\033[1;30m"
BOLD_RED="\033[1;31m"
BOLD_GREEN="\033[1;32m"
BOLD_YELLOW="\033[1;33m"
BOLD_BLUE="\033[1;34m"      # Bold/Light DraculaPurple
BOLD_PURPLE="\033[1;35m"    # Bold/Light DraculaPink
BOLD_CYAN="\033[1;36m"
BOLD_GRAY="\033[1;37m"

NORM="\033[0m"

GIT_PROMPT_LOCATIONS="
    /etc/bash_completion.d/git-prompt.sh
    /etc/bash_completion.d/git-prompt
    /usr/share/git-core/contrib/completion/git-prompt.sh
"

for x in $GIT_PROMPT_LOCATIONS; do
    [ -r $x ] && source $x && break
done

if [ $(type -t __git_ps1) ]; then
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWSTASHSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWUPSTREAM="verbose"
    export GIT_PS1_HIDE_IF_PWD_IGNORED=true
    #export GIT_PS1_SHOWCOLORHINTS=true         # requires PROMPT_COMMAND (pc)
    export PS1="$BLUE\A ($RED\u@\h$BLUE)-[$NORM\w$BLUE]$NORM\$(__git_ps1 \"$BLUE-($PURPLE%s$BLUE)\")$NORM\n% "
else
    export PS1="$BLUE\A ($RED\u@\h$BLUE)-[$NORM\w$BLUE]-($PURPLE\$(git symbolic-ref --short HEAD 2>/dev/null)$BLUE)$NORM\n% "
fi

## Disable Software Pause Transmission
stty -ixon

## Undefine Stop/Start character
stty stop undef start undef

umask 022

[ -r ${HOME}/.Xresources ] && xrdb -load ${HOME}/.Xresources
[ -r ${HOME}/.alias ] && source ${HOME}/.alias
