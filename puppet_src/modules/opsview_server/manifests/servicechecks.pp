# == Node: opsview::servicechecks
#
#  Puppet setup for the opsview monitoring tool checks through the rest API, this section is explicitly for containing the various service checks and host templates
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
# Jay Fitzsimmons, jayf@kainos.com
#
# === Copyright
#
# DEFRA
#
class opsview_server::servicechecks {

  $platform = hiera('capd-external-web-address')

  $caporacledb_ip_host = hiera('caporacledb-ip-host')
  $capweb_ip_host = hiera('capweb-ip-host')
  $management_ip_host = hiera('management-ip-host')
  $capapp_ip_host = hiera('capapp-ip-host')
  $logaggregator_ip_host = hiera('logaggregator-ip-host')
  $monitoring_ip_host = hiera('capmonitoring-ip-host')
  $graphing_ip_host = hiera('capgraphing-ip-host')
  $ha_master_ip_host = hiera('capd-ha-master-ip')
  $ha_slave_ip_host = hiera('capd-ha-slave-ip')
  $capd_ha_virtual_ipaddress = hiera('capd-ha-virtual-ipaddress')

  $caporacledb_hostname = hiera('caporacledb-hostname')
  $capweb_hostname = hiera('capweb-hostname')
  $capmanagement_hostname = hiera('capmanagement-hostname')
  $capapp_hostname = hiera('capapp-hostname')
  $logaggregator_hostname = hiera('logaggregator-hostname')
  $capmonitoring_hostname = hiera('capmonitoring-hostname')
  $capgraphing_hostname = hiera('capgraphing-hostname')
  $capd_ha_master_hostname = hiera('capd-ha-master-hostname')
  $capd_ha_slave_hostname = hiera('capd-ha-slave-hostname')
  $capdbmap_hostname = hiera('capdbmaplinux-hostname')

  $capd_matching_admin_adapter_port = hiera('capd-matching-admin-adapter-port')
  $capd_send_mail_admin_port = hiera('capd-send-mail-admin-port')
  $capd_auth_admin_port = hiera('capd-auth-admin-port')
  $capd_services_admin_port = hiera('capd-services-admin-port')
  $capd_matching_admin_port = hiera('capd-matching-admin-port')
  $capd_ssui_port = hiera('capd-ssui-port')
  $capd_play_auth_port = hiera('capd-play-auth-port')
  $capd_mock_ida_hub_port = hiera('capd-mock-ida-hub-port')

## Host Templates

  opsview_hosttemplate { 'CAPD - Services Server':
    description     => 'CAPD Services server',

    servicechecks   => ["CAPD - Services Health Check ${capd_services_admin_port}",
                        "CAPD - Matching Services Health Check ${capd_matching_admin_port}",
                        "CAPD - Sendmail Health Check ${capd_send_mail_admin_port}",
                        "CAPD - Auth Health Check ${capd_auth_admin_port}",
                        "CAPD - MSA Health Check ${capd_matching_admin_adapter_port}"
                        ],
    require         => Opsview_servicecheck["CAPD - Services Health Check ${capd_services_admin_port}",
                        "CAPD - Matching Services Health Check ${capd_matching_admin_port}",
                        "CAPD - Sendmail Health Check ${capd_send_mail_admin_port}",
                        "CAPD - Auth Health Check ${capd_auth_admin_port}",
                        "CAPD - MSA Health Check ${capd_matching_admin_adapter_port}"],
    reload_opsview  => 1,
  }

  opsview_hosttemplate { 'CAPD - Linux Server':
    description     => 'CAPD Linux server',
    servicechecks   => ['Disk Check Root'],
    require         => Opsview_servicecheck['Disk Check Root'],
  }

  opsview_hosttemplate { 'CAPD - Web Server':
    description     => 'CAPD Web server',
    servicechecks   => ['Process - Nginx',
                        'TCP - CAPDSSUI',
                        'TCP - Play Auth',
                        'TCP - Mock IDA Hub'
    ],
    require         => Opsview_servicecheck['Process - Nginx',
                        'TCP - CAPDSSUI',
                        'TCP - Play Auth',
                        'TCP - Mock IDA Hub'
    ],
    reload_opsview  => 1,
  }

  opsview_hosttemplate { 'CAPD - HAProxy Server':
    description     => 'CAPD HAProxy server',
    servicechecks   => ['Process - HAProxy',
                        'Process - Keepalived'
    ],
    require         => Opsview_servicecheck['Process - HAProxy'
    ],
    reload_opsview  => 1,
  }

  ## Service Groups

  opsview_servicegroup { 'CAPD Health Checks':
    reload_opsview         => 1,
  }

  opsview_servicegroup { 'Web Server Checks':
    reload_opsview         => 1,
  }

  opsview_servicegroup { 'HAProxy Server Checks':
    reload_opsview         => 1,
  }

## Service Checks

