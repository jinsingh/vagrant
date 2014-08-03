require_relative '../../../../spec_helper.rb'

describe 'siti_db::deploy', :type => :class do
  it do
    should contain_file('/opt/capd-siti-oracle-config').with(
      'ensure' => 'directory',
      'owner'  => 'root',
      'group'  => 'deploy',
      'mode'   => '0777',
      )
    should contain_package('capd-siti-oracle-config').with(
      'ensure'   => 'latest',
      'require'  => 'Class[Repo]',
      'notify'   => 'Exec[sitiagri_db_update]',
      )
    should contain_file('/opt/capd-siti-oracle-config/params.xml').with(
      'ensure'  => 'present',
      )
    should contain_file('/opt/capd-siti-oracle-config/config').with(
      'ensure'  => 'directory',
      'owner'   => 'root',
      'recurse' => 'true',
      'group'   => 'deploy',
      'mode'    => '0777',
      )
    should contain_exec('sitiagri_db_update').with(
      'refreshonly' => 'true',
      'cwd'         => '/opt/capd-siti-oracle-config',
      'environment' => 'LD_LIBRARY_PATH=/oracle/dbhome_1/bin',
      'command'     => "bash -c \"/usr/bin/java -jar db-update-1.2.jar -upd-dir scripts 2>&1 | tee >(logger -t SITIDB -p daemon.info)\"",
    )
  end
end
