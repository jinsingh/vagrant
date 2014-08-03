# == Class: defra_collectd
#
# Base CollectD definition for DEFRA servers
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include createrepo_c
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# DEFRA
#
class defra_collectd {

  $graphite_hostname = hiera('capgraphing-hostname')
  $external_web_address = hiera('capd-external-web-address')

  if $external_web_address =~ /kainos/ {
    class { 'collectd':
      version => '5.1.0-1.el6.rft',
      require => Class['repo'],
    }

    class { 'collectd::plugin::write_graphite':
      graphitehost => $graphite_hostname,
      storerates   => true,
    }

    class { 'collectd::plugin::disk':
      disks => ['xvda1'],
    }
  }

}