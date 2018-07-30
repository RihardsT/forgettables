# Debug chef-client run
chef-client -l debug --force-logger
# Query attribute value on node
sudo chef-shell -z;
attributes_mode;
node['attribute']


# Not sure where I got this and for what purpose
output="#{Chef::JSONCompat.to_json_pretty(node.to_hash)}"
file '/tmp/node.json' do
  content output
end


######### Broke something?
# Stop chef service
service chef-client stop
# Fix up /var/chef/cache/cookbooks and run chef
# Run chef without syncing cookbooks
chef-client --skip-cookbook-sync
