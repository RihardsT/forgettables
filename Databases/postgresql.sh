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
# Show size for specific DB \l+ is great, because it's human readable
\l+ DB_NAME
select pg_database_size('DB_NAME');

### General commands
select * from TABLE_NAME;
select * from TABLE_NAME where COLUMN_HERE like '%PATTERN%';
# Usually specific DB words written in uppercase, thus writing here all variables in lowercase
UPDATE table_name SET column_name = 'value' WHERE other_column_name = 'matching_value';
INSERT INTO table_name (column, column) VALUES (value_1, value_2);
### Insert with subquery. First value you set directly, second taken from other table.
INSERT INTO table_name (column, column) SELECT value, table_name_2.column_name FROM table_name_2 WHERE column_name = 'value';


######### Upgrade
### Nice and simple:
# Dump from old version
pg_dumpall -U USERNAME > DUMP_FILE
# Upgrade to new version and then restore the dump
psql -U USERNAME -d postgres -f DUMP_FILE

### pgpass, to read password from file.
# This is for pg_dump and I guess other pg_* commands
echo '
HOST:PORT:DB_NAME:USER:PASSWORD
localhost:5432:DB_NAME:postgres:PASSWORD
' > ~/.pgpass
chmod 0600 ~/.pgpass
# This ^^ then should just make pg_dump, etc work
# Or export env variable, if you use another path/file
export PGPASSFILE=~/.pgpass

# psql doesn't take PW from pgpass, but from variable
export PGPASSWORD="PASSWORD"
