WHENEVER SQLERROR EXIT SQL.SQLCODE

prompt Start all the things
        
prompt Create tablespaces
@@01_tablespaces.sql

prompt Create users
@@02_users.sql

prompt Done all the things

exit;
