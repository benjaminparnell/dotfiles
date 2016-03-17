#!/bin/sh
# Needs HandleLidSwitch=ignore to be in /etc/systemd/logind.conf
# sudo restart systemd-logind
#	/etc/acpi/events/lm_lid should contain
# event=button/lid.*
# action=/etc/acpi/lid.sh
state=$(cat /proc/acpi/button/lid/LID/state | cut -d" " -f7)
mirroring=$(cat /home/benp/mirroring)
suspend_cmd='/usr/sbin/pm-suspend'

if [ $mirroring -eq 0 -a $state = "closed" ]; then
	$suspend_cmd
fi
