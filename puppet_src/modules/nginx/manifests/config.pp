# Class defines base nginx.conf file, conf.d directory (included
# in base nginx.conf file. Also defines access.lua file which
# is referenced in nginx-lua.conf file
# Also temporary basic auth - to be removed later.

class nginx::config {
  case $::osfamily {
    'RedHat': {

      $external_web_address = hiera('capd-external-web-address')

      #rsyslog excluded from Atos PaaS
      if $external_web_address =~ /kainos/ {

        logrotate::file { 'nginx':
          log        => '/var/log/nginx/*log',
          options    => [ 'daily',
            'missingok',
            'rotate 52',
            'compress',
            'delaycompress',
            'notifempty',
            'create 640 nginx adm',
            'sharedscripts',
          ],
          postrotate => [' [ -f /var/run/nginx.pid ] && kill -USR1 `cat /var/run/nginx.pid` ',
            '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
          ],
        }

        file { '/etc/rsyslog.d/32-nginx.conf':
          ensure => present,
          source => 'puppet:///modules/nginx/32-nginx.conf',
        }

        include logrotate
        include rsyslog
      
      }

    }
    'Darwin': {

      exec {'create-nginx-user':
        provider => shell,
        command  => 'sudo dscl . create /Groups/nginx PrimaryGroupID 390
                     sudo dscl . create /Users/nginx UniqueID 390
                     sudo dscl . create /Users/nginx PrimaryGroupID 390
                     sudo dscl . create /Users/nginx UserShell /bin/false
                     sudo dscl . create /Users/nginx RealName nginx
                     sudo dscl . create /Users/nginx NFSHomeDirectory /usr/local/var/run/nginx
                     sudo dscl . create /Groups/nginx GroupMembership nginx',
        unless   => 'dscl . list /Users | grep -v ^_.* | grep nginx',
      }

      file {'/etc/nginx/mime.types':
        ensure  => present,
        content => template('nginx/mime.types.erb'),
      }

    }
    default: {}
  }

  file {'/etc/nginx/':
    ensure => directory,
  }

  file {'/etc/nginx/nginx.conf':
    ensure  => present,
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => File['/etc/nginx'],
  }

  file { '/etc/nginx/conf.d/':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
  }

  ->

  file { '/etc/nginx/conf.d/lua_scripts/':
    ensure => 'directory',
    purge  => true,
  }

  file { '/etc/nginx/conf.d/lua_scripts/common.lua':
    ensure => present,
    source => 'puppet:///modules/nginx/common.lua',
    }
  ->

  file { '/etc/nginx/conf.d/lua_scripts/utils.lua':
    ensure => present,
    source => 'puppet:///modules/nginx/utils.lua',
  }


  file {'/etc/nginx/conf.d/nginx-lua.conf':
      ensure  => present,
      content => template('nginx/nginx-lua.conf.erb'),
      require => File['/etc/nginx/conf.d/'],
    }

  file { '/etc/nginx/conf.d/access_control.lua':
    ensure => present,
    source => 'puppet:///modules/nginx/access_control.lua',
  }
  ->
  file { '/etc/nginx/conf.d/auth_content.lua':
    ensure  => present,
    content => template('nginx/auth_content.lua.erb'),
  }
  ->
  file { '/etc/nginx/conf.d/auth_logout_content.lua':
    ensure => present,
    source => 'puppet:///modules/nginx/auth_logout_content.lua',
  }

  file { '/etc/nginx/conf.d/ida_private_beta_token_validation.lua':
    ensure => present,
    source => 'puppet:///modules/nginx/ida_private_beta_token_validation.lua',
  }

  file { '/etc/nginx/conf.d/public-dhparam.pem':
    ensure => present,
    source => 'puppet:///modules/nginx/public-dhparam.pem',
  }

  # Below is the def of www directory containing CSS styles and custom error pages

  file { '/var/www':
    ensure  => 'directory',
    purge   => true,
    recurse => true,
  }
  ->
  file { '/var/www/error':
    ensure  => 'directory',
    source  => 'puppet:///modules/nginx/www/error',
    purge   => true,
    recurse => true,
  }
  ->
  file { '/var/www/error/css':
    ensure  => 'directory',
    source  => 'puppet:///modules/nginx/www/error/css',
    purge   => true,
    recurse => true,
  }
  ->
  file { '/var/www/robots.txt':
    ensure => present,
    source => 'puppet:///modules/nginx/robots.txt',
  }
  ->
    file {'/var/www/cache':
    ensure => directory,
  }

  if $::fqdn == 'capweb.rpa.preview' {

    file { '/etc/nginx/conf.d/htpasswd':
      source  => 'puppet:///modules/nginx/htpasswd.preview',
      owner   => '0',
      group   => '0',
      mode    => '0644',
    }

  }

  else {

    file { '/etc/nginx/conf.d/htpasswd':
      source  => 'puppet:///modules/nginx/htpasswd',
      owner   => '0',
      group   => '0',
      mode    => '0644',
    }
  }

}
