mysql -u USER -h localhost -p -D DATABASE_NAME # -p for password. If empty will ask to enter

SHOW DATABASES;
USE DATABASE_NAME
SHOW TABLES;

SHOW FULL PROCESSLIST;
SHOW VARIABLES; # show loaded system variables

# Concat. This was usefull to find trailing whitespace
select CONCAT(COLUMN_NAME,'Text') from TABLE_NAME;

# Update value in table, where it matches...
UPDATE TABLE_NAME SET COLUMN_NAME = 'VALUE' WHERE OTHER_COLUMN_NAME = 'MATCHING_VALUE';
