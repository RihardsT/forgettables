pyenv local 2.7.13 # Because ansible and molecule work better with python2
pip install -U packaging; pip install -U ansible
which ansible

ansible-galaxy install --roles-path ./roles ANSIBLE_GALAXY_ROLE
ansible-galaxy install --roles-path ./roles -r requirements.yml #Or put required roles in requirements

# ansible-playbook # apply a playbook to servers
# --check # dry run
# --forks
# --limit=backend # limit on which Inventory items will run
# --private-key PATH_TO_KEY # private key for ssh'ing
# --ask-pass # To ask for password when setting up pi
# -e 'ansible_port=22' # Can set different ssh port

export ANSIBLE_NOCOWS=1 # Skip the overly verbose cows
# Skip the overly verbose cows, permanently. In my case, in bash_profile did the trick, not .bashrc
echo "export ANSIBLE_NOCOWS=1" >> ~/.bash_profile

ansible-playbook -i ./Inventory --limit backend --diff Playbook.yml
# Pass environment variable, here set to use python3. Same can be done in Inventory file
ansible-playbook -i ./Inventory -e 'ansible_python_interpreter=/usr/bin/python3' -u USER Playbook.yml
# Other variable examples:
-e 'ansible_port=22'

# Run setup to get a list of all available ansible variables, like ansible_architecture
ansible -i Inventory -m setup HOSTS

# ansible-pull - Set nodes to periodically pull and apply config from repository
https://github.com/ansible/ansible-examples/blob/master/language_features/ansible_pull.yml


### Roles
mkdir roles
cd roles
ansible-galaxy init common
ansible-galaxy init apache

# Adding tests with Molecule:
pip2 install -U ansible docker molecule
molecule init --driver docker
  # Add ansible: to molecule.yml
molecule --help