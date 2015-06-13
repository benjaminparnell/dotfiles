xrdb -merge ~/.Xresources
xset fp rehash

# set wallpaper
feh --bg-scale ~/Pictures/Wallpapers/blackhole.jpg

# fire up the wm
sxhkd &
exec bspwm
