#config for siti-simulator

class siti_simulator::config{

file { '/opt/siti-simulator':
  ensure => directory,
  mode   => '0770',
  owner  => 'root',
  group  => 'deploy',
}

file { '/opt/siti-simulator/conf.js':
    ensure   => present,
    content  => template('siti_simulator/conf.js.erb'),
  }

file { '/opt/siti-simulator/app_install.sh':
    ensure   => present,
    source   => 'puppet:///modules/siti_simulator/app_install.sh',
    mode     => '0755',
  }

file { '/etc/init/siti-simulator.conf':
    ensure   => present,
    source   => 'puppet:///modules/siti_simulator/simulator-job.conf',
  }


exec { 'download dependecies':
    command => '/bin/sh app_install.sh',
    cwd     => '/opt/siti-simulator',
    #unless  => '/bin/ls /opt/siti-simulator/installed'
  } ->

exec { 'set flag':
  command => '/bin/touch /opt/siti-simulator/installed',
  creates => '/opt/siti-simulator/installed',
}

}