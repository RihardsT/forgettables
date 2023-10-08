# In Gitlab
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519

# sign with the -S flag
git commit -S -am "Commit as usual"

git config --global commit.gpgsign true
