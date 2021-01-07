#!/bin/bash

rofi_command="rofi -theme themes/power-menu.rasi"

### Options ###
power_off=" shut down"
reboot="勒 reboot"
lock=" lock"
log_out=" log out"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "⏼")"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        sleep 1  # stop rofi window from appearing on lockscreen
        loginctl lock-session
        ;;
    $log_out)
        i3-msg exit
        ;;
esac
