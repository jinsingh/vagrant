require_relative '../../../../spec_helper.rb'

describe 'yumrepo::package', type: :class do
  it do
    should contain_package('createrepo').with(
      'ensure' => 'installed',
    )
    should contain_package('httpd').with(
      'ensure' => 'installed',
    )
    should contain_package('yum-utils').with(
      'ensure' => 'installed',
    )
  end
end
