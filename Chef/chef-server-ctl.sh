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
