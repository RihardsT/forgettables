### IO monitoring
# iostat
watch -n 1 iostat -y 1 1


### JVM monitoring
# https://stackoverflow.com/questions/14464770/how-to-check-heap-usage-of-a-running-jvm-from-the-command-line/41748357#41748357
jstat -gc $(pgrep java) | awk '{print $3+$4+$6+$8}'
