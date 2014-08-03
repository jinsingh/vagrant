# == Class: siti_dbmapwms
#
# This is to install linux dbmap wms server
#
# === Examples
#
# include siti_dbmapwms

class siti_dbmapwms {

  $package_location = '/opt/siti-dbmapwms'

  include siti_dbmapwms::package, siti_dbmapwms::config, siti_dbmapwms::service

  Class['siti_dbmapwms::package'] -> Class['siti_dbmapwms::config'] ~> Class['siti_dbmapwms::service']

}
