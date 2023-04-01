export LANG=C.UTF-8
export PATH=$HOME/bin:$HOME/.local/bin:/usr/sbin:/usr/bin:/sbin:/bin

## Fix locale date/time format
export LC_TIME="en_US.UTF-8"

## Fix XDG user environment variables missing on XMonad desktop
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# RVM == Ruby Version Management
export GEM_HOME=$HOME/.rvm

# NOTE: JH directory must end with slash (ie. '/')
# Reference: https://www.gog.com/forum/jupiter_hell/game_save_directory_on_linux
export JH_PREF_PATH=$HOME/.config/jupiterhell/

## -M or --LONG-PROMPT:
##      Most verbose prompt
## -i or --ignore-case:
##      Mase insensitive search, unless pattern contains uppercase
## -R or --RAW-CONTROL-CHARS:
##      For handling ANSI "color" escape sequences
## -S or --chop-long-lines
##      Disable long line text wrap
## -F or --quit-if-one-screen
##
## NOTE: Option ``-S, chop-long-lines`` may conflict with option
## ``-F, --quit-if-one-screen``. Truncating long text lines requires a
## pager. If both options are enabled, outputting long text lines will
## disable option ``-F`` to force outputting text thru pager.
##
## DO NOT ENABLE both ``-S`` and ``-F``. Choose only one or none.
export LESS='-MiRF'

## Disable useless ``~/.lesshst``
export LESSHISTFILE="/dev/null"

