alias dps="docker ps -a --format 'table {{.ID}} | {{.Status}} | {{.Names}}'"


## Make permanent
tee -a .bashrc <<EOF
alias dps="docker ps -a --format 'table {{.ID}}\t{{.Status}}\t{{.Names}}'"
EOF
