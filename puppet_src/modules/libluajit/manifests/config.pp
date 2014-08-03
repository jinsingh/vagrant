# Class defines libliajit.conf file in /etc/ld.so.conf
# This is required to add the libluajit library to the
# library path

class libluajit::config {

  case $::osfamily {
    'RedHat': {
      file {'/etc/ld.so.conf.d/libluajit.conf':
        ensure => present,
        source => 'puppet:///modules/libluajit/libluajit.conf',
      }
    }
    default: {}
  }
  
}
