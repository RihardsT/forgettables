https://github.com/metacloud/molecule

pyenv local 2.7.13
pip2 install -U ansible docker molecule

molecule init --role cloud_project_ansible_test --driver docker
cd test
molecule test
## Existing role
molecule init --driver docker

#### kitchen ansible
gem install kitchen-ansible
gem install kitchen-docker

kitchen init --create-gemfile --driver=kitchen-docker

https://werner-dijkerman.nl/2015/08/20/using-test-kitchen-with-docker-and-serverspec-to-test-ansible-roles/