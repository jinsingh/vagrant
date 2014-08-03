require_relative '../../../../spec_helper.rb'

describe 'sqlplus_client::config', type: :class do
    it do
      should contain_file('/etc/ld.so.conf.d/sqlplus.conf').with(
        'ensure' => 'present',
        'source' => 'puppet:///modules/sqlplus_client/sqlplus.conf',
        'notify' => 'Exec[sqlplus_ldconfig]'
      )
      should contain_file('/home/deploy/.tnsnames.ora').with(
        'ensure' => 'present',
        'mode'   => '0600',
        'owner'  => 'deploy',
        'group'  => 'deploy',
      ).with_content(/capd=/)
      should contain_file('/root/.tnsnames.ora').with(
        'ensure' => 'present',
        'mode'   => '0600',
        'owner'  => 'root',
        'group'  => 'root',
      ).with_content(/capd=/)
      should contain_file('/usr/bin/sqlplus').with(
        'ensure' => 'link',
        'target' => '/usr/bin/sqlplus64',
      )
      should contain_exec('sqlplus_ldconfig').with(
        'refreshonly' => 'true',
        'path'        => '/sbin',
        'command'     => '/sbin/ldconfig',
      )
    end
end

