# Module uses hiera lookups to set host entries for all servers in environmewnt

class hosts {

# create fully qualified host entries with aliases

$capservices_ip_host      = hiera('capservices-ip-host')
$caporacledb_ip_host      = hiera('caporacledb-ip-host')
$capweb_ip_host           = hiera('capweb-ip-host')
$management_ip_host       = hiera('management-ip-host')
$capapp_ip_host           = hiera('capapp-ip-host')
$logaggregator_ip_host    = hiera('logaggregator-ip-host')
$monitoring_ip_host       = hiera('capmonitoring-ip-host')
$graphing_ip_host         = hiera('capgraphing-ip-host')
$ha_master_ip_host        = hiera('capd-ha-master-ip')
$ha_slave_ip_host         = hiera('capd-ha-slave-ip')
$capdbmap_linux_ip_host   = hiera('capdbmaplinux-ip-host')

$capservices_hostname     = hiera('capservices-hostname')
$caporacledb_hostname     = hiera('caporacledb-hostname')
$capweb_hostname          = hiera('capweb-hostname')
$capmanagement_hostname   = hiera('capmanagement-hostname')
$capapp_hostname          = hiera('capapp-hostname')
$logaggregator_hostname   = hiera('logaggregator-hostname')
$capmonitoring_hostname   = hiera('capmonitoring-hostname')
$capgraphing_hostname     = hiera('capgraphing-hostname')
$capd_ha_master_hostname  = hiera('capd-ha-master-hostname')
$capd_ha_slave_hostname   = hiera('capd-ha-slave-hostname')
$capdbmap_linux_hostname  = hiera('capdbmaplinux-hostname')


  host { $capservices_hostname:
    ip           => $capservices_ip_host,
    host_aliases => 'capservices',
  }

  host { $caporacledb_hostname:
    ip           => $caporacledb_ip_host,
    host_aliases => 'caporacledb',
  }

  host { $capweb_hostname:
    ip           => $capweb_ip_host,
    host_aliases => 'capweb',
  }

  host { $capmanagement_hostname:
    ip           => $management_ip_host,
    host_aliases => 'capmanagement',
  }

  host { $capapp_hostname:
    ip           => $capapp_ip_host,
    host_aliases => 'capapp',
  }


  host { $logaggregator_hostname:
    ip           => $logaggregator_ip_host,
    host_aliases => 'logaggregator',
  }

  host { $capmonitoring_hostname:
    ip           => $monitoring_ip_host,
    host_aliases => 'capmonitoring',
  }

  host { $capgraphing_hostname:
    ip           => $graphing_ip_host,
    host_aliases => 'capgraphing',
  }

  host { $capd_ha_master_hostname:
    ip           => $ha_master_ip_host,
    host_aliases => 'cap-ha-master',
  }

  host { $capd_ha_slave_hostname:
    ip           => $ha_slave_ip_host,
    host_aliases => 'cap-ha-slave',
  }

  host { $capdbmap_linux_hostname:
    ip           => $capdbmap_linux_ip_host,
    host_aliases => 'capdbmaplinux',
  }

}
