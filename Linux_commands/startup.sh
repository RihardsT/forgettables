### Check out /etc/rc.local file
# Add your startup script there. Good enough?
sudo vi /etc/rc.local
  /bin/echo "disable" > /sys/firmware/acpi/interrupts/gpe16
  # Had issues that kworker kacpi using lots of CPU
  # https://www.reddit.com/r/Fedora/comments/hmmnfb/high_cpu_usage_by_kworker_kacpid_on_fedora_32/
sudo chmod +x /etc/rc.local
