require_relative '../../../../spec_helper.rb'

describe 'oracledb::database', :type => :class do
  it do
    should contain_file('/etc/dbca.rsp')
    should contain_exec('install oracle database').with(
      'command' => 'dbca -silent -responseFile /etc/dbca.rsp',
      'timeout' => 0,
      'user'    => 'oracle',
      'group'   => 'dba',

    )

  end
end
