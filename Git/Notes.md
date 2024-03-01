##### Definitely install Git LFS
```
sudo apt install git-lfs
```

Then in repo:
```
git lfs install
git lfs track "*.pdf"
git add .gitattributes
```

https://blog.gitbutler.com/git-tips-1-theres-a-git-config-for-that/
##### git config stuff
~.gitconfig
```
[includeIf "gitdir:~/Code/cloud_project"]
  path = ~/.gitconfig-cloud_project
[user]
	email = EMAIL
	name = NAME
[core]
	editor = vim
```
For automatic merge conflict resolution, if multiple reoccuring conflicts
```
git config --global rerere.enabled true
git config --global rerere.autoUpdate true
```

##### Random commands
```
# Blame with range
git blame -L 10,20 README.md
# Blame code block. Probably works better on actual code
git blame -L :'Kubernetes' README.md

# -w ignore whitespace, -C for code movement, to give blame to implementer
# not code mover
git blame -w -C -C -C FILE

#
git diff --word-diff
```
