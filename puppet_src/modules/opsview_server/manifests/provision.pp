# == Node: opsview::provision
#
#  Puppet setup for the opsview monitoring tool checks through the rest API, this section is for hosts and groups, templates and service checks are defined in servicechecks.pp
#
# === Parameters
#

  define opsview_server::monitor_capservices_servers () {
    opsview_monitored { "${opsview_server::provision::capservices_hostname}-${title}":
    ip                     => $title,
    hostgroup              => $opsview_server::provision::platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'CAPD - Services Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [ Opsview_hostgroup[$opsview_server::provision::platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                                Opsview_hosttemplate['CAPD - Services Server']
                              ]
    }
  }

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
class opsview_server::provision {

# we have to include the arrays module to pull in the definitions of server groups
  include arrays::servers
  include opsview_server::servicechecks

  $platform = hiera('capd-external-web-address')

  $caporacledb_ip_host = hiera('caporacledb-ip-host')
  $capweb_ip_host = hiera('capweb-ip-host')
  $management_ip_host = hiera('management-ip-host')
  $capapp_ip_host = hiera('capapp-ip-host')
  $capdbmap_wms_ip_host = hiera('capdbmapwms-ip-host')
  $logaggregator_ip_host = hiera('logaggregator-ip-host')
  $monitoring_ip_host = hiera('capmonitoring-ip-host')
  $graphing_ip_host = hiera('capgraphing-ip-host')
  $ha_master_ip_host = hiera('capd-ha-master-ip')
  $ha_slave_ip_host = hiera('capd-ha-slave-ip')
  $dbmap_ip_host = hiera('capdbmaplinux-ip-host')
  $capd_ha_virtual_ipaddress = hiera('capd-ha-virtual-ipaddress')

  $capservices_hostname = hiera('capservices-hostname')
  $caporacledb_hostname = hiera('caporacledb-hostname')
  $capweb_hostname = hiera('capweb-hostname')
  $capmanagement_hostname = hiera('capmanagement-hostname')
  $capapp_hostname = hiera('capapp-hostname')
  $logaggregator_hostname = hiera('logaggregator-hostname')
  $capmonitoring_hostname = hiera('capmonitoring-hostname')
  $capgraphing_hostname = hiera('capgraphing-hostname')
  $capd_ha_master_hostname = hiera('capd-ha-master-hostname')
  $capd_ha_slave_hostname = hiera('capd-ha-slave-hostname')
  $capdbmap_hostname = hiera('capdbmap-hostname')

  $capd_matching_admin_adapter_port = hiera('capd-matching-admin-adapter-port')
  $capd_send_mail_admin_port = hiera('capd-send-mail-admin-port')
  $capd_auth_admin_port = hiera('capd-auth-admin-port')
  $capd_services_admin_port = hiera('capd-services-admin-port')
  $capd_matching_admin_port = hiera('capd-matching-admin-port')
  $capd_ssui_port = hiera('capd-ssui-port')
  $capd_play_auth_port = hiera('capd-play-auth-port')
  $capd_mock_ida_hub_port = hiera('capd-mock-ida-hub-port')

  file {'/usr/local/nagios/bin/opsview_master_housekeep':
    source  => 'puppet:///modules/opsview_server/opsview_master_housekeep',
    owner   => 'nagios',
    group   => 'nagios',
    mode    => '0750',
  }

  cron { 'Opsview Housekeeping Cronjob' :
    ensure   => present,
    user     => 'root',
    monthday => 1,
    command  => '/usr/local/nagios/bin/opsview_master_housekeep',
    require  => File['/usr/local/nagios/bin/opsview_master_housekeep'],
  }

## Host Groups

  opsview_hostgroup { $platform:
    reload_opsview  => 1,
  }

## Hosts

# iterates over capservices_servers array to add monitoring as per definition above

  monitor_capservices_servers {$arrays::servers::capservices_servers: }

  opsview_monitored { $capmanagement_hostname:
    ip                     => $management_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { $caporacledb_hostname:
    ip                     => $caporacledb_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { $capweb_hostname:
    ip                     => $capweb_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'CAPD - Web Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { $capapp_hostname:
    ip                     => $capapp_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { $capd_ha_master_hostname:
    ip                     => $ha_master_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'CAPD - HAProxy Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { $capd_ha_slave_hostname:
    ip                     => $ha_slave_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'OS - Unix Advanced',
                                'CAPD - HAProxy Server',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { $capdbmap_hostname:
    ip                     => $dbmap_ip_host,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => [ 'CAPD - Linux Server',
                                'OS - Unix Advanced',
                                'OS - Unix Base',
                                'Network - Base'],
    require                => [
                                Opsview_hostgroup[$platform],
                                Opsview_hosttemplate['CAPD - Linux Server'],
                              ]
  }

  opsview_monitored { 'HAProxy_Virtual_IP':
    ip                     => $capd_ha_virtual_ipaddress,
    hostgroup              => $platform,
    enable_snmp            => 0,
    notification_interval  => 90,
    snmp_community         => 'PUBLIC',
    reload_opsview         => 1,
    hosttemplates          => ['Network - Base'],
    require                => [ Opsview_hostgroup[$platform]],
    parents                => [ $capd_ha_master_hostname, $capd_ha_slave_hostname],
  }

## Contacts

  opsview_contact { 'ops_alerts':
    variables            => { 'EMAIL' => 'capdalerts@kainos.com'},
    role                 => 'Administrator',
    allhostgroups24x7    => true,
    allservicegroups24x7 => true,
    reload_opsview       => 1,
  }

}
