# == Define: kibana::dashboard
#
# Install a custom kibana dashboard
#
# === Parameters
# [*source*]
#   String.  Location to install the dashboard from
#
define kibana::dashboard (
  $source,
) {

  validate_re($name, '\.json$', 'Dashboard name needs to end in .json')

  file { "/var/www/html/kibana/app/dashboards/${name}":
    ensure  => file,
    mode    => '0444',
    source  => $source,
  }
}
