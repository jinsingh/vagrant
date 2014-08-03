#package definition for siti_simulator

class siti_simulator::package{

  $dependecies=[ 'nodejs', 'npm', 'libcurl', 'libcurl-devel' ]

  package { $dependecies:
    ensure => installed,
  }->

  #forever is a tool to daemonize node application
  #so you can use #forever list
  #               #forever start appname.js
  #               #forever stopall

  exec { 'npm install forever':
    command => '/usr/bin/npm install forever -g --prefix /usr/local/node_modules/forever',
    unless  => '/usr/bin/which forever',
  }->

  file { '/usr/bin/forever':
    ensure => 'link',
    target => '/usr/local/node_modules/forever/bin/forever'
  }->

  package { 'siti-simulator':
    ensure  => latest,
    require => Class['Repo'],
  }


}