# == Class: siti_dbmapwms::package
#
# Class to install any packages required by the Siti Agri DB Map WMS
# service..
#

class siti_dbmapwms::package {

  $siti_dbmap_wms_version = hiera('siti-dbmapwms-version')

# dependencies

  package { 'qt':
    ensure => hiera('qt-version', 'installed'),
  }

  package { 'qt-x11':
    ensure => hiera('qt-x11-version', 'installed'),
  }

  package { 'gdm':
    ensure => hiera('gdm-version', 'installed'),
  }

  package { 'xorg-x11-server-Xvfb':
    ensure => hiera('xorg-x11-server-Xvfb-version', 'installed'),
  }

# the actual package

  package { 'capd-siti-dbmapwms':
    ensure  => hiera('siti-dbmapwms-version', 'latest'),
    require => Class['repo'],
  }


}

