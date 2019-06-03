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
