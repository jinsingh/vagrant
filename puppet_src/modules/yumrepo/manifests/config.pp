
# Definition for creating repository
define yumrepo::create_repo () {
  exec { "create empty ${title} repo":
    command => '/usr/bin/createrepo .',
    cwd     => "/opt/mirror/${title}/",
    creates => "/opt/mirror/${title}/repodata/repomd.xml",
  }
}

# Applies generic httpd config from httpd module, purge conf.d directory
# of all manual junk and add config file for yum repo apache site.

class yumrepo::config {
  include httpd

  realize File['/etc/rsyslog.d/33-httpd.conf']

  file { '/etc/httpd/conf/httpd.conf':
    source  => 'puppet:///modules/yumrepo/httpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file { '/etc/httpd/conf.d/':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
  }

  file { '/etc/httpd/conf.d/yumrepo.conf':
    source  => 'puppet:///modules/yumrepo/yumrepo.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file { ['/var/www/html/yum', '/var/www/html/yum/x86_64', '/var/www/html/yum/x86_64/RPMS']:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'deploy',
    mode    => '0775',
    require => [User['deploy'],Group['deploy']],
  }

  file { ['/opt/mirror', '/opt/mirror/atomic', '/opt/mirror/epel', '/opt/mirror/puppetlabs-products', '/opt/mirror/puppetlabs-deps', '/opt/mirror/rpmforge', '/opt/mirror/rpmforge-extras', '/opt/mirror/rsyslog_v7', '/opt/mirror/opsview' ]:
    ensure => directory,
    mode   => '7775',
    owner  => 'root',
    group  => 'deploy',
  }

  exec { 'create empty repo':
    command => '/usr/bin/createrepo .',
    cwd     => '/var/www/html/yum/x86_64/',
    creates => '/var/www/html/yum/x86_64/repodata/repomd.xml',
  }

# Create mulitple repositories based on template

  $repo_to_create = [
    'atomic',
    'epel',
    'puppetlabs-products',
    'puppetlabs-deps',
    'rpmforge',
    'rpmforge-extras',
    'rsyslog_v7',
    'opsview'
    ]

  create_repo {$yumrepo::config::repo_to_create: }

  cron { 'repo cleanup':
    command  => 'repomanage --keep=2 --old /var/www/html/yum/x86_64/RPMS | xargs rm -f',
    user     => 'root',
    monthday => [5, 10, 15, 20, 25],
    hour     => '4',
  }

}
