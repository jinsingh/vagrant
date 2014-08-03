require_relative '../../../../spec_helper.rb'

describe 'capddata::package', :type => :class do
  it do
    should contain_package('capddata').with(
      'ensure'  => 'installed',
      'require' => 'Class[Repo]',
      'notify'  => [ 'Exec[capd_db_update]', 'Exec[capd_auth_db_update]' ],
      )
  end
end
