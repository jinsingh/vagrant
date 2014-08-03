# == Class: nodes::s_capservicesauth
#
# Node module to cover the capdauth server.
#
# This server is here to host the internal authentication
# services.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# class('nodes::s_capservicesauth')
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class nodes::s_capservicesauth inherits nodes::s_base {
  include capdauth
  include java
}
