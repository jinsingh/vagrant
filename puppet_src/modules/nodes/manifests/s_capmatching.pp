# == Class: nodes::s_capmatching
#
# Node module to cover the capdmatching server.  This server is
# there to host the CAPD Matching service adaptor which needs
# internet access but also needs access to the CAPD Matching service.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# class('nodes::s_capmatching')
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class nodes::s_capmatching inherits nodes::s_base {
  include capdmatchingadapter
  include java
}
