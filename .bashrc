#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

function loop {
  mpv -fs --loop-playlist=inf "$@"

}

function xloop {
  loop --shuffle --scale=lanczos --speed=1.00 "$@"

}

function strm {
  mpv -fs --ytdl-format="best[width<=480]" "$@"

}

function roll {
  perl -I$ARPATH/THRONE -e 'use RPG::Dice @ARGV;' "$@"

}


function felf {
  objdump -D -b binary -mi386:x86-64 -Mintel,intel-mnemonic,amd64 "$@"

}


tabs 2


function mkex {
  touch $1;chmod +x $1;
}


function idnt {

  indent -slc -npsl -saf -sai -saw -bbo -lp -i2 -l56 -fca -fnc -brs -brf -br -cs -lp -bfda -bfde -bad -bap -ce -cdw -nhnl -nut -ntac -pal -pi2 -npro "$@"

};

AR_FONT=~/AR/fonts/lycon24.psfu
ARPATH=~/AR
LD_LIBRARY_PATH="$ARPATH/lib/:$LD_LIBRARY_PATH"

PATH="$PATH:$ARPATH/bin/:$ARPATH/forge/bin/"

if [ ! $DISPLAY ];then

  setfont -h26 $AR_FONT
  clear

fi

PS1='\[\e[32;22m\]$:\[\e[0m\]\[\e[?16;107c\]'

EDITOR=/usr/bin/nano
INCLUDE=~/gsys/fasm/inc

export INCLUDE
export EDITOR
export PATH
export ARPATH
export AUTOTRACE
export LD_LIBRARY_PATH
