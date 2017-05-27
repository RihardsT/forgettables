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
ansible-playbook -i ./Inventory Playbook.yml --limit backend --diff
