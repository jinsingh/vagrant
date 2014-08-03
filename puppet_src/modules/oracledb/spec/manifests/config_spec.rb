require_relative '../../../../spec_helper.rb'

describe 'oracledb::config', :type => :class do
  it do
    should contain_file('/oracle/dbhome_1/network/admin/tnsnames.ora').with_content(/caporacledb.rpa.spec/)
    should contain_file('/oracle/dbhome_1/network/admin/listener.ora').with_content(/caporacledb.rpa.spec/)
  end
end
