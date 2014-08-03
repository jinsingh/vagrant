# == Node: nodes::s_monitoring
#
#  Node setup for the monitoring server
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
class nodes::s_monitoring inherits nodes::s_base {
  include opsview_server
  include postfix
}
