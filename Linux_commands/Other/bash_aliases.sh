alias dps="docker ps -a --format 'table {{.ID}} | {{.Status}} | {{.Names}}'"
alias dsp="docker system prune"


## Make permanent
tee -a .bashrc <<EOF
alias dps="docker ps -a --format 'table {{.ID}}\t{{.Status}}\t{{.Names}}'"
alias dsp="docker system prune"
EOF
