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
# Getting the stupid MAC address error. Back to docker-machine ssh

# Shared folders
sudo mkdir /d
sudo mount -t vboxsf -o uid=1000,gid=50 SHARE_NAME /d

vi /mnt/sda1/var/lib/boot2docker/profile
sudo mkdir /d
sudo mount -t vboxsf -o uid=1000,gid=50 SHARE_NAME /d

##### "Native" Docker for Windows with WSL.
# !!!!!!! Drive sharing didn't work with this in the end, so it's all pointless.
## Windows is the worst
# Add your user to necessary groups
Computer Management -> Local users and Groups -> Groups ->
Double click -> Add -> Enter the object names to select -> Ok
Add yourself to these groups in such way:
- Hyper-V Administartors # for shared folders
- docker-users # to be even able to run docker

# Install docker in wsl and then:
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc
docker ps -a


# In case docker doesn't want to start or something
Task Manager -> Services -> stop/start `vmms` service
