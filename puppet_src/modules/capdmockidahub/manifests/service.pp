# == Class: capdmockidahub::service
#
# Class to install the CAPD Mock IDA Hub
#
# This is a Play application similar to the CAPD Play Auth app and
# and as such is deployed in a similar way.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdmockidahub
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmockidahub::service{

service { 'capdmockidahub':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdmockidahub',
    start     => '/sbin/start capdmockidahub',
    stop      => '/sbin/stop capdmockidahub',
    status    => '/sbin/status capdmockidahub | grep "/running" 1>/dev/null 2>&1',
  }

}
