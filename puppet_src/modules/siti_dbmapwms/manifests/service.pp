# == Class: siti_dbmapwms::service
#
# This class is to create a service that makes
# sure the wms server is running
#
#
class siti_dbmapwms::service{

  $dbmapwms_port = hiera('capd-abacodbmap-port')

# startup X (gdm)
  exec { 'runlevel 5':
    command     => '/sbin/init 5',
    refreshonly => true,
  }

  service { 'dbmapwms':
    ensure => running,
    enable => true,
    status => "curl -s 127.0.0.1:${dbmapwms_port} >/dev/null",
  }

  service { 'xvfb':
    ensure  => running,
    enable  => true,
    pattern => 'Xvfb',
    before  => [
      Service['dbmapwms'],
    ],
  }

}
