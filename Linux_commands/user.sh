# Create user without password
adduser --disabled-password --gecos '' USERNAME # In the '' goes user description

# Show users info, like password expiration, etc
chage -l USERNAME
# Remove pwd/account limit: pass -1 to option. Ex: account expiration
chage -E -1 USERNAME
# Change password expiry age?
chage -I -1 -m 0 -M 99999 -E -1 USERNAME
#
passwd -x 99999 USERNAME

# user list
less /etc/passwd
# user password file and some other data
less /etc/shadow
# shadow file collumns:
# USER:PWD_HASH:LAST_PASSWORD_DATE_SINCE_EPOCH:MIN_PWD_AGE:MAX_PWD_AGE:WARNING_DAYS:INACTIVE_DAYS:USER_EXPIRATION_DATE
# WARNING_DAYS - how many days before password expiration to warn user
# INACTIVE_DAYS - days in which you still can login, to change password. After it's passed, account is locked.
# USER_EXPIRATION_DATE - date when account will be locked. Not possible to login. Basically ! before PWD_HASH in shadow file

### User id's
0 # Root user
1-200 # system users
201-999 # users who use system processes, but don't own files, ex apache

### Defaults for new user creation?
/etc/login.defs
/etc/default/useradd


### groups
less /etc/group
# Get groups members
getent group USERNAME
# get all users groups and their id's
id USERNAME
groups USERNAME
# Set users primary group
usermod -g GROUP_NAME USERNAME
# Add user to additional group
usermod -aG GROUP_NAME USERNAME

# Modify group
groupmod

# login to group
# i.e. files created after this will be created with group permissions
newgrp GROUP_NAME
