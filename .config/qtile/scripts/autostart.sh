#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

# Wallpaper
#run feh --bg-scale --no-xinerama /home/j0rdi/images/morning.png &
run feh --bg-fill /home/j0rdi/images/wallpapers/nord/the-great-wave.png &
# ~/.fehbg &

# Display
run xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rate 143.92 --output DVI-D-0 --mode 1920x1080 --pos 1920x0
#run xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 143.92 --output DVI-D-0 --mode 1920x1080
#autorandr horizontal

#Set native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.config/qtile/scripts/set-screen-resolution-in-virtualbox.sh

#Mount OneDrive
sh -c "rclone --vfs-cache-mode writes mount onedrive: ~/onedrive" &

# Start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
