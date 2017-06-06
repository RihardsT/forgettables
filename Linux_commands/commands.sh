# Example: copy from remote server to local.
# -r for recursive = folders
scp -r USER@SOURCE:/SOURCE_FILE_OR_DIR TARGET -P 22

# Disk usage
sudo du -sch | sort -h

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