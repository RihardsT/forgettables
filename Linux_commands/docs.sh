man APPLICATION # manual

mandb # build manual db, apropos will search this
apropos SEARCH_TERM

info # searches /usr/share/info or opens manpage
info --apropos=SEARCH_TERM

/usr/share/doc

updatedb # update cache for locate. By default updated daily by cron
locate SEARCH_TERM # searches for files from cache

whatis APPLICATION # searches man page descriptions
whereis APPLICATION # will also show doc location

rpm -qd PACKAGE # query documentation in RPM

### Logs
journalctl -f # follow all the logs going through journal

journalctl -xeu UNIT | less
