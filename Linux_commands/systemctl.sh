### /etc/systemd/system

### Get current target
systemctl get-default

### Set default
systemctl set-default multi-user.target

### Move to another target, if it allows so
systemctl isolate multi-user.target
systemctl isolate graphical.target

###