  opsview_servicecheck { "CAPD - Services Health Check ${capd_services_admin_port}":
    description            => 'Checks CAPD services admin port',
    servicegroup           => 'CAPD Health Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -p ${capd_services_admin_port} -u http://\$HOSTADDRESS\$:${capd_services_admin_port}/healthcheck",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    plugin                 => 'check_http',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['CAPD Health Checks'],
  }

  opsview_servicecheck { "CAPD - Matching Services Health Check ${capd_matching_admin_port}":
    description            => 'Checks CAPD matching services port',
    servicegroup           => 'CAPD Health Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -p ${capd_matching_admin_port} -u http://\$HOSTADDRESS\$:${capd_matching_admin_port}/healthcheck",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    plugin                 => 'check_http',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['CAPD Health Checks'],
  }

  opsview_servicecheck { "CAPD - Sendmail Health Check ${capd_send_mail_admin_port}":
    description            => 'Checks CAPD sendmail health check',
    servicegroup           => 'CAPD Health Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -p ${capd_send_mail_admin_port} -u http://\$HOSTADDRESS\$:${capd_send_mail_admin_port}/healthcheck",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    plugin                 => 'check_http',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['CAPD Health Checks'],
  }

  opsview_servicecheck { "CAPD - Auth Health Check ${capd_auth_admin_port}":
    description            => 'Checks CAPD auth admin port',
    servicegroup           => 'CAPD Health Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -p ${capd_auth_admin_port} -u http://\$HOSTADDRESS\$:${capd_auth_admin_port}/healthcheck",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    plugin                 => 'check_http',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['CAPD Health Checks'],
  }

  opsview_servicecheck { "CAPD - MSA Health Check ${capd_matching_admin_adapter_port}":
    description            => 'Checks CAPD matching service adapter port',
    servicegroup           => 'CAPD Health Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -p ${capd_matching_admin_adapter_port} -u http://\$HOSTADDRESS\$:${capd_matching_admin_adapter_port}/healthcheck",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    plugin                 => 'check_http',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['CAPD Health Checks'],
  }

  opsview_servicecheck { 'Disk Check Root':
    description            => 'Checks Root / disk',
    servicegroup           => 'OS - Base Unix Agent',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '30',
    args                   => '-H $HOSTADDRESS$ -c check_disk -a \'-w 10% -c 5% -p /\'',
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
  }

  opsview_servicecheck { 'Process - Nginx':
    description            => 'Checks Nginx master process exists',
    servicegroup           => 'Web Server Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => '-H $HOSTADDRESS$ -c check_procs -a \'-w 1:30 -C nginx\'',
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['Web Server Checks'],
  }

  opsview_servicecheck { 'TCP - CAPDSSUI':
    description            => "Checks CAPD Self Service UI responds on port ${capd_ssui_port}",
    servicegroup           => 'Web Server Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -c check_tcp -a \'-p ${capd_ssui_port}\'",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
    plugin                 => 'check_nrpe',
    require                => Opsview_servicegroup['Web Server Checks'],
  }


  opsview_servicecheck { 'TCP - Play Auth':
    description            => "Checks CAPD Play Auth responds on port ${capd_play_auth_port}",
    servicegroup           => 'Web Server Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -c check_tcp -a \'-p ${capd_ssui_port}\'",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
    plugin                 => 'check_nrpe',
    require                => Opsview_servicegroup['Web Server Checks'],
  }

  opsview_servicecheck { 'TCP - Mock IDA Hub':
    description            => "Checks CAPD Mock IDA Hub responds on port ${capd_mock_ida_hub_port}",
    servicegroup           => 'Web Server Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => "-H \$HOSTADDRESS\$ -c check_tcp -a \'-p ${capd_mock_ida_hub_port}\'",
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
    plugin                 => 'check_nrpe',
    require                => Opsview_servicegroup['Web Server Checks'],
  }

  opsview_servicecheck { 'Process - HAProxy':
    description            => 'Checks HA Proxy process exists',
    servicegroup           => 'HAProxy Server Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => '-H $HOSTADDRESS$ -c check_processes -a \'haproxy "HAProxy" "/etc/init.d/haproxy start" \'',
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['HAProxy Server Checks'],
  }

  opsview_servicecheck { 'Process - Keepalived':
    description            => 'Checks Keepalived process exists',
    servicegroup           => 'HAProxy Server Checks',
    notification_options   => 'w,c,r',
    check_period           => '24x7',
    check_interval         => '5',
    args                   => '-H $HOSTADDRESS$ -c check_processes -a \'keepalived "Keepalived" "/etc/init.d/keepalived start" \'',
    check_attempts         => '3',
    flap_detection_enabled => '1',
    retry_check_interval   => '1',
    reload_opsview         => 1,
    require                => Opsview_servicegroup['HAProxy Server Checks'],
  }

}
