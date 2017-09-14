https://github.com/chef-cookbooks/jenkins/blob/master/test/fixtures/cookbooks/jenkins_smoke/recipes/default.rb
https://github.com/test-kitchen/test-kitchen/pull/393

### install chef-client via script. Probably deprecated, rarely necessary to use. Bootstrap takes care of chef-client installation
curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -v 12.19.36

### Use alternate .kitchen.yml file
Kitchen takes .kitchen.yml by default. .kitchen.local.yml overrides it, if it exists.

```
export KITCHEN_LOCAL_YAML=.kitchen.local_ci.yml
chef exec kitchen list
```
