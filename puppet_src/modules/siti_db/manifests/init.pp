# == Class: siti_db
#
# Class to install the Siti Agri database structure loader.
#
# This structure loader is a jar file that we execute that uses
# a number of SQL scripts to load the database schema and example
# data into the Oracle database specified in the params.xml file.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include siti_db
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class siti_db {

  include siti_db::package, siti_db::config, siti_db::deploy

  Class['siti_db::package'] -> Class['siti_db::config'] -> Class['siti_db::deploy']

}
