######### Bootstrap node
echo "$(hostname).$(hostname -d)" # Get node FQDN, if you want to use it as node name
# bootstrap command. "'role[ROLE_NAME]'" the extra quotation marks are there because there is/was a bug with knife, that led to bootstrap with recipe[role], if single node set.
knife bootstrap NODE_IP --ssh-port 22 --ssh-user 'SSH_USER' --ssh-password "SSH_PASSWORD" --sudo --use-sudo-password  --run-list "'role[ROLE_NAME]'" -E ENVIRONMENT --bootstrap-version 12.19.36 --node-name NODE_NAME

######### Data bags. --local-mode to only do the change locally, in repository. Usefull when changes get applied by push to repo by some automation.
knife data bag show DATA_BAG ITEM -F json --local-mode
knife data bag from file DATA_BAG ITEM.json --secret-file .chef/encrypted_data_bag_secret --local-mode

# Kitchen files: cd, so ls shows data_bags/
knife data bag show DATA_BAG ITEM -F json --secret-file encrypted_data_bag_secret --local-mode
knife data bag from file DATA_BAG ITEM.json --secret-file encrypted_data_bag_secret --local-mode

######### knife search, return attributes
knife search node "name:*" -a ipaddress
-a run_list
-a chef_environment
-a platform_version

######### Set stuff
knife node run_list set NODE_NAME RUN_LIST_ITEM
knife node environment_set NODE_NAME ENVIRONMENT_NAME

knife node run_list remove NODE_NAME 'role[ROLE_NAME], recipe[RECIPE]'
knife node run_list add NODE_NAME 'role[ROLE_NAME], recipe[RECIPE]'
