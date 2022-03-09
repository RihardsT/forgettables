# Install docker
sudo curl -fsSL https://get.docker.com/ | sh

# Change where docker data (images, etc) will be stored.
# Historically this was easier, because graphdir dockerd option was not working.
ln -s PATH_TO_NEW_LOC /var/lib/docker

# Remove containers with exited status. docker system/container prune is simpler
docker rm $(docker ps -q -f status=exited)
# Run any docker command on particular set of containers. choose which ones with grep, get ID with awk
docker rm $(sudo docker ps --filter "status=exited" | grep "1. hours ago" | awk '{print $1}')
# Force remove of found containers by EXPRESSION
sudo docker rm -f $(sudo docker ps -a | grep "EXPRESSION" | awk '{print $1}')
# Remove exited containers, hanging volumes, etc.
docker system prune -f


# Dockerfile reference
https://docs.docker.com/engine/reference/builder/

# Inspect running containers
https://lumogon.com/

##
https://blog.docker.com/2017/06/announcing-docker-17-06-community-edition-ce/

## Build in current dir
docker build -t TAG .

## Tag existing image
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

### Allow access to hosts docker socket from within container
-v /var/run/docker.sock:/var/run/docker.sock

# Getting ssh: connect to host 172.17.x.x port 22: No route to host error?
# Change bridge network ip range, so it doesn't overlap with your IP range
sudo vi /etc/docker/daemon.json
{
  "bip": "172.26.0.1/16"
}
# Restart daemon after
