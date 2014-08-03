require_relative '../../../../spec_helper.rb'

describe 'oracledb::package', :type => :class do
  it do
    should contain_file('oracle-rdbms-server')
    should contain_exec('install prereq')
    should contain_exec('wget part 1of2')
    should contain_exec('extract part 1of2')
    should contain_exec('setACL')
    should contain_file('/etc/oraInst.loc')
    should contain_file('/etc/defra_response_file.rsp')
    should contain_file('/etc/netca.rsp')
    should contain_exec('installOracleDB')
    should contain_exec("run root.sh script")
    should contain_exec('installOracleNetListener')
    should contain_file('/etc/profile.d/oracle_profile.sh')
    should contain_file('/home/oracle/flush_shared_pool.sh').with_content(/sqlplus -s system\/CAPD_AUTH@capd as sysdba <<EOF/)
  end
end