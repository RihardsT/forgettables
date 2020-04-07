http://www.unixgeeks.org/security/newbie/unix/cron-1.html

Cron:
42 4 1 * * root COMMAND # put it at /etc/cron.d/

42 4 1 * * root run-parts /etc/cron.monthly
1. ir minūte
2. stunda
3. day of the month
4. mēnesis
5. day of the week
tad nāk useris un komanda

visiem tiem skaitļiem var ari likt, lai vairākas reizes tas būtu
piem minūtēm - 15,45 - izpildīs 2x stundā
*/4 - katras 4 minūtes
5-10 - 5min pēc kārtas

*/STEP # executes per step, calculated from start.
# For example, 8/5 does not mean it will be executed every 5 days, but rather
# on 1,6,11,16,21,26,31 days of the month, if month has so many days. Then repeat.

# Super dirty way of clearing out berkeleydb logs
/etc/cron.d/clear_openldap_logs

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr

00 9 * * * root find /usr/local/berkeleydb/openldap-logs/ -mmin +100 -exec rm {} \;

slapd_db_archive -d

sudo service cron reload
sudo /etc/init.d/crond reload



#### at, also a scheduler
yum install -y at
systemctl enable atd # enable at daemon
systemctl start atd

at now +5 min
at 12:00am # enter and it will ask for command to execute
#  ctrl + d twice to close and save?
atq # show scheduled/queud jobs
atrm 1 # remove 1st item from queue

# Allow/deny
/etc/at.allow # allow specific users to use at utility
/etc/at.deny #



# Cron only runs a job if the system on at the time.
# If something is scheduled, but machine is off, cron will not execute it once
# machine is back on
# anacron can be used to work around that limitation.
# anacron is only for privileged users
/etc/anacrontab
3 0 JOB_NAME COMMAND # Every 3 days, delay in minutes, COMMAND

/var/spool/anacron # timestamps of last anacron runs
