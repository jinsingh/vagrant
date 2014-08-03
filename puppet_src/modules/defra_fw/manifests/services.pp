# Set of FW rules for SERVICES server
#
class defra_fw::services{

  $defra_fw_capweb_ip = hiera('capweb-ip-host')
  $cap_ha_master_ip = hiera('capd-ha-master-ip')
  $cap_ha_slave_ip = hiera('capd-ha-slave-ip')
  $cap_monitoring_ip = hiera('capmonitoring-ip-host')

  $capd_matching_admin_adapter_port = hiera('capd-matching-admin-adapter-port')
  $capd_send_mail_admin_port = hiera('capd-send-mail-admin-port')
  $capd_auth_admin_port = hiera('capd-auth-admin-port')
  $capd_services_admin_port = hiera('capd-services-admin-port')
  $capd_matching_admin_port = hiera('capd-matching-admin-port')
  $capd_user_auth_port = hiera('capd-user-auth-port')
  $capd_send_mail_port = hiera('capd-send-mail-port')

  $ci_server_ip = '192.168.100.8'

  firewall{"230 allow ha-master in on ${capd_send_mail_port}":
    source => $cap_ha_master_ip,
    port   => $capd_send_mail_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"231 allow ha-slave in on ${capd_send_mail_port}":
    source => $cap_ha_master_ip,
    port   => $capd_send_mail_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'150 allow WEB in on 4685':
    source => $defra_fw_capweb_ip,
    port   => '4685',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'151 allow WEB in on 5000':
    source => $defra_fw_capweb_ip,
    port   => '5000',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'209 allow WEB in on 8700':
    source => $defra_fw_capweb_ip,
    port   => '8700',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'212 allow ha-master in on 8080':
    source => $cap_ha_master_ip,
    port   => '8080',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'213 allow ha-master in on 4685':
    source => $cap_ha_master_ip,
    port   => '4685',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'214 allow ha-master in on 5000':
    source => $cap_ha_master_ip,
    port   => '5000',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'215 allow ha-master in on 8700':
    source => $cap_ha_master_ip,
    port   => '8700',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'220 allow ha-master in on 8750':
    source => $cap_ha_master_ip,
    port   => '8750',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"221 allow ha-master in on ${capd_user_auth_port}":
    source => $cap_ha_master_ip,
    port   => $capd_user_auth_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'212 allow ha-slave in on 8080':
    source => $cap_ha_slave_ip,
    port   => '8080',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'216 allow ha-slave in on 4685':
    source => $cap_ha_slave_ip,
    port   => '4685',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'217 allow ha-slave in on 5000':
    source => $cap_ha_slave_ip,
    port   => '5000',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'218 allow ha-slave in on 8700':
    source => $cap_ha_slave_ip,
    port   => '8700',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'221 allow ha-slave in on 8750':
    source => $cap_ha_slave_ip,
    port   => '8750',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"221 allow ha-slave in on ${capd_user_auth_port}":
    source => $cap_ha_slave_ip,
    port   => $capd_user_auth_port,
    proto  => 'tcp',
    action => 'accept',
  }

  # this one is to enable TC to clear the memcached cache before running performance tests

  firewall{'210 allow memcached in on 11211':
    source => $ci_server_ip,
    port   => '11211',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'222 allow monitoring in on 5001':
    source => $cap_monitoring_ip,
    port   => $capd_auth_admin_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"223 allow monitoring in on ${capd_matching_admin_port}":
    source => $cap_monitoring_ip,
    port   => $capd_matching_admin_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"224 allow monitoring in on ${capd_send_mail_admin_port}":
    source => $cap_monitoring_ip,
    port   => $capd_send_mail_admin_port,
    proto  => 'tcp',
    action => 'accept',
  }
  firewall{"225 allow monitoring in on ${capd_services_admin_port}":
    source => $cap_monitoring_ip,
    port   => $capd_services_admin_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"226 allow monitoring in on ${capd_matching_admin_adapter_port}":
    source => $cap_monitoring_ip,
    port   => $capd_matching_admin_adapter_port,
    proto  => 'tcp',
    action => 'accept',
  }

  if $::fqdn == 'capservices.rpa.integration' {
    firewall{'224 allow Quotium Seeker agent on 8085':
      source => '10.181.103.77',
      port   => '8085',
      proto  => 'tcp',
      action => 'accept',
    }
  }


}
