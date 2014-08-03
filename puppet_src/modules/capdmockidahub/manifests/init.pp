# == Class: capdmockidahub
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


class capdmockidahub{

include capdmockidahub::package, capdmockidahub::config, capdmockidahub::service

  Class['capdmockidahub::package'] -> Class['capdmockidahub::config'] ~> Class['capdmockidahub::service']

}
