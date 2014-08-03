# == Class: nodes::s_capwebauth
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
# class('nodes::s_capwebauth')
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class nodes::s_capwebauth inherits nodes::s_base {
  include capdplayauth
}
