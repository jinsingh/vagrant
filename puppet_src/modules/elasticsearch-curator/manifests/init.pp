# == Class: elasticsearch-curator
#
# This module installs python script
# called curator that trims elasticsearch
# database used by Kibana from old logs
#
# === Variables
#
# Uses elasticsearch node address from hiera (logaggregator-ip)
# days_history - time in days that data will be kept
#
# === Examples
#
# include elasticsearch-curator
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class elasticsearch-curator(
  $days_history         = 2,
  $elastisearch_address = hiera('logaggregator-ip-host'),
){

include pip

  package { 'urllib3':
    ensure   => hiera('urllib3-version', 'latest'),
    provider => pip,
    require  => Package['python-pip'],
  }

  file { '/opt/elasticsearch-curator':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    purge  => true,
  }

  file { 'es':
    path    => '/usr/lib/python2.6/site-packages/elasticsearch/',
    ensure  => 'directory',
    recurse => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/elasticsearch-curator/elasticsearch',
    require => Package['python-pip'],
  }

  file { 'es-dist-info':
    path    => '/usr/lib/python2.6/site-packages/elasticsearch-1.0.0.dist-info',
    ensure  => 'directory',
    recurse => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/elasticsearch-curator/elasticsearch-1.0.0.dist-info',
    require => Package['python-pip'],
  }

  file { '/opt/elasticsearch-curator/curator.py':
    ensure  => present,
    source  => 'puppet:///modules/elasticsearch-curator/curator.py',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => [File['/opt/elasticsearch-curator'],File['es'],File['es-dist-info'],Package['python-pip']],
  }

  cron { 'elasticsearch-curator':
    command => "/usr/bin/python /opt/elasticsearch-curator/curator.py --host ${elastisearch_address} -d ${days_history} -D",
    user    => root,
    hour    => 7,
    minute  => 30,
    require => File['/opt/elasticsearch-curator/curator.py'],
  }
}