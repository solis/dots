export GREP_COLOR="1;31"
export NOCOLOR_PIPE=1

# Coloring less command
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# Enforce correct locales from the beginning
unset LC_COLLATE
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=C
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

# Set vim as editor
export EDITOR="vim"