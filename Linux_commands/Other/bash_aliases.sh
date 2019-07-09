alias dps="docker ps -a --format 'table {{.ID}} | {{.Status}} | {{.Names}}'"
alias dsp="docker system prune"
alias dcomp="docker run --name compose --rm -ti -v ${PWD}:${PWD} -w ${PWD} -v /var/run/docker.sock:/var/run/docker.sock docker/compose:1.24.1"

## Make permanent
tee -a .bashrc <<EOF
alias dps="docker ps -a --format 'table {{.ID}}\t{{.Status}}\t{{.Names}}'"
alias dsp="docker system prune"
EOF
