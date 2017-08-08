#
kill -15 $(ps aux | grep EXPRESSION | awk '{print $2}')
# Kill sequence -15 -2 -1 -9. Basically never ever use -9
kill -15 # if that doesn't do it, -2
