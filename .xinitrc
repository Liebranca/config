xset r rate 180 30
xrdb ~/.Xresources
setxkbmap -layout es
xmodmap xlycon

xwallpaper --zoom ~/Cruelty/wall2.jpg
exec ~/bin/rt/rt.pl &
exec xbanish -t 1 &

picom -f -c &
exec dwm
