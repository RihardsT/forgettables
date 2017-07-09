pyenv local 2.7.13 # Because ansible and molecule work better with python2
pip install -U packaging
pip install -U ansible
which ansible

ansible-galaxy install --roles-path ./roles
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

# Run setup to get a list of all available ansible variables, like ansible_architecture
ansible -i Inventory -m setup HOSTS