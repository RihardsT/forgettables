!! # This runs the last command in terminal. Bevare! Putting this in my git commit message, ruined my message. :D

# NTP time sync at least on Centos
sudo service ntpd stop; sudo ntpd -q; sudo service ntpd start

# Example: copy from remote server to local.
# -r for recursive = folders
scp -r -P 22 USER@SOURCE:/SOURCE_FILE_OR_DIR TARGET

# Disk usage
sudo du -sch | sort -h
df -h
df -ih # show inode usage

# Symlinks
ln -s TARGET LINK_NAME
unlink mySymLink

# List Open ports and process that owns them
sudo lsof -i
sudo netstat -lptu | grep 8088
sudo netstat -tulpn

# Find what port program listens to by its PID
ss -lpn | grep ",9329,"

#create a tar
tar -cvf FILENAME.tar TARGET
tar --exclude='FILE_TO_EXCLUDE' -cvf FILENAME.tar TARGET
# Create a tar.gz
tar -cvzf FILE.tar.gz
tar -cvzf FILE.tar.gz $(ls -d /var/log/* | grep -v /var/log/EXCLUDE_THIS) #Exclude folder
# Untar
tar -xvf FILENAME.tar # -C /some/target/directory
tar -xvzf FILENAME.tar.gz # -C /some/target/directory

# Truncate a file
truncate -s 0 FILE

# find all files with that extension
find $PWD -name *.json
find $PWD -iname "EXPRESSION"
# Find folders
find PATH_TO_SEARCH -type d -iname "*REGULAR_EXPRESSION*"
# https://unix.stackexchange.com/questions/89925/how-to-delete-directories-based-on-find-output
# Delete the found folders. I like this because you can see what gets deleted
find PATH_TO_SEARCH -type d -iname "*REGULAR_EXPRESSION*" -exec rm -r "{}" \;

# List attached disks and get some of their properties
lslbk --output NAME,SIZE,MOUNTPOINT,UUID

# sort by memory usage can also try -rss
ps aux --sort rss
# ps aux show human readable memory. I don't quite know how realistic are these values, but eh.
ps -eo size,pid,user,command --sort -size | grep EXPRESSION | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }'
ps -eo size,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }'
ps -o stime,time $(pgrep EXPRESSION)
ps -p $(pgrep EXPRESSION) -o etime=

# get file creation time - https://unix.stackexchange.com/questions/50177/birth-is-empty-on-ext4/50184#50184
stat FILE # to get the inode
debugfs -R 'stat <INODE_HERE>' /dev/sdb1 # Keep the birds < >

# Some commands that do something. TODO: Update these eventually with descriptions
iostat
sar
