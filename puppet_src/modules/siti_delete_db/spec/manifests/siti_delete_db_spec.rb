require_relative '../../../../spec_helper.rb'

describe 'siti_delete_db', :type => :class do
  it do
    should contain_file('/opt/siti-delete-db').with(
      'ensure' => 'directory',
      )
    should contain_package('capd-siti-delete-db').with(
      'ensure'   => 'latest',
      )
    should contain_file('/opt/siti-delete-db/run_psql_scripts.sh').with_ensure('present')
  end
end