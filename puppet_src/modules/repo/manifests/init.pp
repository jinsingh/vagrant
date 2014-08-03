
# Definition for creating mirror repository
define repo::create_mirror_repo () {
        yumrepo { "capd-${title}":
          baseurl  => "http://${repo::yum_server}/mirror/${title}",
          enabled  => '1',
          gpgcheck => '0',
          descr    => "CAPD Mirror of the ${title} repo"
    }
  }

# Definition for disabling intenet repository
define repo::disable_repo () {
        yumrepo { $title:
          enabled => '0',
    }
  }


# Module defines yum repo located on management server for all hosts

class repo {

  case $::osfamily {
    'RedHat': {

      $node_type = hiera('defra-capd-node-type')

      case $node_type {
        nodes::s_capweb: { $yum_server = hiera('jumpbox-ip-host') }
        nodes::s_capmatching: { $yum_server = hiera('jumpbox-ip-host') }
        nodes::s_cap_ha_master: { $yum_server = hiera('jumpbox-ip-host') }
        nodes::s_cap_ha_slave: { $yum_server = hiera('jumpbox-ip-host') }
        # created the below role in anticipation of splitting out the auth service
        nodes::s_authservice: { $yum_server = hiera('jumpbox-ip-host') }
        /nodes::s_capwebauthnodes::s_capservicesauth/: { $yum_server = hiera('jumpbox-ip-host') }
        default:           { $yum_server = hiera('yum-ip-host') }
        }

      yumrepo { 'Capd':
        baseurl        => "http://${yum_server}/yum/${::architecture}",
        enabled        => '1',
        gpgcheck       => '1',
        gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD',
        descr          => "CAPD Packages - ${::architecture} "
      }

      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/repo/RPM-GPG-KEY-CAPD',
      }

      repo::rpm_gpg_key{ 'CAPD-REPO':
        path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD'
      }

      unless $::fqdn =~ /(\.test$)+/ {


        #Disable internet repos

  $repo_to_disable = [
    'atomic',
    'epel',
    'puppetlabs-products',
    'puppetlabs-deps',
    'atomic-testing',
    'rsyslog_v7',
    'opsview'
    ]

  disable_repo {$repo::repo_to_disable: }


        #external sources

  $mirror_repo_to_create = [
    'atomic',
    'epel',
    'puppetlabs-products',
    'puppetlabs-deps',
    'rpmforge',
    'rpmforge-extras',
    'rsyslog_v7',
    'opsview'
    ]

  create_mirror_repo {$repo::mirror_repo_to_create: }


      }
    }
  default: {}
  }

}
