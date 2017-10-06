# Install docker
sudo curl -fsSL https://get.docker.com/ | sh

# Change where docker data (images, etc) will be stored.
# Historically this was easier, because graphdir dockerd option was not working.
ln -s PATH_TO_NEW_LOC /var/lib/docker

# Remove containers with exited status. docker system/container prune is simpler
docker rm $(docker ps -q -f status=exited)
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


## Docker machine
docker-machine start
eval "$(docker-machine env --shell bash default)"
docker ps



### Allow access to hosts docker socket from within container
-v /var/run/docker.sock:/var/run/docker.sock