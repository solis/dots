# Path to your oh-my-zsh installation.
export ZSH=/home/apaulau/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump colored-man colorize sublime mvn npm archlinux zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

_PROMPT() {
  _EXIT_STATUS=$?
  [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
  PS1="\033[1;30m\]» \[\e[0;0m\]\u\033[1;30m\] $_EXIT_STATUS_STR\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\]]\[\033[1;30m\]:\[\033[0m\] "
  unset _EXIT_STATUS_STR
}
                
PROMPT_COMMAND=_PROMPT

alias cower='cower -v'
alias rm='rm -iv'
alias ls='ls -h --color=auto'
alias ll='ls++'
alias v='vim'
alias sv='sudo vim'
alias gv='gvim'
alias sgv='sudo gvim'
alias m='mutt'
alias z='zathura'
alias pacman='sudo pacman --color always'
alias pac='pacman --color always'
alias pacs='sudo pacman -S'
alias pacss='pacman -Ss'
alias pacsi='pacman -Si'
alias pacssi='pacman -Ssi'
alias pacqs='pacman -Qs'
alias pacqi='pacman -Qi'
alias pacqsi='pacman -Qsi'
alias pacqssi='pacman -Qssi'
alias pacr='sudo pacman -Rscudn'
alias upterm='xrdb $HOME/.Xresources'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/copland/theme.lua'
alias awdir='cd $HOME/.config/awesome'
alias copysel='xsel -p -o | xsel -i -b'
alias ps='ps -AlFH'
alias reboot='sudo reboot'
alias findname='sudo find / -name'
alias so="scrot ~/screenshots/tmp.png && imgurbash ~/screenshots/tmp.png; rm ~/screenshots/tmp.png"

alias yaos='yaourt -S --noconfirm'
alias yaoss='yaourt -Ss'

export EDITOR="nano"
export GREP_COLOR="1;31"
export LESS="-R"
export NOCOLOR_PIPE=1
export LANG=en_US.UTF-8

eval $(dircolors -b $HOME/.config/dir_colours)

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
               c='bsdtar xvf';;
        *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
        *.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
        *.gz)  c='gunzip';;
        *.rar) c='unrar x';;
        *.xz)  c='unxz';;
        *.zip) c='unzip';;
        *)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?3
    done

    return $e
}

stty stop undef
stty start undef
