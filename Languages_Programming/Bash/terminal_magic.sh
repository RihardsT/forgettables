# Search commands in your history
# crtl + r


######################## Files. Output redirect
echo "This" > file # Write/overwrite a file
echo "This" >> file # Append to a file
command 2> error_file # 2> represents stderr
command &> file # redirect both stdout and stderr
command 2>&1 # redirect stderr to stdout

command 2> /dev/null # redirect to nothing


########################
# su - su -l su --login # Login shell
.bash_profile # executed whenever we enter login shell
.bashrc # whenever entering interactive shell

/etc/profile # Global. Whenever a user logins