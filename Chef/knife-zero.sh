# This needs to be heavily updated

chef exec gem install knife-zero
chef generate repo knife_zero_test
cd knife_zero_test/cookbooks
git clone COOKBOOK_REPO
cd ..
berks vendor -b cookbooks/COOKBOOK_NAME/Berksfile cookbooks/

knife zero bootstrap NODE_IP --ssh-port 22 --ssh-user 'SSH_USER' --ssh-password "SSH_PASSWORD" --sudo --use-sudo-password  --run-list "'role[ROLE_NAME]'" -E ENVIRONMENT --bootstrap-version 12.19.36 --node-name NODE_NAME
knife zero node run_list add NODE_NAME RUN_LIST_ITEM
knife zero converge "name:NODE_NAME" --ssh-user 'SSH_USER' --ssh-password "SSH_PASSWORD"
