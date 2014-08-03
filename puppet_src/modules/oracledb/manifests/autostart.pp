# Class: oracledb::autostart
# to add oracle to autostart on boot
#
class oracledb::autostart {

$dbName = hiera('capd-oracle-starter-globaldb-name')
$oracleHomeDir = hiera('capd-oracle-homedir')

file { '/etc/init.d/dbora' :
    ensure         => present,
    mode           => '0755',
    owner          => 'root',
    content        => template('oracledb/dbora.erb'),
  }

exec { "set dbora ${dbName}:${oracleHomeDir}":
    command        => 'sed -i -e"s/:N/:Y/g" /etc/oratab',
    unless         => "/bin/grep '^${dbName}:${oracleHomeDir}:Y' /etc/oratab",
    require        => File['/etc/init.d/dbora'],
  }

exec { 'chkconfig dbora':
        command        => 'chkconfig --add dbora',
        require        => File['/etc/init.d/dbora'],
        user           => 'root',
        unless         => 'chkconfig | /bin/grep "dbora"',
      }

}
