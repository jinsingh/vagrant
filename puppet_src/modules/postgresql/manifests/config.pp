# Class defines postgresql config depending on node type and uses hiera lookups

class postgresql::config {

# we have to include the arrays module to pull in the definitions of server groups
  include arrays::servers

  file {'/var/lib/pgsql/9.2/data/postgresql.conf':
    source  => 'puppet:///modules/postgresql/postgresql.conf',
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0600',
  }

    file { '/var/lib/pgsql/9.2/data/pg_hba.conf':
      content => template('postgresql/pg_hba.conf.erb'),
      owner   => 'postgres',
      group   => 'postgres',
      mode    => '0600',
    }

}
