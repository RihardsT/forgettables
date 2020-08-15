### Crontab
@reboot ( sleep 1 ; /bin/echo "disable" > /sys/firmware/acpi/interrupts/gpe16 )

`/etc/rc.local` seems to be deprecated and either seems to be more difficult to do than cron.
