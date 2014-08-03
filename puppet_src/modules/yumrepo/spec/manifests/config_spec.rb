require_relative '../../../../spec_helper.rb'

describe 'yumrepo::config', type: :class do
  it do
    should contain_file('/etc/httpd/conf/httpd.conf').with(
      'source' => 'puppet:///modules/yumrepo/httpd.conf',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
    )
    should contain_file('/etc/httpd/conf.d/').with(
      'ensure'  => 'directory',
      'recurse' => 'true',
      'purge'   => 'true',
    )
    should contain_file('/etc/rsyslog.d/33-httpd.conf').with(
      'ensure'  => 'present',
    )
    should contain_file('/etc/httpd/conf.d/yumrepo.conf').with(
      'source' => 'puppet:///modules/yumrepo/yumrepo.conf',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
    )
    should contain_file('/var/www/html/yum').with(
      'ensure' => 'directory',
    )
    should contain_file('/var/www/html/yum/x86_64').with(
      'ensure' => 'directory',
    )
    should contain_file('/var/www/html/yum/x86_64/RPMS').with(
      'ensure' => 'directory',
    )
    should contain_file('/opt/mirror').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/atomic').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/epel').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/puppetlabs-products').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/puppetlabs-deps').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/rpmforge').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/rpmforge-extras').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_file('/opt/mirror/rsyslog_v7').with(
      'ensure' => 'directory',
      'mode'   => '7775',
      'owner'  => 'root',
      'group'  => 'deploy',
    )
    should contain_exec('create empty repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/var/www/html/yum/x86_64/',
      'creates' => '/var/www/html/yum/x86_64/repodata/repomd.xml',
    )
    should contain_exec('create empty atomic repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/atomic/',
      'creates' => '/opt/mirror/atomic/repodata/repomd.xml',
    )
    should contain_exec('create empty epel repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/epel/',
      'creates' => '/opt/mirror/epel/repodata/repomd.xml',
    )
    should contain_exec('create empty puppetlabs-products repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/puppetlabs-products/',
      'creates' => '/opt/mirror/puppetlabs-products/repodata/repomd.xml',
    )
    should contain_exec('create empty puppetlabs-deps repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/puppetlabs-deps/',
      'creates' => '/opt/mirror/puppetlabs-deps/repodata/repomd.xml',
    )
    should contain_exec('create empty rpmforge repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/rpmforge/',
      'creates' => '/opt/mirror/rpmforge/repodata/repomd.xml',
    )
    should contain_exec('create empty rpmforge-extras repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/rpmforge-extras/',
      'creates' => '/opt/mirror/rpmforge-extras/repodata/repomd.xml',
    )
    should contain_exec('create empty rsyslog_v7 repo').with(
      'command' => '/usr/bin/createrepo .',
      'cwd'     => '/opt/mirror/rsyslog_v7/',
      'creates' => '/opt/mirror/rsyslog_v7/repodata/repomd.xml',
    )
    should contain_cron('repo cleanup').with(
      'command'  => 'repomanage --keep=2 --old /var/www/html/yum/x86_64/RPMS | xargs rm -f',
      'user'     => 'root',
      'monthday' => '["5", "10", "15", "20", "25"]',
      'hour'     => '4',
    )
  end
end


