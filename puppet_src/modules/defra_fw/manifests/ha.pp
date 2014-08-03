# Set of FW rules for High Avaliabitly servers
#
class defra_fw::ha{

  $virtual_ip = hiera('capd-ha-lan')

  $capd_user_auth_port = hiera('capd-user-auth-port')
  $capd_send_mail_port = hiera('capd-send-mail-port')
  $capd_hippo_proxy_port = hiera('capd-hippo-cms-via-haproxy-port')
  $capd_send_mail_admin_port = hiera('capd-send-mail-admin-port')
  $capd_services_port = hiera('capd-services-port')
  $capd_services_admin_port = hiera('capd-services-admin-port')

  firewall{"240 allow ha-network in on ${capd_send_mail_admin_port}":
    source => $virtual_ip,
    port   => $capd_send_mail_admin_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"230 allow ha-network in on ${capd_send_mail_port}":
    source => $virtual_ip,
    port   => $capd_send_mail_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'211 allow ha-network in on 8080':
    source => $virtual_ip,
    port   => '8080',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"212 allow ha-network in on ${capd_services_port}":
    source => $virtual_ip,
    port   => $capd_services_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"241 allow ha-network in on ${capd_services_admin_port}":
    source => $virtual_ip,
    port   => $capd_services_admin_port,
    proto  => 'tcp',
    action => 'accept',
  }


  firewall{'213 allow ha-network in on 5000':
    source => $virtual_ip,
    port   => '5000',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'214 allow ha-network in on 8700':
    source => $virtual_ip,
    port   => '8700',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{'225 allow ha-network in on 8750':
    source => $virtual_ip,
    port   => '8750',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"226 allow ha-network in on ${capd_user_auth_port}":
    source => $virtual_ip,
    port   => $capd_user_auth_port,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall{"227 allow ha-network in on ${capd_hippo_proxy_port}":
    source => $virtual_ip,
    port   => $capd_hippo_proxy_port,
    proto  => 'tcp',
    action => 'accept',
  }


  firewall{'220 allow multicast as required by VRRP':
    destination => '224.0.0.0/8',
    action      => 'accept',
    proto       => 'all',
  }

  firewall{'215 allow nginx in on 80':
    port   => '80',
    proto  => 'tcp',
    action => 'accept',
  }

}
