# == Node: vagrant
#
#  A 'bootstrap' for a box in vagrant
#
#  Puppet setting up Puppet... very inception
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
#  na
#
# === Authors
#
# Peter Souter, peterso@kainos.com
#
# === Copyright
#
# DEFRA
#
node default {

  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    logoutput=>on_failure,
  }

  file { '/etc/resolv.conf':
    ensure  => file,
    content => 'nameserver 8.8.8.8'
  }

  case $::osfamily {
    'RedHat': {

      include epel

      Package {
        require => Class['epel']
      }

      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD-DEV':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/repo/RPM-GPG-KEY-CAPD-DEV',
      }

      repo::rpm_gpg_key{ 'CAPD-REPO-DEV':
        path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD-DEV',
        require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD-DEV'],
      }

      package { 'fpm':
        ensure   => 'latest',
        provider => gem,
      }

      package { 'hiera-eyaml':
        ensure   => 'latest',
        provider => gem,
      }

      include deploy

      include gpg::vagrant
    }
    default: {}
  }

  if ($hostname =~ /management/) or ($::osfamily == 'Darwin') {

    case $::osfamily {
      'RedHat': {
        package{ 'rpm-build': ensure => 'latest' }
        include yumrepo
        $require_stuff = [ Class['yumrepo'], File['/var/www/html/yum/x86_64/RPMS'] ]
        $rpm_location  = '/var/www/html/yum/x86_64/RPMS/'
      }
      'Darwin': {
        $require_stuff = Exec['rsync --help']
        $rpm_location  = '/tmp/'
      }
      default: {}
    }

    create_resources('fetch_autobuild', hiera_hash('rpm_autobuilds'), { cwd => $rpm_location })

    exec { 'rsync-over-custom-rpms':
      command => 'yes | rsync -vcr /capd-ops/vagrant_dev/custom_rpm/*.rpm /var/www/html/yum/x86_64/RPMS/
      yes | rsync -vcr /capd-ops/vagrant_dev/capd_rpms/*.rpm /var/www/html/yum/x86_64/RPMS/
      yes | rsync -vcr /capd-ops/vagrant_dev/oracle/*.zip /var/www/html/
      yes | rsync -vcr /capd-ops/vagrant_dev/oracle/*.rpm /var/www/html/',
      require => $require_stuff,
      timeout => 0,
      unless  => 'uname | grep Darwin',
    }

    exec { 'sign-off-rpms-create-repo':
      command => 'bash /capd-ops/local_rpm_generation/rpm_gpgsign.sh
      /usr/bin/createrepo --update /var/www/html/yum/x86_64/',
      timeout => 0,
      cwd     => "${rpm_location}/",
      unless  => 'uname | grep Darwin',
    }

  }

}

#
define fetch_autobuild (
  $cwd,
  $build_id,
  $build_url = "https://autobuild:8jM0kFT0er6C@defraci.kainos.com/httpAuth/repository/downloadAll/${build_id}/.lastSuccessful/",
  $timeout = 0
) {

  exec { "fetch-rpm-${title}" :
    command   => "curl -o ${title}.zip '${build_url}' && unzip -o ${title}.zip && rm -f ${title}.zip && mv ${title}_*.rpm ${title}_latest.rpm",
    creates   => "${cwd}/${title}_latest.rpm",
    logoutput => 'on_failure',
    timeout   => $timeout,
    cwd       => $cwd,
    before    => Exec['sign-off-rpms-create-repo'],
    require   => Exec['rsync-over-custom-rpms']
  }

}
