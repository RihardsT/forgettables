ssh-keygen -t rsa -b 4096 -C "EMAIL"
eval "$(ssh-agent -s)"; ssh-add ~/.ssh/gitlab

git config --global user.email "EMAIL"
git config --global user.name "NAME SURNAME"
git config --global core.editor vim
# git config --global credential.helper 'cache --timeout=604,800'
git config --global credential.helper store
git config --local --list

# Rename branch
git branch -m OLD_BRANCH_NAME NEW_BRANCH_NAME

cd /working_folder
git init #initalize git repository in that folder
git status
git add file_to_track.txt
#veic izmaiņas failā.
git status
git commit -m "Add cute octocat story" #Saglabā izmaiņas ar komentāru

git add '*.txt' # šādi pievieno vairākus failus
git commit -m "Add many files"
git log #Parāda commit's ar komentāriem
git reset --soft HEAD^ #To keep the changes from the commit you want to undo
git reset --hard HEAD^ #To destroy the changes from the commit you want to undo
git reset --soft HEAD~2 #go back 2 commits.

git remove -v #shows remotes
#To push local repo to GitHub, need to add a remote repo
git remote add REMOTE_NAME REPOSITORY_URL
git push -u origin master #remote nosaukums ir origin, default local branch name = master
#-u pasaka git'am, lai atceros tos parametrus, lai nākamreiz var rakstīt git push un tas strādās.

# Multiple remotes. Will push to all remotes added this way
git remote set-url origin --push --add <a remote>
git remote set-url origin --push --add <another remote>

git fetch #gets latest remote version, but doesn't merge it in
git pull origin master #novelk no repo jaunāko versiju #fetches and merges
git diff HEAD #HEAD apzīmē mūsu jaunāko commit. diff izvadīs atšķirības.
git diff --staged #parāda vēl ne'commit'ed atšķirības, kuras veiktas.

git reset octofamily/octodog.txt #unstage files
git checkout -- octocat.txt #failus var atjaunot līdz pēdējā commit stadijai ar checkout
git branch clean_up
git checkout clean_up

git rm '*.txt'
git commit -m "Remove all the cats"
git checkout master #ar checkout var pārslēgties starp branch'iem
git merge clean_up #clean_up ir tukšais vai izlabotais branch.
#merge izdara clean_up branch'a izmaiņās master branch'ā.
git branch -d clean_up #-d izdzēš branch
git push #uzspiež to visu uz remote repo

#  Amend multiple commits. Change author of multiple commits
git rebase -i -p <some HEAD before all of your bad commits>
# Then mark all of your bad commits as "edit" in the rebase file
git commit --amend --author "NAME SURNAME <EMAIL>"
git rebase --continue
# Quicker option, if commit messages don't have to be changed.
git commit --amend --author "NAME SURNAME <EMAIL>" --no-edit && git rebase --continue

# Change author of single commit. Either of these 2 will do I guess
git -c user.name="NAME SURNAME" -c user.email=EMAIL commit --amend --reset-author
git commit --amend --author "NAME SURNAME <EMAIL>"

# Tags
git push --all origin
git push --tags origin
git push origin master --follow-tags

git tag -a NAME

# "Delete" some commits from the remote. Only on repo you work on single handedly.
git reset --hard <Commit id>
git push origin HEAD --force	#praktiski izdzēš vēlākos commits

### Submodules
git submodule add REPOSITORY_URL FOLDER_NAME
git submodule update

### Remove submodule
git submodule deinit
# rm the submodule from .gitmodules
git rm --cached path_to_submodule
git commit

### Pull latest versions of submodules
git submodule init # Possibly required, hah
git submodule update --recursive --remote # Checkout the latest from remote


### get hash of latest commit.
git rev-parse --short HEAD
