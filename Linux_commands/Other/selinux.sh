# SELinux status
getenforce
# Set permissive mode. To test if issue is SELinux related.
setenforce 0
# Set enforcing mode
setenforce 1

### Default config
/etc/selinux


# disable re-enable selinux to restore file contexts

### Define context
# Find context of existing folder. Find here the context you want maybe
semanage fcontext -l | grep FOLDER
# Add context -a with type -t, add to FOLDER and all contents in it (/.*),
# it's optional context due to '?'
semanage fcontext -a -t CONTEXT_TYPE_t '/FOLDER(/.*)?'

### Restore context
# -R recursive, -v verbose
restorecon -Rv FOLDER

### Remove context
semanage fcontext -l | grep FOLDER
semagage fcontext -d '/FOLDER(/.*)?'
restorecon -Rv FOLDER
