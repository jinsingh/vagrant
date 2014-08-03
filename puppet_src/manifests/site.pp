# Start defining node types below, start up 5/6 new machines.
Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    logoutput=>on_failure,
  }

node default {
  hiera_include('defra-capd-node-type')
  }
