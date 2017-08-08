# Debug chef-client run
chef-client -l debug --force-logger
# Query attribute value on node
chef-shell -z; attributes_mode; node['attribute']


# Not sure where I got this and for what purpose
output="#{Chef::JSONCompat.to_json_pretty(node.to_hash)}"
file '/tmp/node.json' do
  content output
end
