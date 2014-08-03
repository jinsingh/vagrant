# Class: kibana::package
#
#
class kibana::package {

$kibana_ext_ip = hiera('logaggregator-ip-ext')


file { '/opt/kibana':
  ensure  => 'directory',
  source  => 'puppet:///modules/kibana/kibana',
  #purge   => true,
  recurse => true,
  }

->

file { '/opt/kibana/config.js':
  ensure  => 'present',
  content => template('kibana/config.js.erb'),
}

}