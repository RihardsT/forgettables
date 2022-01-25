######### Bootstrap node
echo "$(hostname).$(hostname -d)" # Get node FQDN, if you want to use it as node name
# bootstrap command. "'role[ROLE_NAME]'" the extra quotation marks are there because there is/was a bug with knife, that led to bootstrap with recipe[role], if single node set.
knife bootstrap NODE_IP --ssh-port 22 --ssh-user 'SSH_USER' --ssh-password "SSH_PASSWORD" --sudo --use-sudo-password  --run-list "'role[ROLE_NAME]'" -E ENVIRONMENT --bootstrap-version 12.19.36 --node-name NODE_NAME

######### Data bags. --local-mode to only do the change locally, in repository. Usefull when changes get applied by push to repo by some automation.
knife data bag show DATA_BAG ITEM -F json --local-mode
knife data bag from file DATA_BAG ITEM.json --secret-file .chef/encrypted_data_bag_secret --local-mode
# Edit data bag more easily. Even if it's encrypted.
knife data bag edit DATA_BAG ITEM --local-mode

# Kitchen files: cd, so ls shows data_bags/
knife data bag show DATA_BAG ITEM -F json --secret-file encrypted_data_bag_secret --local-mode
knife data bag from file DATA_BAG ITEM.json --secret-file encrypted_data_bag_secret --local-mode

######### knife search, return attributes
knife search node "name:*" -a ipaddress
-a run_list
-a chef_environment
-a platform_version
-a os_version # kernel version

knife search node "policy_name:POLICY AND policy_group:ENVIRONMENT" -a ipaddress
knife search node "(policy_name:POLICY OR policy_name:POLICY) AND policy_group:ENVIRONMENT" -a ipaddress

######### Set stuff
knife node run_list set NODE_NAME RUN_LIST_ITEM
knife node environment_set NODE_NAME ENVIRONMENT_NAME

knife node run_list remove NODE_NAME 'role[ROLE_NAME], recipe[RECIPE]'
knife node run_list add NODE_NAME 'role[ROLE_NAME], recipe[RECIPE]'

knife node policy set NODE POLICY_GROUP POLICY_NAME

######### Edit node attributes
knife node edit
# Add default attributes. Can set different precendence levels too. For example "override_attributes"
"default":{
  "java": {
    "jdk_version": "8"
  }
},

######### knife ssh
knife ssh 'name:*' 'COMMAND'

######### knife node
# Output node long node info as json into a file
knife node show NODE_NAME -l -F json > nodeinfo

######### knife exec
# Supposedly allows to set attributes on multiple nodes, if necessary. Or execute ruby code
knife exec -E "nodes.find(:name => 'NODE_NAME') { |node| node.default['ATTRIBUTE'] = 'VALUE'; node.save; }"
# Nodes transform. Don't know where this could be really used. But look, it could be used to set attributes
knife exec -E "nodes.transform('name:NODE_NAME') {|n| n.normal_attrs['ATTRIBUTE'].set({'KEY' => true}) rescue nil }"


######### Push jobs
chef exec knife job start 'chef-client' NODE_EXPRESSION # node*

######### Execute command on nodes. Seems like this will only work if chef-server can access those nodes
knife ssh 'name:*' 'sudo chef-client' -x USER -a ipaddress # -P flag to ask for password

######### Find out package versions using jq
knife node list > temp_nodes
while read line; do
  echo $line
  knife node show $line -l -F json | jq '{node: .name, ver: .automatic.packages.PACKAGE.version}' >> package_versions.json
done < temp_nodes
