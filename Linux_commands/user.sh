# Create user without password
adduser --disabled-password --gecos '' USERNAME # In the '' goes user description

# Add user to group
usermod -aG GROUP_NAME USERNAME
