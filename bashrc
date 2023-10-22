GIT_PROMPT_LOCATIONS="
    /etc/bash_completion.d/git-prompt.sh
    /etc/bash_completion.d/git-prompt
    /usr/share/git-core/contrib/completion/git-prompt.sh
"

for x in $GIT_PROMPT_LOCATIONS; do
    [ -r $x ] && source $x && break
done

RED="\033[0;31m"
BLUE="\033[0;34m"           # DraculaPurple
PURPLE="\033[0;35m"         # DraculaPink
NORM="\033[0m"

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
