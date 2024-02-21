chef generate cookbook COOKBOOK_NAME -b


# Override template in wrapper cookbook
begin
  res = resources(template: "FULL_PATH_TO_FILE_ON_OS_AFTER_CHEF_RUN")
  res.cookbook "CURRENT_WRAPPER_COOKBOOK"
  res.source "TEMPLATE_NAME_IN_WRAPPER_COOKBOOK"
  res.mode 0755
  res.variables(:VARIABLE => node['ATTRIBUTE'])
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "File not found"
end


puts "########## PUTS ########## puts outputs if you use real chef-client. Usefull with --skip-cookbook-sync"
Chef::Log.warn "########## WARN ########## Chef log work better in kitchen though"


### Save node attributes in Kitchen
# These attributes could already be there at /tmp/kitchen/nodes/NODE
ruby_block "Save node attributes" do
  block do
    if Dir::exist?('/tmp/kitchen')
      IO.write("/tmp/kitchen/chef_node.json", node.to_json)
    end
  end
end
