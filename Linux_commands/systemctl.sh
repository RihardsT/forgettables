### /etc/systemd/system

### Get current target
systemctl get-default

### Set default boot target
systemctl set-default multi-user.target

### Move to another target, if it allows so
systemctl isolate multi-user.target
systemctl isolate graphical.target

### boot stuff
systemd-analyze blame # check what took how much time during boot

###
# list services that will be started on boot
systemctl list-dependencies multi-user.target
systemctl enable SERVICE # adds service to target dependencies

###
