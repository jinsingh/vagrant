require_relative '../../../../spec_helper.rb'

describe 'siti_sqlplus::deploy', :type => :class do
  it do
    should contain_file('/opt/siti-sqlplus').with(
      'ensure' => 'directory',
    )
    should contain_package('capd-siti-sqlplus').with('ensure'=>'latest',)
    should contain_file('/opt/siti-sqlplus/destroy_siti_db.sh').
      with_ensure('present')
    should contain_file('/opt/siti-sqlplus/run_psql_scripts.sh').
      with_ensure('present')
    should contain_file('/opt/siti-sqlplus/run_siti_auth.sh').
      with_ensure('present')
    should contain_file('/opt/siti-sqlplus/add_siti_superuser.sh').
      with_ensure('present')
    should contain_file('/opt/siti-sqlplus/siti_access_for_audit_user.sh').
      with_ensure('present')
    should contain_file('/opt/siti-sqlplus/capd_access_for_audit_user.sh').
      with_ensure('present')
    should contain_file('/opt/siti-sqlplus/run_psql_scripts_1.5_upgrade.sh').
      with_ensure('present')
  end
end


