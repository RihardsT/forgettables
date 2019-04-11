show data_directory;

psql -U postgres -h localhost DB_NAME
\list # List db's
\connect DB # connect to db, same as \c
\dt # list db tables

### create db
# with createdb executable
createdb -T template0 DB_NAME
createdb -U postgres DB_NAME
# create db in psql and create user and grant it access to DB
CREATE DATABASE DB_NAME;
CREATE USER USER_NAME WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE DB_NAME TO USER_NAME;

### Drop db
DROP DATABASE DB_NAME;

### Backup/restore https://www.postgresql.org/docs/10/static/backup-dump.html
pg_dump -U postgres DB_NAME > DUMP_FILE
  # Other options: -h localhost -p 5432
  # -o # If, for example, foreign keys have to be dumped.

# Restoration
createdb -U postgres DB_NAME # create the target db before restoring
psql DB_NAME < DUMP_FILE

# Backup and restore all databases
pg_dumpall > DUMP_FILE
psql -f DUMP_FILE postgres


### Show DB sizes
# Show size for all db's
\l+
# Show size for specific DB \l+ is gread, because it's human readable
\l+ DB_NAME
select pg_database_size('DB_NAME');
