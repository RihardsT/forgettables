timedatectl
chronyd # on RHEL replacement for ntpd?

tzselect # timezone wizard, but doesn't set it actually
timedatectl list-timezones
timedatectl set-timezone TIMEZONE

# Set time to be local time. Disable NTP beforehand
timedatectl set-ntp false
timedatectl set-time HH:MM:SS
timedatectl set-ntp true
systemctl restart chronyd # of using chronyd instead of NTP?

chronyc
