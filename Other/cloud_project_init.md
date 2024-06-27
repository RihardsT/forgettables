### Setup tools to work with personal cloud project
```
sudo apt install ansible-core unzip

wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip
unzip terraform*
sudo mv terraform /usr/bin/terraform
```

Add hcloud_token in `terraform.tfvars`.  
Get Scaleway token.
