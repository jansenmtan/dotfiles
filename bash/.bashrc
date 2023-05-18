# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) # for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)} \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='[ \033[1;32m\u@\h\033[0m \033[1;34m\w\033[0m ] \n \$ '
else
    # PS1='${debian_chroot:+($debian_chroot)} \u@\h:\w\$ '
    PS1='[ \u@\h \w ] \n \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#Tmux is shit
# if [[ $DISPLAY ]]; then
# 	# If not running interactively, do not do anything
# 	[[ $- != *i* ]] && return
# 	[[ -z "$TMUX" ]] && exec tmux
# fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/\~}\007"'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

function reload_gtk_theme() {
	theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
	gsettings set org.gnome.desktop.interface gtk-theme ''
	sleep 1
	gsettings set org.gnome.desktop.interface gtk-theme $theme
}

set -o vi

# make tmux and perl shut up
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=/usr/bin/nvim

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/ghidra_10.0.4_PUBLIC
export PATH=$PATH:$HOME/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin

# GCC ARM path
export PATH=$PATH:/home/whishkey/embedded/gcc-arm-none-eabi-9-2020-q2-update/bin

# RISCV GNU Toolchain path
export PATH=$PATH:/opt/riscv/bin

# For Android Studio
export _JAVA_AWT_WM_NONREPARENTING=1

# neovim man pager
export MANPAGER='nvim +Man!'

# https://blog.thepoon.fr/osuLinuxAudioLatency/
# export WINEPREFIX="$HOME/.wine_osu" # This is the path to a hidden folder in your home folder.
# export WINEARCH=win32 # Only needed when executing the first command with that WINEPREFIX

# NNN configuration settings
# use the $EDITOR when opening text files
alias nnn='nnn -e'

alias workman='setxkbmap -layout us -variant workman; xmodmap ~/.Xmodmap'
alias qwerty='setxkbmap -layout us; xmodmap ~/.Xmodmap'
alias zathura='tabbed -r 2 zathura -e "" '
alias tmux='tmux -u'
alias maxima='rlwrap maxima'
# alias osu='${HOME}/scripts/osu'
alias osu-lazer='prime-run osu-lazer'
alias cp='cp -v'

alias yay='yay --removemake'

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# https://wiki.archlinux.org/index.php/Nnn
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

export QSYS_ROOTDIR="/home/whishkey/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# fuzzy find history on C-r
bind '"\C-r": "\C-x1\e^\er"'
bind -x '"\C-x1": __fzf_history';

__fzf_history ()
{
__ehc $(history | fzf --tac --tiebreak=index | perl -ne 'm/^\s*([0-9]+)/ and print "!$1"')
}

__ehc()
{
if
        [[ -n $1 ]]
then
        bind '"\er": redraw-current-line'
        bind '"\e^": magic-space'
        READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${1}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
        READLINE_POINT=$(( READLINE_POINT + ${#1} ))
else
        bind '"\er":'
        bind '"\e^":'
fi
}

[[ -f "$HOME/.cargo/env" ]] &&
	. "$HOME/.cargo/env"
