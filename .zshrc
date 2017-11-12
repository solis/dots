# Path to your oh-my-zsh installation.
export ZSH=/home/apaulau/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export BROWSER="chromium"

source $ZSH/oh-my-zsh.sh

alias rm='rm -iv'
alias ls='ls -h --color=auto'
alias ll='ls++'
alias v='vim'
alias vpnc='sudo vpnc --pid-file /var/run/vpnc/pid'
alias upterm='xrdb $HOME/.Xresources'
alias copysel='xsel -p -o | xsel -i -b'
alias findname='sudo find / -name'

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacsyu='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacs='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacu='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacr='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrns='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacsi='pacman -Si'              # Display information about a given package in the repositories
alias pacss='pacman -Ss'             # Search for package(s) in the repositories
alias pacqi='pacman -Qi'              # Display information about a given package in the local database
alias pacqs='pacman -Qs'             # Search for package(s) in the local database

alias yaoss='yaourt -Ss'
alias yasy='yaourt -Syua'        # Synchronize with repositories before upgrading packages (AUR packages too) that are out of date on the local system.
alias yasu='yaourt --sucre'      # Same as yaupg, but without confirmation
alias yas='yaourt -S'           # Install specific package(s) from the repositories
alias yau='yaourt -U'          # Install specific package not from the repositories but from a file
alias yar='yaourt -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias yarns='yaourt -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias yasi='yaourt -Si'         # Display information about a given package in the repositories
alias yass='yaourt -Ss'        # Search for package(s) in the repositories
alias yaqi='yaourt -Qi'         # Display information about a given package in the local database
alias yaqe='yaourt -Qe'         # List installed packages, even those installed from AUR (they're tagged as "local")
alias yaorph='yaourt -Qtd'       # Remove orphans using yaourt

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

# https://bbs.archlinux.org/viewtopic.php?id=93683
paclist() {
  LC_ALL=C pacman -Qei $(pacman -Qu|cut -d" " -f 1)|awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[1;37m", $2)}/^Description/{print $2}'
}

alias paco='sudo pacman -Qdt'
alias pacro='sudo pacman -Rs $(pacman -Qtdq)'

if [[ $TERM == xterm-termite ]]; then
   . /etc/profile.d/vte.sh
    __vte_osc7
fi
