# start Oracle Net Listener
# Class: oracledb::listener
#
#
class oracledb::listener {

  $oracleHomeDir = hiera('capd-oracle-homedir')
  $oracleBaseDir = hiera('capd-oracle-basedir')
  $execPath      = "/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:${oracleHomeDir}/bin"

  exec { 'listener start':
    command      => "${oracleHomeDir}/bin/lsnrctl start",
    path         => $execPath,
    user         => 'oracle',
    group        => 'dba',
    environment  => ["ORACLE_HOME=${oracleHomeDir}", "ORACLE_BASE=${oracleBaseDir}", "LD_LIBRARY_PATH=${oracleHomeDir}/lib"],
    logoutput    => true,
    unless       => "/bin/ps -ef | grep -v grep | /bin/grep '${oracleHomeDir}/bin/tnslsnr'",
  }

  # ->

  # file { '/etc/init.d/oraclelistener' :
  #   ensure         => present,
  #   mode           => '0755',
  #   owner          => 'root',
  #   content        => template('oracledb/oraclelistener.erb'),
  # }

  # service { 'oraclelistener':
  #   ensure    => running,
  #   hasstatus => false,
  #   enable    => true,
  #   require   => File['/etc/init.d/oraclelistener']
  # }

}
