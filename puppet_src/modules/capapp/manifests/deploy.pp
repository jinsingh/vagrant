# Class to deploy the Siti Agri WAR files to the Tomcat app servers.
class capapp::deploy {

$capd_oracle_sid = hiera('capd-oracle-sid')
$capd_oracle_ip = hiera('caporacledb-ip-host')
$capd_capapp_ip = hiera('capapp-ip-host')
$caporacledb_hostname = hiera('caporacledb-hostname')
$abaco_db_siti_password = hiera('abaco-db-siti-password')
$abaco_db_sitiknow_password = hiera('abaco-db-sitiknow-password')
$abaco_db_sitiknow_apps_password = hiera('abaco-db-sitiknow-apps-password')
$abaco_db_fascicolo_password = hiera('abaco-db-fascicolo-password')
$abaco_db_pams_password = hiera('abaco-db-pams-password')

$tomcat_location = hiera('tomcat-location','/var/lib/tomcat6')

  if $tomcat_location != '/var/lib/tomcat6'{
    file { '/var/lib/tomcat6':
      ensure => 'link',
      target => $tomcat_location,
      force  => true,
    }
  }

  file { "${tomcat_location}/webapps/":
    ensure => directory,
    owner  => root,
    group  => tomcat,
    mode   => '0775',
  }

  file { "${tomcat_location}/webapps/SitiAgriApi/WEB-INF/applicationContext.xml":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/sitiagriapi-applicationContext521.xml',
  }

  file { "${tomcat_location}/webapps/estrazione/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/estrazione.log4j.properties',
  }

  file { "${tomcat_location}/webapps/fascicolo/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/fascicolo.log4j.properties',
  }

  file { "${tomcat_location}/webapps/graduatoria/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/graduatoria.log4j.properties',
  }

  file { "${tomcat_location}/webapps/pams/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/pams.log4j.properties',
  }

  file { "${tomcat_location}/webapps/schede/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/schede.log4j.properties',
  }

  file { "${tomcat_location}/webapps/domande/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/domande.log4j.properties',
  }

  file { "${tomcat_location}/webapps/servizi/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/servizi.log4j.properties',
  }

  file { "${tomcat_location}/webapps/titoli/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/titoli.log4j.properties',
  }

  file { "${tomcat_location}/webapps/mainapp/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/mainapp.log4j.properties',
  }

  file { "${tomcat_location}/webapps/siticatasto/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/siticatasto.log4j.properties',
  }

  file { "${tomcat_location}/webapps/SITIControlli/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/siticontrolli.log4j.properties',
  }

  file { "${tomcat_location}/webapps/siti-farmer/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/siti-farmer.log4j.properties',
  }

  file { "${tomcat_location}/webapps/siti-knowledge/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/siti-knowledge.log4j.properties',
  }

  file { "${tomcat_location}/webapps/siti-knowledge-metadata/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/siti-knowledge-metadata.log4j.properties',
  }

  file { "${tomcat_location}/webapps/siti-reports/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/siti-reports.log4j.properties',
  }

  file { "${tomcat_location}/webapps/SSO/WEB-INF/classes/log4j.properties":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    source  => 'puppet:///modules/capapp/sso.log4j.properties',
  }

  file { "${tomcat_location}/webapps/DbMAP_WMS/WEB-INF/web.xml":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    content => template('capapp/web-dbmap_wms.war.xml.erb'),
  }

  file { "${tomcat_location}/webapps/sitiAgriMenu/WEB-INF/web.xml":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    content => template('capapp/web-sitiagrimenu.war.xml.erb'),
  }

  file { "${tomcat_location}/webapps/siticloud/WEB-INF/applicationContext.xml":
    ensure  => present,
    owner   => 'tomcat',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    require => Package['capd-siti-tomcat'],
    content => template('capapp/web-siticloud-applicationContext.xml.erb'),
  }


}
