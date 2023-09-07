##### Kill
# Get list of processes
tasklist | select-string -pattern 'PROCESS_NAME'
taskkill /f /PID PID_OF_THE_PROCESS

# Envrionment variables
Get-ChildItem ENV: # Output all env variables
$ENV:VARIABLE_NAME # Single variable
$HOME # Somehow not included in $ENV
# Set
$Env:VARIABLE_NAME = "VALUE"
