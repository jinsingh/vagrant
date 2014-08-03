# Node class for central log aggregator server
class nodes::s_logaggregator inherits nodes::s_base {

  if $::fqdn =~ /(\.test$)+/ {
    include atomic_repo
  }

  include nc
  include java
  include postfix
  include rsyslog::server
  include kibana
  include elasticsearch-curator
  include defra_collectd

  class { 'elasticsearch':
    package_url => 'puppet:///modules/elasticsearch/elasticsearch-0.90.10.noarch.rpm',
    datadir     => '/opt/elasticsearch',
  }
}