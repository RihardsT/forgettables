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
sudo du -sch --inodes
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

### tar
# -z pass to gzip utility
# -k pass to bzip
# -c create a tar, -v verbose, -f filename of tar
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

# Show difference between existing files and archive
tar -dvf FILENAME.tar.gz

#
gzip
gunzip # or gzip -d

### star. Check it out. It allows to extract specific files and other goodies
# won't override that are newer on filesystem
# Create with star
star -c -f=FILENAME.tar FILE
star -cz -f=FILENAME.tar FILE #-z pass through gzip
# List files
star -t -f=FILENAME.tar
# Extract with star
star -x -f=FILENAME.tar FILE #Optional file, to extract specific file


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
# find files owned by USER
find FOLDER -user USER -type f

### Find files containing text
grep -rl 'PATH' -e 'PATTERN' # -r recursive, -l show filename not result
grep -rl 'PATH' --include='FILENAME_PATTERN' -e 'PATTERN' # --include only search in files matching pattern

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

pgrep -l PATTERN # ps with grep. lel
pgrep -v -u root -l # find all processes that are not owned by root. -v is NOT for grep

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
kill -l # list kill signals
-1 # SIGHUP hang up. Reports to processes that terminal has hanged up/closed or such.
-2 # SIGINT interrupt. Same as ctrl + c
-9 # SIGKILL. Brutal. Only as absolute last resort.
-15 # SIGTERM. Everyday typical work.
-18 # SIGCONT Start process that was stopped by -19 ?
-19 # SIGSTOP Stop process and allow it to be started again with
-20 # SIGTSTP A SIGSTOP that can be ignored

pkill PATTERN # grep kill process. default -15
pkill -t pts/1 # kill processes from specific terminal

# share a single terminal between ssh'ed in users. Have to install something first I bet
screen -x shared

### Run command in background
nohup COMMAND & # One option
screen # Check this out
tmux # Also check this out. Multiple terminals from one screen

COMMAND & # & should be enough for running in background. Alive while terminal is alive?
jobs # check what's running in background
kill -SIGSTOP %1 # stop specific job
kill -SIGCONT %1 # continue specific job

# date. man date
date +%Y-%m-%d-%H.%M.%S
# what date was 30 days ago
date -d "-30 days" # optional date format

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

### ACL's - allow access to files even for users without belonging to specific group
# + is shown in ls -l if there's extended (ACL) permissions
getfacl
# -m modify
setfacl -m u:USER_ID_OR_NAME:rw FILE
setfacl -m m::r FILE # Set mask
setfacl -m m::- FILE # Remove all permissions with mask. -
setfacl -m g::rwx FILE # Without user, works like chmod?
# -d default -m modify - set default permissions on new files in subdirectories
setfacl -d -m u:USER_ID_OR_NAME:rwx DIRECTORY
getfacl DIRECTORY
setfacl -m u:USER_ID_OR_NAME:rwx DIRECTORY # change the acl of existing folder
setfacl -m u:USER_ID_OR_NAME:rwx,g:GROUP:rwx DIRECTORY # multiple permissions
# Remove acls on folder. Check help
setfacl --remove-default
setfacl -x d:u:USER_ID_OR_NAME DIRECTORY # remove specific ACL. Here defaults
setfacl -x u:USER_ID_OR_NAME DIRECTORY # remove specific ACL
# Copy ACL to another file
getfacl FILENAME1 | setfacl --set-file=- # - here means from stdin

###
# u - user/owner , g - group, o - other, - remove permissions, + add permissions
# r - read, w - write, x - execute
chmod ugo+X -R FOLDER # add execute permissions to folders only. X applies to folder. x also to files

chown :GROUP FILE_OR_FOLDER

#
setuid # whenever user executes file, it will be executed as user who owns the file
chmod u+s FILE_OR_FOLDER # set
chmod 4500 FILE_OR_FOLDER # 4 setuid for user, 2 setuid for group, 6 for user and group
# sticky bit - prevent unauthorized users to remove/rename file/folder.
chmod +t FILE_OR_FOLDER
chmod 1777 FILE_OR_FOLDER

# Set that all files created in folder are created with specified group
setgid
chown :GROUP FOLDER
chmod g+s FOLDER


### umask - mask privileges. Set default permissions for newly created files/folders
# changing umask persists only for current session
0022 #=output. masks nothing for user, masks write privileges for group and other
umask 006 # mask permissions for other, for newly created files
touch TESTFILE
ls -lah TESTFILE
# /etc/bashrc /etc/profile - edit umask here to update default permissions somewhat permanently


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

### Write multiline file from terminal. EOM is the delimiter
cat > FILE <<- EOM
FILE_CONTENTS_GO_RIGHT_HERE
EOM


##### Shutdown, reboot
# Shutdown in 5 minutes
shutdown -r +5 Message for other users on the machine
shutdown -c # cancel reboot
shutdown -r 00:00 # at hh:mm
shutdown -H now # halt know
shutdown -P now # poweroff

### Set process priority
# -20 to 19. -20 = highest priority, 19 = lowest priority, very nice process
nice -n 0 PROCESS # start process with niceness of 0
renice -n 10 $(pgrep PATTERN) # change priority of multiple processes

##
cat /proc/cpuinfo



### Get rid of extension. String slicing etc?
https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
FILE="FILENAME"
echo "${FILE%%EXT}"
