# Remove containers with exited status
docker rm $(docker ps -q -f status=exited)