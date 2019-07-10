## Docker machine
docker-machine start
eval "$(docker-machine env --shell bash default)"
docker ps


# "Fix" docker machine time drift
docker-machine ssh default "sudo date -u $(date -u +%m%d%H%M%Y)"


##### Get docker working in WSL
echo 'alias docker-machine="docker-machine.exe"' >> ~/.bashrc
sudo ln -s /mnt/c/ /c
# install docker
# sudo usermod -aG docker USERNAME
docker-machine start; docker-machine env --shell bash | sed 's/C:/\/c/' | sed 's/\\/\//g' | sed 's:#.*$::g' | sed 's/"//g'



##### Errors
### This machine has been allocated an IP address, but Docker Machine could not reach it successfully.
# Recreate the VM
docker-machine rm default
docker-machine create --driver virtualbox default
docker-machine env --shell bash | sed 's/C:/\/c/' | sed 's/\\/\//g' | sed 's:#.*$::g' | sed 's/"//g'
