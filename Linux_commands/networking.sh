ping IP
tracepath IP
treaceroute IP
netstat
ss -a # show established connections
ip -s # on Centos only?


ls /sys/class/net # list network devices
nmcli dev status # network control manager. dev = device
nmcli con show # show connection
nmcli con add help # help
nmcli con add con-name "CONNECTION_NAME" autoconnect yes type ethernet ifname eth1 # double tab forr autocomplete
ip route
nmcli con add con-name "CONNECTION_NAME" type ethernet ifname eth1 ip4 10.0.0.16 gw4 10.0.0.1 # create static connection
nmcli con down "CONNECTION_NAME"
nmcli con up "CONNECTION_NAME"
nmcli con mod "CONNECTION_NAME" connection.autoconnect yes # modify
nmcli con del "CONNECTION_NAME"
