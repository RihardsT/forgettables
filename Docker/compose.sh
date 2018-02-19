https://hub.docker.com/r/docker/compose/

docker run -ti --rm --name compose --privileged -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/d -w /d docker/compose:1.19.0 build
docker exec -ti compose docker-compose run web 
