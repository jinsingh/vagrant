# Class initialises database to allow postgresql service to start

class postgresql::initdb {

# Initialise Postgresql
  exec {'initialise_pgsql':
    command   => '/etc/init.d/postgresql-9.2 initdb',
# note: below doesn't create the file but checks if it's present and only proceeds if false
    creates   => '/var/lib/pgsql/9.2/data/postmaster.opts',
}
}
