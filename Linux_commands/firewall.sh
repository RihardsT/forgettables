### CentOS
yum install -y firewalld firewall-config
# enable, start the service

# get zones
firewall-cmd --get-zones
firewall-cmd --get-default-zone

# list all rules
firewall-cmd --list-all
firewall-cmd --zone=home --list-all

# Add as runlevel, runtime change. Lost when when reloaded
firewall-cmd --zone=home --add-source=IP_RANGE #/24
# Add permament change with --permament flag. Applied when reloaded
firewall-cmd --zone=home --permanent --add-source=IP_RANGE
firewall-cmd --reload

# Add a port Public zone applies to all - catch all zone?
firewall-cmd --zone=public --add-port=80/tcp

# Enable panic mode - lock down evevrything. Only local console is available
firewall-cmd --query-panic
firewall-cmd --panic-on

# GUI
firewall-config
