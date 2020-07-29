### Use sshpass with password from environment
export SSHPASS='PASSWORD'
sshpass -e ssh user@IP 'COMMAND'

# Run local script remotely
sshpass -e ssh user@IP 'bash -s' < local_script.sh
sshpass -e ssh user@IP 'bash -s arg1' < local_script.sh
sshpass -e ssh user@IP ARG1='VALUE' 'bash -s' < local_script.sh
