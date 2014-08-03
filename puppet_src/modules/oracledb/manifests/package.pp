# this defines the packages for OracleDB
class oracledb::package{

$oracleHomeDir = hiera('capd-oracle-homedir')
$oracleBaseDir = hiera('capd-oracle-basedir')
$oracleEdition = hiera('capd-oracle-edition')
$oracleGroup = hiera('capd-oracle-group')
$oraclePasswordAll = hiera('capd-oracle-password-all')
$oraclePasswordSYS = hiera('capd-oracle-password-sys')
$oraclePasswordSYSTEM = hiera('capd-oracle-password-system')
$oraclePasswordDBSNMP = hiera('capd-oracle-password-dbsnmp')
$oracleStarterGlobalDBName = hiera('capd-oracle-starter-globaldb-name')
$url = 'http://capmanagement'
$downloadDir = hiera('capd-oracle-download-dir', '/tmp/oraclesetup')
$capd_oracle_sys_username = hiera('capd-oracle-sys-username')
$capd_oracle_password_system = hiera('capd-oracle-password-system')
$capd_oracle_auth_sid = hiera('capd-oracle-auth-sid')
$abaco_db_siti_password = hiera('abaco-db-siti-password')


file { 'oracle-rdbms-server':
  ensure => file,
  path   => '/tmp/oracle-rdbms-server-12cR1-preinstall-1.0-8.el6.x86_64.rpm',
  source => 'puppet:///modules/oracledb/oracle-rdbms-server-12cR1-preinstall-1.0-8.el6.x86_64.rpm',
}->

# now to acutally install the prereq file

exec { 'install prereq':
  command => 'yum -y install /tmp/oracle-rdbms-server-12cR1-preinstall-1.0-8.el6.x86_64.rpm',
  unless  => 'rpm -qa | grep oracle-rdbms-server',
}->

# this part is for getting the setup files from the CI box:

exec { 'wget part 1of2':
  command => "wget -P ${downloadDir} ${url}/linuxamd64_12c_database_1of2.zip",
  creates => "${downloadDir}/linuxamd64_12c_database_1of2.zip",
  timeout => '0',
}->

exec { 'wget part 2of2':
  command => "wget -P ${downloadDir} ${url}/linuxamd64_12c_database_2of2.zip",
  creates => "${downloadDir}/linuxamd64_12c_database_2of2.zip",
  timeout => '0',
}->


#  so below we are going to extract them from archive

exec { 'extract part 1of2':

  command  => "unzip -qq ${downloadDir}/linuxamd64_12c_database_1of2.zip -d ${oracleBaseDir}",
  creates  => "${oracleBaseDir}/database/install/images/billboards.gif",
  timeout  => '0',
}->
exec { 'extract part 2of2':

  command  => "unzip -qq ${downloadDir}/linuxamd64_12c_database_2of2.zip -d ${oracleBaseDir}",
  creates  => "${oracleBaseDir}/database/stage/Components/oracle.rdbms/12.1.0.1.0/1/DataFiles/filegroup19.6.1.jar",
  timeout  => '0',
}->

# this is to give rwx permissions to directory where we want to install the
# Oracle software

exec { 'setACL':
    command => "setfacl -m u:oracle:rwx ${oracleBaseDir}",
}->

# this sets the ENV variable for user used to run Oracle
file { '/home/oracle/.bash_profile':
  ensure  => present,
  content => template('oracledb/bash_profile.erb'),
  owner   => 'oracle',
  group   => 'dba',
}->

# this is to enable silent mode installation

file { '/etc/oraInst.loc':
  ensure  => file,
  content => template('oracledb/oraInst.loc.erb'),
  owner   => 'oracle',
  group   => 'dba',
  mode    => '0664',
}->

# this is the Response File for Oracle Universal Installer, remove after installation for security

file { '/etc/defra_response_file.rsp':
  ensure  => file,
  content => template('oracledb/defra_response_file.rsp.erb'),
  owner   => 'oracle',
  group   => 'dba',
  mode    => '0664',
}->

# this is the Response File for Oracle Net Listener Installer

file { '/etc/netca.rsp':
  ensure  => file,
  content => template('oracledb/netca.rsp.erb'),
  owner   => 'oracle',
  group   => 'dba',
  mode    => '0664',
}->

# after the sources are on the destination machine one can proceed
# with setup -> using shell script so it doesn't require multiple execs

exec { 'installOracleDB':
  command => "${oracleBaseDir}/database/runInstaller -silent -printtime -noconfig -waitforcompletion -responseFile /etc/defra_response_file.rsp",
  creates => "${oracleHomeDir}/root.sh",
  timeout => '0',
  user    => 'oracle',
  group   => 'dba',
  require => Class['swap_file'],
}->

exec { 'run root.sh script':
  command   => "${oracleHomeDir}/root.sh",
  user      => 'root',
  group     => 'root',
  logoutput => true,
}->

# more post installation tasks have to follow ie. Oracle Net Listener set up

exec { 'installOracleNetListener':
  command      => "${oracleHomeDir}/bin/netca -silent -responsefile /etc/netca.rsp",
  environment  => ["ORACLE_HOME=${oracleHomeDir}"],
  creates      => "${oracleHomeDir}/network/admin/listener.ora",
  timeout      => '0',
  user         => 'oracle',
  group        => 'dba',
}

# after all update global PATH so that includes stuff from Oracle

file { '/etc/profile.d/oracle_profile.sh':
  ensure  => file,
  content => template('oracledb/bash_profile.erb'),
  mode    => '0755',
  owner   => 'root',
  group   => 'root',
}

file { '/home/oracle/flush_shared_pool.sh':
  ensure  => file,
  content => template('oracledb/flush_shared_pool.sh.erb'),
  owner   => 'oracle',
  group   => 'dba',
  mode    => '0664',
}

# this is to let know rsyslog what to do with logs tagged with ORACLE

file { '/etc/rsyslog.d/29-oracle-refresh.conf':
  ensure => present,
  notify => Service['rsyslog'],
  source => 'puppet:///modules/oracledb/29-oracle-refresh.conf',
}


include logrotate

logrotate::file { 'oracle':
  log         => '/var/log/capd/oracle-refresh.log',
  options     => [ 'missingok', 'compress', 'daily', 'rotate 14' ],
  postrotate  => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
}

}
