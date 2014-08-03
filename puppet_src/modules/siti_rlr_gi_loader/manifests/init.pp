# this class provides RLR GI Loader
# to load data onto SA DB
class siti_rlr_gi_loader{

  file { '/opt/capd-siti-rlr-gi-loader':
    ensure => directory,
  }

  package { 'capd-siti-rlr-gi-loader':
    ensure  => hiera('siti-rlr-gi-loader-version', 'latest'),
    require => Class['repo'],
  }

  file { '/opt/capd-siti-rlr-gi-loader/loader.properties':
    ensure  => file,
    content => template('siti_rlr_gi_loader/loader.properties.erb'),
    require => File['/opt/capd-siti-rlr-gi-loader'],
  }

}
