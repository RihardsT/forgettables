!! # This runs the last command in terminal. Bevare! Putting this in my git commit message, ruined my message. :D

### Clear Bash history
history -c # Clears history from ~/.bash_history file
history -w # Writes current history to ~/.bash_history
histroy -cw

### Environment variables
printenv

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
sudo lsof -i # lsof = list open files. -i flag lists all network files
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
# Show concents
tar -tf FILENAME.tar # add v for verbose output

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
### Delete files older than DAYS. +1 is the amount of days. Here 1 day
find FOLDER -mtime +1 -exec rm -Rf -- {} \;
### Find changed files - less than + greater than time
find FOLDER -cmin -5

# List attached disks and get some of their properties
lslbk --output NAME,SIZE,MOUNTPOINT,UUID

# sort by memory usage can also try -rss
ps aux --sort rss
# ps aux show human readable memory. I don't quite know how realistic are these values, but eh.
ps -eo size,pid,user,command --sort -size | grep EXPRESSION | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }'
ps -eo size,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }'
ps -o stime,time $(pgrep EXPRESSION)
ps -p $(pgrep EXPRESSION) -o etime=
# Running processes as tree
ps -ejH
ps axjf

# get file creation time - https://unix.stackexchange.com/questions/50177/birth-is-empty-on-ext4/50184#50184
stat FILE # to get the inode
debugfs -R 'stat <INODE_HERE>' /dev/sdb1 # Keep the birds < >

# Some commands that do something. TODO: Update these eventually with descriptions
iostat
sar

# memory usage
free -m
# system monitor atop, htop
top

# kill process that's found by grep
kill -15 $(ps aux | grep EXPRESSION | awk '{print $2}')
# Kill sequence -15 -2 -1 -9. Basically never ever use -9
kill -15 # if that doesn't do it, -2


# share a single terminal between ssh'ed in users. Have to install something first I bet
screen -x shared

### Run command in background
nohup COMMAND & # One option
screen # Check this out
tmux # Also check this out. Multiple terminals from one screen


# date. man date
date +%Y-%m-%d-%H.%M.%S


# Clam Antivirus
sudo apt-get update && sudo apt-get install -y clamav
clamscan -r / # recursive scan probably.
clamscan -ro / # o to skip output of ok files


### Openssl
# Generate self signed cert. -nodes flag to not require passkey
openssl req -x509 -nodes -newkey rsa:4096 -keyout KEY_FILE.key -out CERTIFICATE.crt -days NUMBER_OF_DAYS

# Check if hashes match between cert and key.
openssl x509 -noout -modulus -in CERTIFICATE.crt | openssl md5
openssl rsa -noout -modulus -in KEY_FILE.key | openssl md5

### Show sites SSL certificate
openssl s_client -connect $ENDPOINT:443 -servername $ENDPOINT
### Show SSL certificate expiration date
openssl s_client -connect $ENDPOINT:443 -servername $ENDPOINT < /dev/null 2>&1 | openssl x509 -enddate -noout
### Show SSL certificate file expiration date
openssl x509 -enddate -noout -in FILE_NAME

### Sticky permissions to folders.
# This will ensure that files created there will be deleteable, modifyable by the set group.
# This is usefull, if root user is creating files there,
# thus preventing application user from modifying the files.
# No guarantees. Try this out.
mkdir FOLDER
chgrp GROUP_NAME FOLDER
chmod g+wrxs FOLDER # s for sticky
setfacl -d -m g::wrx FOLDER # -d default -m modify g::wrx group by defalt will have write, read, execute permissions

### Disk speed test with dd. You might want to change the output file size, bs=1M
dd if=/dev/zero of=/PLACE_ON_SPECIFIC_DISK bs=1G count=1 conv=fdatasync

### Quickly create a big file
fallocate -l 10G FILE

### Time tic toc. Show how long a command or script took to execute
time COMMAND

### Check limits for each process
cat /proc/<PID>/limits

### yes to interactive promts. yes Y. Useful whenever
yes STRING_HERE | COMMAND
