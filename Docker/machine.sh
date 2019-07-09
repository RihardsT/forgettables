## Docker machine
docker-machine start
eval "$(docker-machine env --shell bash default)"
docker ps


# "Fix" docker machine time drift
docker-machine ssh default "sudo date -u $(date -u +%m%d%H%M%Y)"


##### Get docker working in WSL
sudo ln -s /mnt/c/ /c
# install docker
# sudo usermod -aG docker USERNAME

docker-machine.exe start; docker-machine.exe env --shell bash | sed 's/C:/\/c/' | sed 's/\\/\//g' | sed 's:#.*$::g' | sed 's/"//g'
