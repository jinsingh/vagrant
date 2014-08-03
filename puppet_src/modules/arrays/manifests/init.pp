# Variables for various arrays
#

class arrays {}

# arrays for clusters or groups of servers

class arrays::servers {

  $capd_external_web_address = hiera('capd-external-web-address')

    if $capd_external_web_address == 'capd-performance.kainos.com' {

    $capservices_servers = [hiera('capservices-ip-host'), hiera('capservices02-ip-host')]
    $caphippo_cms_servers = [hiera('caphippo-cms1-ip-host')]
    }
  else {
    $capservices_servers = [hiera('capservices-ip-host')]
    $caphippo_cms_servers = [hiera('caphippo-cms1-ip-host')]
    }

}
