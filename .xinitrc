xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts
xset fp rehash

# set wallpaper
feh --bg-scale ~/Dropbox/Wallpapers/golden-hour.jpg

# touchpad config
synclient PalmDetect=1 PalmMinWidth=5 PalmMinZ=20

# disable screensaver
xset s noblank
xset s off

# map capslock to escape
setxkbmap -option caps:swapescape

xsetroot -cursor_name left_ptr &
# fire up the wm
sxhkd &
exec bspwm
