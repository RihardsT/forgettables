https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

sudo apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x autoconf make build-essential

git clone git://git.kernel.org/pub/scm/git/git.git

cd git
git checkout master
make configure
./configure --prefix=/usr
make all doc info
sudo make install install-doc install-html install-info
