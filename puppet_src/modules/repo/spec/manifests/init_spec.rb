require_relative '../../../../spec_helper.rb'

describe 'repo', :type => :class do
  let(:facts) {{ :architecture => 'x86_64' }}
  it do
    should contain_yumrepo('Capd').with(
      'baseurl'  => 'http://10.140.0.140/yum/x86_64',
      'enabled'  => '1',
      'gpgcheck' => '1',
      'gpgkey'   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD',
      'descr'    => 'CAPD Packages - x86_64 '
    )
    should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-CAPD').with(
      'ensure' => 'present',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
      'source' => 'puppet:///modules/repo/RPM-GPG-KEY-CAPD',
    )
    should contain_yumrepo('capd-atomic').with(
      'baseurl'  => 'http://10.140.0.140/mirror/atomic',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-epel').with(
      'baseurl'  => 'http://10.140.0.140/mirror/epel',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-opsview').with(
      'baseurl'  => 'http://10.140.0.140/mirror/opsview',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-puppetlabs-products').with(
      'baseurl'  => 'http://10.140.0.140/mirror/puppetlabs-products',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-puppetlabs-deps').with(
      'baseurl'  => 'http://10.140.0.140/mirror/puppetlabs-deps',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-rpmforge').with(
      'baseurl'  => 'http://10.140.0.140/mirror/rpmforge',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-rpmforge-extras').with(
      'baseurl'  => 'http://10.140.0.140/mirror/rpmforge-extras',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
    should contain_yumrepo('capd-rsyslog_v7').with(
      'baseurl'  => 'http://10.140.0.140/mirror/rsyslog_v7',
      'enabled'  => '1',
      'gpgcheck' => '0',
    )
  end
end

