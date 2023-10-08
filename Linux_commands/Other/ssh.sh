# Don't check host key for domain
vi ~/.ssh/config
Host rudenspavasaris.id.lv
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
