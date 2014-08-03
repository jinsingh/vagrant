# class that places CLL loader on dbmapwms linux box
#
class siti_dataloader{

  package { 'capd-siti-linux-dataloader':
    ensure  => hiera('siti-linux-dataloader-version', 'latest'),
    require => Class['repo'],
  }

  file { '/etc/ld.so.conf.d/sqlplus_linux.conf':
    ensure => present,
    source => 'puppet:///modules/siti_dataloader/sqlplus.conf',
    notify => Exec['sqlplus_ldconfig'],
  }

  exec {'sqlldr_ldconfig_linux':
    command     => 'ldconfig',
    refreshonly => true,
  }

  file {'/opt/capd-siti-linux-dataloader/load-England_simple.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-England_simple.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-lfa.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-lfa.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-grid.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-grid.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-grid-all.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-grid-all.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-pbl.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-pbl.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-pif.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-pif.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-England_detailed.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-England_detailed.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/impo_eng_entitlements.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/impo_eng_entitlements.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/impo_eng_land_cover_types.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/impo_eng_land_cover_types.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/impo_eng_land_links.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/impo_eng_land_links.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/impo_eng_organizations.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/impo_eng_people.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/impo_eng_people.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/impo_eng_people.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/impo_eng_roles.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/impo_eng_roles.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  file {'/opt/capd-siti-linux-dataloader/load-England_messages.sh':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    content => template('siti_dataloader/load-England_messages.sh.erb'),
    require => Package ['capd-siti-linux-dataloader'],
  }

  #Dataloader config

  file {'/opt/capd-siti-linux-dataloader/load-rlr-cll.cfg':
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    source  => 'puppet:///modules/siti_dataloader/load-rlr-cll.cfg',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/impo_eng_entitlements.cfg':
    content => template('siti_dataloader/impo_eng_entitlements.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/impo_eng_land_cover_types.cfg':
    content => template('siti_dataloader/impo_eng_land_cover_types.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/impo_eng_land_links.cfg':
    content => template('siti_dataloader/impo_eng_land_links.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/impo_eng_organizations.cfg':
    content => template('siti_dataloader/impo_eng_organizations.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/impo_eng_people.cfg':
    content => template('siti_dataloader/impo_eng_people.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/impo_eng_roles.cfg':
    content => template('siti_dataloader/impo_eng_roles.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-lfa.cfg':
    content => template('siti_dataloader/load-lfa.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-grid.cfg':
    content => template('siti_dataloader/load-grid.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-pbl.cfg':
    content => template('siti_dataloader/load-pbl.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-pif.cfg':
    content => template('siti_dataloader/load-pif.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-England_simple.cfg':
    content => template('siti_dataloader/load-England_simple.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-England_detailed.cfg':
    content => template('siti_dataloader/load-England_detailed.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/opt/capd-siti-linux-dataloader/load-England_messages.cfg':
    content => template('siti_dataloader/load-England_messages.cfg'),
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    require => Package ['capd-siti-linux-dataloader'],
  }

  file { '/usr/lib64/libclntsh.so':
    ensure => 'link',
    target => '/usr/lib/oracle/12.1/client64/lib/libclntsh.so.12.1',
  }

}
