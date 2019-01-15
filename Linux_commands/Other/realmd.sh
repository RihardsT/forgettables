### Connect to Active Directory to allow users to login
yum install -y realmd

realm discover AD_SERVER
# check the required packages, then install them


# modify sshd_config to allow Kerberos auth
vi /etc/ssh/sshd_config
# reload sshd

# Check login format
realm discover AD_SERVER
