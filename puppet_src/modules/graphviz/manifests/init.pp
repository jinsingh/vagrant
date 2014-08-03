# == Class: graphviz
#
# A simple class to install graphviz
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
#  include graphviz
#
# === Authors
#
# Peter Souter, peterso@kainos.com
#
# === Copyright
#
# DEFRA
#
class graphviz {

  package { 'graphviz':
    ensure  => present,
  }

}
