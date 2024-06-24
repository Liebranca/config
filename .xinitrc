xset r rate 180 30
xrdb ~/.Xresources
setxkbmap -layout es
xmodmap $ARPATH/config/xlycon

xwallpaper --zoom ~/wallpaper.jpg
exec ~/bin/rt/rt.pl &
exec xbanish -t 1 &

picom -f -c &
exec dwm
