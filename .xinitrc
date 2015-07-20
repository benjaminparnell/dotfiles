xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash

# set wallpaper
feh --bg-scale ~/Dropbox/Wallpapers/tokyo.jpg

# touchpad config
synclient PalmDetect=1 PalmMinWidth=5 PalmMinZ=20

# fire up the wm
sxhkd &
exec bspwm
