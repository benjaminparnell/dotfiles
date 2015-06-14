xrdb -merge ~/.Xresources
xset fp rehash

# set wallpaper
feh --bg-scale ~/Pictures/Wallpapers/wheat.jpg

# fire up the wm
sxhkd &
exec bspwm
