http://www.unixgeeks.org/security/newbie/unix/cron-1.html

Cron:
42 4 1 * * root run-parts /etc/cron.monthly
1. ir minūte
2. stunda
3. day of the month
4. mēnesis
5. day of the week
tad nāk useris un komanda

visiem tiem skaitļiem var ari likt, lai vairākas reizes tas būtu
piem minūtēm - 15,45 - izpildīs 2x stundā
*/4 - 4x stundā
5-10 - 5min pēc kārtas


# Super dirty way of clearing out berkeleydb logs
/etc/cron.d/clear_openldap_logs

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr

00 9 * * * root find /usr/local/berkeleydb/openldap-logs/ -mmin +100 -exec rm {} \;

slapd_db_archive -d

sudo service cron reload
sudo /etc/init.d/crond reload
