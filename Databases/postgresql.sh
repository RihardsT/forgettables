show data_directory;

psql -U postgres -h localhost DB_NAME
\list # List db's
\connect DB # connect to db, same as \c
\dt # list db tables

### create db
createdb -T template0 DB_NAME
createdb -U postgres DB_NAME


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
