# == Class: oracledb::database
#
#
#
# Class: oracledb::database
#
#
class oracledb::database {
$oracleHomeDir = hiera('capd-oracle-homedir')
$oracleBaseDir = hiera('capd-oracle-basedir')
$oracleEdition = hiera('capd-oracle-edition')
$oracleGroup = hiera('capd-oracle-group')
$oraclePasswordAll = hiera('capd-oracle-password-all')
$oraclePasswordSYS = hiera('capd-oracle-password-sys')
$oraclePasswordSYSTEM = hiera('capd-oracle-password-system')
$oraclePasswordDBSNMP = hiera('capd-oracle-password-dbsnmp')
$oracleStarterGlobalDBName = hiera('capd-oracle-starter-globaldb-name')
$oracleDBSID = hiera('capd-oracle-sid')
$dbName = hiera('capd-oracle-starter-globaldb-name')

$execPath    = "${oracleHomeDir}/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:"

file { '/etc/dbca.rsp':
  ensure  => present,
  content => template('oracledb/dbca.rsp.erb'),
  owner   => 'oracle',
  group   => 'dba',
  mode    => '0600',
}

exec { 'install oracle database':
  command => 'dbca -silent -responseFile /etc/dbca.rsp',
  path    => $execPath,
  require => [Class['swap_file'], File['/etc/dbca.rsp']],
  creates => "${oracleBaseDir}/admin/${dbName}",
  timeout => 0,
  user    => 'oracle',
  group   => 'dba',
}

}
