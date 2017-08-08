# Create user without password
adduser --disabled-password --gecos '' USERNAME # In the '' goes user description

# Add user to group
usermod -aG GROUP_NAME USERNAME


# Change password expiry age?
chage -I -1 -m 0 -M 99999 -E -1 USERNAME
# 
passwd -x 99999 USERNAME
