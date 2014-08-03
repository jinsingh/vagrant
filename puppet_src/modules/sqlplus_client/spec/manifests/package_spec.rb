require_relative '../../../../spec_helper.rb'

describe 'sqlplus_client::package', type: :class do
  it do
    should contain_package('oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64').with(
      'ensure'  => 'installed',
      'require' => 'Class[Repo]',
    )
    should contain_package('oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64').with(
      'ensure'  => 'installed',
      'require' => 'Class[Repo]',
    )
  end
end

