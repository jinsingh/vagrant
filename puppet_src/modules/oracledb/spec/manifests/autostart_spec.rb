require_relative '../../../../spec_helper.rb'

describe 'oracledb::autostart', :type => :class do
  it do
    should contain_file('/etc/init.d/dbora')
    should contain_exec('set dbora capd:/oracle/dbhome_1')
    should contain_exec('chkconfig dbora')
  end
end