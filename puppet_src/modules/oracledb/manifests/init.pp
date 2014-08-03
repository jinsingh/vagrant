# class to install/configure Oracle DB
class oracledb{

  require sqlplus_client
  include oracledb::package, oracledb::listener, oracledb::autostart, oracledb::database, oracledb::config

  Class['oracledb::package'] -> Class['oracledb::autostart'] -> Class['oracledb::listener'] -> Class['oracledb::database'] -> Class['oracledb::config']

}
