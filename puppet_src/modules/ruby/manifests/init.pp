# == Node: ruby
#
#  Puppet setup for the opsview monitoring tool
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
#  na
#
# === Authors
#
# Peter Souter, peterso@kainos.com
#
# === Copyright
#
# DEFRA
#
class ruby {

  class { 'rbenv': }
  rbenv::plugin { [ 'sstephenson/ruby-build' ]: }
  rbenv::build { '2.0.0-p353': global => true, }
  rbenv::gem { 'hiera-eyaml': ruby_version   => '2.0.0-p353' }

}
