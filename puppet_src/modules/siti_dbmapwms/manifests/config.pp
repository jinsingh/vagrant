# == Class: siti_dbmapwms::config
#
# This class will deploy the configuration required for the Siti
# Agri wms server.
#

class siti_dbmapwms::config {

  #Config for the DBMAP WMS service.
  $package_location = $siti_dbmapwms::package_location
  $external_web_address = hiera('capd-external-web-address')

  # Vagrant needs Xorg to run Virtualbox stuff
  # So it'll have a session running with ID 1
  $display_number = hiera('xargs-display-number', '0')

  file { "${package_location}/conf/projects.ini":
    ensure  => present,
    content => template('siti_dbmapwms/projects.ini.erb'),
  }
  file { "${package_location}/conf/server.ini":
    ensure  => present,
    content => template('siti_dbmapwms/server.ini.erb'),
  }
  file { "${package_location}/conf/stores.ini":
    ensure  => present,
    content => template('siti_dbmapwms/stores.ini.erb'),
  }

  file {'/etc/init.d/dbmapwms':
    ensure  => present,
    content => template('siti_dbmapwms/dbmapwms-job.erb'),
    mode    => '0755'
  }

  file {"${package_location}/logs":
    ensure => directory,
    mode   => '0755',
  }

  file {"${package_location}/work":
    ensure => directory,
    mode   => '0755',
  }


  file { '/etc/profile.d/display':
    ensure  => file,
    content => "export DISPLAY=:${display_number}"
  }

  # make sure system boots to run level 5

  file { '/etc/inittab':
    ensure  => present,
    content => 'id:5:initdefault:',
  }

  file { '/opt/siti-dbmapwms/start.sh' :
    ensure  => present,
    mode    => '0755',
    content => template('siti_dbmapwms/start.sh.erb'),
  }

  file { '/etc/init.d/xvfb' :
    ensure  => present,
    mode    => '0755',
    content => template('siti_dbmapwms/etc/init.d/xvfb.erb'),
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    rsyslog::imfile { '34-siti_dbmapwms-out.conf':
      file_name     => "${package_location}/logs/out.log",
      file_tag      => 'DBMAP_OUT',
      file_facility => 'daemon',
      file_severity => 'info',
    }

    rsyslog::imfile { '35-siti_dbmapwms-err.conf':
      file_name     => "${package_location}/logs/err.log",
      file_tag      => 'DBMAP_ERR',
      file_facility => 'daemon',
      file_severity => 'info',
    }

    file { '/etc/rsyslog.d/out.conf' :
      ensure  => absent,
    }

    file { '/etc/rsyslog.d/err.conf' :
      ensure  => absent,
    }

    logrotate::file { 'dbmapwms':
      log        => "${package_location}/logs/*.log",
      options    => [ 'notifempty', 'daily', 'rotate 14', 'sharedscripts' ],
      postrotate => '/sbin/service dbmapwms restart || true',
    }
  }
}
