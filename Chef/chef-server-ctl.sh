################# Pushy
sudo chef-server-ctl restart opscode-pushy-server
sudo chef-server-ctl stop opscode-pushy-server
sudo chef-server-ctl start opscode-pushy-server

chef gem install knife-push -v 1.0.1
chef exec knife job start 'chef-client' NODE_EXPRESSION

################# chef-server-ctl User stuff
sudo chef-server-ctl user-list
sudo chef-server-ctl org-list

sudo chef-server-ctl user-create USERNAME FIRST_NAME [MIDDLE_NAME] LAST_NAME EMAIL PASSWORD
sudo chef-server-ctl org-user-add ORGANISATION USERNAME --admin
sudo chef-server-ctl user-show -l USERNAME

# To delete a user
sudo chef-server-ctl user-show USERNAME --with-orgs
sudo chef-server-ctl org-user-remove ORG_NAME USERNAME
sudo chef-server-ctl user-delete USERNAME

# Change Password
sudo chef-server-ctl password USERNAME

################# Knife CTL
# chef gem install knife-acl
knife user list
knife group list
knife group show GROUP_NAME
knife group show admins
knife group add user USERNAME admins
# Remove user from admins group
knife group remove user USERNAME admins
knife user delete USERNAME

knife user create USERNAME DISPLAY_NAME FIRST_NAME LAST_NAME EMAIL PASSWORD (options)





################# Testing with clean Chef server
### On chef server, create org
sudo chef-server-ctl org-create test-org "Test Organization"
  # save the test-org-validator.pem
sudo chef-server-ctl user-create testuser test user EMAIL PASSWORD
  # save the testuser.pem
sudo chef-server-ctl org-user-add test-org testuser --admin

### Locally
# Generate chef-repo https://docs.chef.io/chefdk_setup.html#create-chef-directory
chef generate repo test-org
mkdir -p test-org/.chef
cd test-org/
# copy the .pem files to .chef folder
cat > .chef/config.rb <<\EOM
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'testuser'
client_key               "#{current_dir}/testuser.pem"
validation_client_name   'test-org-validator'
validation_key           "#{current_dir}/test-org-validator.pem"
chef_server_url          'https://SERVER_URL_GOES_HERE/organizations/test-org'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
EOM

# Test connection to chef server
knife client list

knife upload .
knife bootstrap NODE_IP --ssh-port 22 --ssh-user 'SSH_USER' --sudo  --run-list "role[example]" -E example --bootstrap-version 12.19.36 --node-name test_node
