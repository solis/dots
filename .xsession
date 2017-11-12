# Keyboard layout
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll"

# Disable bell
xset -b

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

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3 -V -d all >> ~/.i3/logfile
